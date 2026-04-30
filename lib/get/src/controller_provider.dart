import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'get_controller_inject.dart';

class ControllerProvider<T extends BaseGetController> extends StatelessWidget {
  final T Function() create;
  final Widget child;

  const ControllerProvider({
    super.key,
    required this.create,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(value: create(), child: child);
  }
}
