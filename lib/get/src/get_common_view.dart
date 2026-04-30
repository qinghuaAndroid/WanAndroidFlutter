import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// @class : GetCommonView
/// @name : jhf
/// @description :基类,用于绑定Controller
abstract class GetCommonView<T extends ChangeNotifier> extends StatefulWidget {
  const GetCommonView({super.key});

  @protected
  Widget build(BuildContext context);

  @override
  GetCommonViewState<T> createState() => GetCommonViewState<T>();
}

/// @class : AutoDisposeState
/// @name : jhf
/// @description :基类,可自动装载的状态管理
class GetCommonViewState<T extends ChangeNotifier>
    extends State<GetCommonView<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
