import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/configs/fonts.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/states/cubit/theme_cubit.dart';

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    bool isDark = themeCubit.isDark;

    var themeData = ThemeData(
      fontFamily: AppFonts.circularStd,
      textTheme: theme.textTheme.apply(
        fontFamily: AppFonts.circularStd,
        displayColor: !isDark ? AppColors.black : AppColors.lightGrey,
      ),
      scaffoldBackgroundColor: isDark ? AppColors.black : AppColors.lightGrey,
      primarySwatch: Colors.blue,
    );

    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Pokedex',
      theme: themeData,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child) {
        if (child == null) return SizedBox.shrink();

        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor = min(smallestSize / AppConstants.designScreenSize.width, 1.0);

        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: child,
        );
      },
    );
  }
}
