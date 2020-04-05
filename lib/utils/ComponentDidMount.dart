import 'package:flutter/widgets.dart';

mixin ComponentDidMountMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => componentDidMount(context));
  }

  void componentDidMount(BuildContext context);
}