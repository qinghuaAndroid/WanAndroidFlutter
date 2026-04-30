import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/ui/page/user_module/feedback_page/feedback_controller.dart';

class FeedbackPhotoSelectWidget extends GetCommonView<FeedbackController> {
  const FeedbackPhotoSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: context.watch<FeedbackController>().photoEntity.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          fit: StackFit.loose,
          textDirection: TextDirection.ltr,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () =>
                  context.read<FeedbackController>().openGallery(index),
              child: Material(
                borderRadius: BorderRadius.circular(3),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: _SelectWidget(index: index),
                ),
              ),
            ),
            Offstage(
              offstage:
                  index ==
                  context.read<FeedbackController>().photoEntity.length,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.read<FeedbackController>()
                  ..photoEntity.removeAt(index)
                  ..update(),
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: Material(
                    color: ColorStyle.color_1A2F51,
                    borderRadius: BorderRadius.circular(10),
                    child: const Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // child:
            ),
          ],
        );
      },
    );
  }
}

/// 最后一张图片显示为+号，其他图片显示为本地图片，并进行裁剪
/// [index] 当前位置
/// 此处直接创建对象是因为在增加item时UI必须要重新绘制
/// Element虚拟树层级一定会改变，所以此处直接返回一个新的Widget
class _SelectWidget extends StatelessWidget {
  const _SelectWidget({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == context.read<FeedbackController>().photoEntity.length) {
      ///最后一张一定为加号
      return Container(
        width: 80,
        height: 80,
        color: Colors.white,
        alignment: Alignment.center,
        child: const Icon(Icons.add, size: 60, color: ColorStyle.color_B8C0D4),
      );
    } else {
      ///本地图片显示并裁剪
      return ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Image.file(
          context.read<FeedbackController>().photoEntity[index],
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
