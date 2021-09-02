import 'package:flutter/material.dart';
import 'package:lightproject/resource/colors_data.dart';
import 'package:lightproject/resource/colors_tabbar_home.dart';
import 'package:lightproject/resource/dimen.dart';
import 'package:lightproject/resource/fonts_name.dart';
import 'package:lightproject/resource/fonts_size.dart';

class ThemeMaterialApp {
  final ThemeData themeData = ThemeData(
    canvasColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: ColorsData.background,
    primarySwatch: Colors.green,
    fontFamily: FontsName.regular,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimen.dialogRadius),
      ),
    ),
    dividerColor: ColorsData.divider,
    textTheme: TextTheme(
      button: TextStyle(
        color: ColorsData.textButtom,
        fontFamily: FontsName.regular,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ColorsData.background,
    ),
    dialogBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: ColorsData.appBarBackground,
      iconTheme: IconThemeData(color: ColorsData.appBarIcon),
      actionsIconTheme: IconThemeData(color: ColorsData.appBarActionIcon),
    ),
    primaryTextTheme: TextTheme(
      button: TextStyle(color: ColorsData.text),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: ColorsData.tabsIndicator, width: 4)),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: ColorsData.tabsSelected,
      unselectedLabelColor: ColorsData.tabsUnselected,
      labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: FontsName.semiBold,
          color: ColorsData.tabsSelected),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: FontsName.semiBold,
          color: ColorsData.tabsUnselected),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      // enableFeedback: false,
      selectedItemColor: ColorsTabbarHome.title,
      unselectedItemColor: ColorsTabbarHome.unselectTitle,
      selectedIconTheme: IconThemeData(
        color: ColorsData.selected,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsData.unselected,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: FontsName.semiBold,
        fontSize: FontsSize.caption,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: FontsName.semiBold,
        fontSize: FontsSize.caption,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsData.buttom,
      textTheme: ButtonTextTheme.normal,
      colorScheme: ColorScheme.dark(),
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimen.radiousButton),
        // side: BorderSide(color: ColorsData.borderButtom),
      ),
      // padding: EdgeInsets.symmetric(vertical: Dimen.paddingContentButtom),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    backgroundColor: ColorsData.background,
    brightness: Brightness.light,
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: ColorsData.fillInput,
    //   labelStyle: TextStyle(color: ColorsData.lableInput),
    //   hintStyle: TextStyle(color: ColorsData.hintInput),
    //   prefixStyle: TextStyle(color: ColorsData.iconInput),
    //   suffixStyle: TextStyle(color: ColorsData.iconInput),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(Dimen.borderInput),
    //     borderSide: BorderSide(color: ColorsData.boderInput),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(Dimen.borderInput),
    //     borderSide: BorderSide(color: ColorsData.boderInput),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(Dimen.borderInput),
    //     borderSide: BorderSide(color: ColorsData.focusBoderInput),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(Dimen.borderInput),
    //     borderSide: BorderSide(color: ColorsData.errorBoderInput),
    //   ),
    //   disabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(Dimen.borderInput),
    //     borderSide: BorderSide(color: ColorsData.boderInput),
    //   ),
    //   contentPadding: EdgeInsets.symmetric(horizontal: Dimen.paddingChildInput, vertical: 0),
    // ),
    sliderTheme: SliderThemeData(
      activeTickMarkColor: ColorsData.buttom,
      activeTrackColor: ColorsData.buttom,
      inactiveTickMarkColor: ColorsData.textSubTitle,
      inactiveTrackColor: ColorsData.textSubTitle,
      thumbColor: ColorsData.buttom,
    ),
  );
}
