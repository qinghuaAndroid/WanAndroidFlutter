import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';

class PageStateWidget<T extends BaseGetController> extends StatefulWidget {
  final String? tag;

  final Widget child;

  const PageStateWidget({super.key, this.tag, required this.child});

  @override
  State<PageStateWidget<T>> createState() => _PageStateWidgetState<T>();
}

class _PageStateWidgetState<T extends BaseGetController>
    extends State<PageStateWidget<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, controller, child) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ///上下刷新、下拉加载控件
              Visibility(
                visible: controller.loadState == 1,
                child: widget.child,
              ),

              ///未加载前显示的动画，加载之后需要隐藏
              Visibility(
                visible: controller.loadState == 0,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.w,
                    color: Colors.black,
                  ),
                ),
              ),

              ///加载数据为空的页面
              Visibility(
                visible: controller.loadState == 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      R.assetsLottieRefreshEmpty,
                      width: 200,
                      animate: true,
                      repeat: false,
                    ),
                    Text(
                      StringStyles.refreshEmpty.tr,
                      style: Styles.style_B8C0D4_13,
                    ),
                  ],
                ),
              ),

              ///加载出错的页面
              Visibility(
                visible: controller.loadState == 3,
                child: Lottie.asset(
                  R.assetsLottieRefreshError,
                  width: 200,
                  animate: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
