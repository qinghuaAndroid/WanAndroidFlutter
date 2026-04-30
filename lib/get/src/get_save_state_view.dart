import 'package:flutter/cupertino.dart';

/// @class : GetCommonView
/// @name : jhf
/// @description :可持久化保存GetxController状态的Widget基类,用于绑定Controller
/// 由于在TabBarView中切换页面会导致状态重置，从而GetxController销毁
/// 再次切换时需要重新拉取所有信息，体验非常差，因此需要继承AutomaticKeepAliveClientMixin
/// 来达到拦截状态销毁的目的
abstract class GetSaveView<T extends ChangeNotifier> extends StatefulWidget {
  const GetSaveView({super.key});

  String? get tag => null;

  ///widget生命周期
  ValueChanged<AppLifecycleState>? get lifecycle => null;

  @protected
  Widget build(BuildContext context);

  @override
  GetSaveViewState<T> createState() => GetSaveViewState<T>();
}

/// @class : AutoDisposeState
/// @name : jhf
/// @description :基类,可自动装载的状态管理
class GetSaveViewState<T extends ChangeNotifier> extends State<GetSaveView<T>>
    with AutomaticKeepAliveClientMixin<GetSaveView<T>>, WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle?.call(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
