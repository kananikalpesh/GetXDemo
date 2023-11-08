part of sizer;

class SizerUtil {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Scaled Height based on Aspect Ratio. use this when you don't need to fit content into height
  static late double scaledHeight;

  /// Device's Width
  static late double width;

  /// Device's Scaled Width based on Aspect Ratio. use this when you don't need to fit content into height
  static late double scaledWidth;

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    // Sets box constraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;

      // Here I have used 2.22 because the app has been tested on device having 2.22 AR
      scaledHeight = height *
          (2.22 / (boxConstraints.maxHeight / boxConstraints.maxWidth));
      scaledWidth =
          width * ((boxConstraints.maxHeight / boxConstraints.maxWidth) / 2.22);
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }

    // Sets ScreenType
    if (Platform.isAndroid || Platform.isIOS) {
      if ((orientation == Orientation.portrait && width < 600) ||
          (orientation == Orientation.landscape && height < 600)) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    }
  }

  //for responsive web
  static getWebResponsiveSize({smallSize, mediumSize, largeSize}) {
    return width < 600
        ? smallSize //'phone'
        : width >= 600 && width <= 1024
            ? mediumSize //'tablet'
            : largeSize; //'desktop';
  }
}

/// Type of Device
///
/// This can be either mobile or tablet
enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }
