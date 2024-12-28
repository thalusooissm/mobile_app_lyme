import 'package:flutter/material.dart';

sealed class Dimens {
  const Dimens();

  /// General horizontal padding used to separate UI items
  static const paddingHorizontal = 20.0;

  /// General vertical padding used to separate UI items
  static const paddingVertical = 24.0;

  /// Horizontal padding for screen edges
  abstract final double paddingScreenHorizontal;

  /// Vertical padding for screen edges
  abstract final double paddingScreenVertical;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
      horizontal: paddingScreenHorizontal, vertical: paddingScreenVertical);

  static final dimensMobile = DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) => dimensMobile;

  abstract final double profilePictureSize;
}

/// Mobile dimensions
class DimensMobile extends Dimens {
  @override
  double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  double paddingScreenVertical = Dimens.paddingVertical;

  @override
  double get profilePictureSize => 64.0;
}
