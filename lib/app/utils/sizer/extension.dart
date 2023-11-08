part of sizer;

extension SizerExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * SizerUtil.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * SizerUtil.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (SizerUtil.width / 3) / 100;

  /// calculates if device has changed aspect ratio other than normal and provides responsive height
  double get hx => this * SizerUtil.scaledHeight / 100;

  /// calculates if device has changed aspect ratio other than normal and provides responsive width
  double get wx => this * SizerUtil.scaledWidth / 100;

  /// calculates if device has changed aspect ratio other than normal and provides responsive sp
  double get spx => this * (SizerUtil.scaledWidth / 3) / 100;
}
