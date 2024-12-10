import 'package:flutter/services.dart';

//
//  Color maximumOrange = "#F46F4C".toColor();

// Color grey = '#696969'.toColor();
// Color grey20 = '#EEEEEE'.toColor();
// Color grey10 = bgColor;
// Color grey30 = '#D7D7D7'.toColor();
// Color lightGrey = '#F8F8F8'.toColor();
Color lightThemebgColor = "#F9F9F9".toColor();
Color darkThemebgColor = "#0F1621".toColor();
Color darkYellow = '#78B7D0'.toColor();
Color blue = '#6759FF'.toColor();
Color hintColor = '#9B9E9F'.toColor();
Color lightThemeTextColor = textColor;
Color darkThemeTextColor = regularWhite;
Color textColor = '#1A1D1F'.toColor();
Color acServiceColor = '#FFBC99'.toColor();
Color beautyServiceColor = '#CABDFF'.toColor();
Color applienceServiceColor = '#B1E5FC'.toColor();
Color paintingServiceColor = '#B5EBCD'.toColor();
Color cleaningServiceColor = '#FFD88D'.toColor();
Color plumbingServiceColor = '#CBEBA4'.toColor();
Color electronicServiceColor = '#FB9B9B'.toColor();
Color shiftingServiceColor = '#F8B0ED'.toColor();
Color salonServiceColor = '#AFC6FF'.toColor();


Color titleColor = '#172B4D'.toColor();
Color neutralShades = '#9A9FA5'.toColor();
Color regularBlack = "#000000".toColor();
Color regularWhite = "#FFFFFF".toColor();
Color fillTextField = "#F5F5F5".toColor();
Color greyButtonText = "#2F3643".toColor();
Color greyButton = "#EFEFEF".toColor();
Color textFieldHint = "#D1D3D4".toColor();
Color darkThemeContainer = "#18202E".toColor();
Color searchTextFilledColor = "#FBFBFB".toColor();
Color searchTextFieldEnableBorder = "#F2F2F2".toColor();
Color greyTextColor = "#6F767E".toColor();
Color completedButtonColor = blue.withOpacity(0.10);
Color completedButtonTextColor = blue;
Color confermButtonTextColor = "#7FC09C".toColor();
Color subTitleColorLightTheme = "#535763".toColor();
Color subTitleColorDarkTheme = "#D1D3D4".toColor();

Color confermButtonBgColor = "#ECF8F1".toColor();
Color pendingButtonTextColor = "#EB833C".toColor();
Color pendingButtonBgColor = pendingButtonTextColor.withOpacity(0.1);
Color darftButtonTextColor = "#F4CB60".toColor();
Color darftButtonBgColor = darftButtonTextColor.withOpacity(0.10);
Color lightThemeContainer = regularWhite;

/////new
Color buttonColor = darkYellow;
Color grey40 = "#6B6C71".toColor();
Color grey10 = "#F2F2F2".toColor();
Color grey20 = "#E0E0E0".toColor();
Color serviceContainerbg = "#FAFAFA".toColor();
Color addressIconbg = "#FFE9D1".toColor();
Color errorColor = "#DD3333".toColor();
Color textfieldFillColor = grey10;

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

setStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
  ));
}
