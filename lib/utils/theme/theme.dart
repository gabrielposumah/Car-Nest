import 'package:flutter/material.dart';
import 'package:product_share_suzuki/utils/theme/costume_themes/text_theme.dart';
import 'costume_themes/appbar_theme.dart';
import 'costume_themes/bottom_sheet_theme.dart';
import 'costume_themes/checkbox_theme.dart';
import 'costume_themes/chip_theme.dart';
import 'costume_themes/elevated_button_theme.dart';
import 'costume_themes/outline_button_theme.dart';
import 'costume_themes/text_field_theme.dart';

class TappTheme {
  TappTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      //fontFamily: GoogleFonts.poppins().fontFamily,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GtextTheme.lightTextTheme,
      elevatedButtonTheme: GelevatedButtonTheme.lightElevatedButtonTheme,
      chipTheme: GchipTheme.lightChipTheme,
      appBarTheme: GappBarTheme.lightAppBarTheme,
      checkboxTheme: GcheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: GbottomSheetTheme.lightBottomSheetTheme,
      outlinedButtonTheme: GoutlineButtonTheme.lightOutilineButtonTheme,
      inputDecorationTheme: GtextFormFielsTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: GoogleFonts.poppinsTextTheme().copyWith(),
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: GtextTheme.darkTextTheme,
    elevatedButtonTheme: GelevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: GchipTheme.darkChipTheme,
    appBarTheme: GappBarTheme.darkAppbarTheme,
    checkboxTheme: GcheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: GbottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: GoutlineButtonTheme.darkOutilineButtonTheme,
    inputDecorationTheme: GtextFormFielsTheme.darkInputDecorationTheme,
  );
}
