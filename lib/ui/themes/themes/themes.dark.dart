import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/ui/themes/colors.dart';
import 'package:pokedex/ui/themes/styles.dart';
import 'package:pokedex/ui/themes/themes.dart';
import 'package:pokedex/ui/themes/typography.dart';

class DarkAppTheme extends AppTheme {
  const DarkAppTheme()
      : super(
          name: 'dark',
          brightness: Brightness.dark,
          colors: const AppThemeColors(
            primarySwatch: Colors.red,
            primary: AppColors.red,
            secondary: AppColors.indigo,
            accent: Color(0xFF27C754),
            background: AppColors.white,
            backgroundDark: AppColors.whiteGrey,
            disabled: AppColors.grey,
            information: AppColors.indigo,
            success: AppColors.lightGreen,
            alert: AppColors.yellow,
            warning: AppColors.orange,
            error: AppColors.red,
            text: AppColors.black,
            border: AppColors.lightGrey,
            hint: AppColors.lightGrey,
          ),
          typographies: const AppThemeTypography(
            headingLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            heading: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
            headingSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            bodyExtraLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            body: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            bodySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            bodyExtraSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            captionLarge: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            caption: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            captionSmall: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          styles: const AppThemeStyles(
            cardShadow: [
              BoxShadow(
                color: Color(0x0D323247),
                offset: Offset(0, 3),
                blurRadius: 8,
                spreadRadius: -1,
              ),
              BoxShadow(
                color: Color(0x400C1A4B),
                offset: Offset.zero,
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
            buttonSmall: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              minimumSize: MaterialStatePropertyAll(Size.zero),
            ),
            buttonMedium: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              minimumSize: MaterialStatePropertyAll(Size.zero),
            ),
            buttonLarge: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              minimumSize: MaterialStatePropertyAll(Size.zero),
            ),
            buttonText: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              padding: MaterialStatePropertyAll(EdgeInsets.zero),
              splashFactory: NoSplash.splashFactory,
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
          ),
        );
}
