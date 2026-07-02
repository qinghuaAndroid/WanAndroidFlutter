const String _assetsPath = "assets/images/3.0x/";

///圖片
String assetImage(String assetName, {String? suffix}) {
  return "$_assetsPath$assetName${suffix ?? '.png'}";
}

String assetLottie(String assetName, {String? suffix}) {
  return "$_assetsPath$assetName${suffix ?? '.json'}";
}

String assetSvg(String assetName, {String? suffix}) {
  return "$_assetsPath$assetName${suffix ?? '.svg'}";
}
