part of flutter_sizer;

/// Type of Screen
///
/// This can be either mobile or tablet
enum ScreenType { mobile, tablet }

class Device {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late ScreenType screenType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Devices' devicePixelRatio
  static double get devicePixelRatio {
    // Usually 2.0
    return WidgetsBinding.instance.window.devicePixelRatio;
  }

  /// Device's Pixel density https://material.io/design/layout/pixel-density.html#pixel-density
  static double get pixelDensity {
    var density =
        devicePixelRatio * (width > height ? width / height : height / width);
    print('density - $density');
    return density;
  }

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Sets ScreenType
    if ((orientation == Orientation.portrait && width < 600) ||
        (orientation == Orientation.landscape && height < 600)) {
      screenType = ScreenType.mobile;
    } else {
      screenType = ScreenType.tablet;
    }
  }
}

class Adaptive {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  static double h(num height) => height.h;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's width
  static double w(num width) => width.w;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  static double sp(num scalablePixel) => scalablePixel.sp;

  /// Calculates the dp (Density pixels) depending on the device's screen size
  static double dp(num scalablePixel) => scalablePixel.dp;
}
