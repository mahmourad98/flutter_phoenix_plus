library flutter_phoenix;

import 'package:flutter/widgets.dart';

/// Wrap your root App widget in this widget and call [Phoenix.rebirth] to restart your app.
class Phoenix extends StatelessWidget {
  ///CHILD WIDGET TO BE REBUILT
  final Widget child;
  ///DEFAULT CONSTRUCTOR
  Phoenix({Key? key, required this.child,}) : super(key: key,);

  ///WIDGET KEY
  static final ValueNotifier<Key> _key = ValueNotifier<Key>(UniqueKey(),);
  ///CHANGE KEY TO REBUILD WIDGET
  static void rebirth([BuildContext? context,]) => _key.value = UniqueKey();

  @override Widget build(BuildContext context,) {
    return ValueListenableBuilder<Key>(
      valueListenable: _key,
      builder: (_, Key value, __,) {
        return KeyedSubtree(
          key: value,
          child: child,
        );
      },
    );
  }
}
