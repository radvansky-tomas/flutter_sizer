part of flutter_sizer;

extension DeviceExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * Device.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's width
  double get w => this * Device.width / 100;

  /// Calculates the dp (Density pixels) depending on the device's screen size
  double get dp => (math.log(Device.width * Device.height) /
          math.log(2) *
          this /
          (Device.devicePixelRatio * (Device.width / Device.height * 4)))
      .abs();

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  @deprecated
  double get sp => this.dp;
}
