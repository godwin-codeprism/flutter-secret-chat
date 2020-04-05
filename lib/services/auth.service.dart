import 'package:calculator/main.dart';
import 'package:calculator/navigation/RouteNames.dart';
import 'package:calculator/services/navigation.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

// ignore: non_constant_identifier_names
final AuthService = new AuthServiceClass();

class AuthServiceClass {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  Stream<FirebaseUser> user; // Firebase user
  Stream<Map<String, dynamic>> profile; // Firebase user profile
  // ignore: close_sinks
  PublishSubject loading = PublishSubject();

  // Constructor
  AuthServiceClass() {
    user = _firebaseAuth.onAuthStateChanged;
    profile = user.switchMap((FirebaseUser user) {
      if (user != null) {
        return _firestore
            .collection('users')
            .document(user.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Stream.empty();
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);
    final _navService = getIt.get<NavigationService>();
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    _navService.switchTo(HomeScreenRoute);
    updateFirebaseUser(user);
    loading.add(false);
    return user;
  }

  void updateFirebaseUser(FirebaseUser user) async {
    DocumentReference ref = _firestore.collection("users").document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  FirebaseAuth getAuth() => _firebaseAuth;
}
