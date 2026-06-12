import 'package:flutter/material.dart';

EdgeInsets pLeft(double value) => EdgeInsets.only(left: value);

EdgeInsets pTop(double value) => EdgeInsets.only(top: value);

EdgeInsets pRight(double value) => EdgeInsets.only(right: value);

EdgeInsets pBottom(double value) => EdgeInsets.only(bottom: value);

EdgeInsets pSymmetricH(double value) => EdgeInsets.symmetric(horizontal: value);

EdgeInsets pSymmetricV(double value) => EdgeInsets.symmetric(vertical: value);

EdgeInsets pSymmetricHV(double h, double v) =>
    EdgeInsets.symmetric(horizontal: h, vertical: v);
