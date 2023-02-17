import 'package:flutter_animate/flutter_animate.dart';
import 'package:todoodev/app/bindings/home_binding.dart';
import 'package:todoodev/app/bindings/login_binding.dart';
import 'package:todoodev/app/bindings/settings_binding.dart';
import 'package:todoodev/app/bindings/signup_binding.dart';
import 'package:todoodev/app/bindings/welcome_binding.dart';
import 'package:todoodev/app/routes/route.dart';
import 'package:todoodev/app/ui/pages/home_page/home_page.dart';
import 'package:todoodev/app/ui/pages/login_page/login_page.dart';
import 'package:todoodev/app/ui/pages/settings_page/settings_page.dart';
import 'package:todoodev/app/ui/pages/signup_page/signup_page.dart';
import 'package:todoodev/app/ui/pages/welcome_page/welcome_page.dart';
import 'package:todoodev/app/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todoo Dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        //  primarySwatch: Colors.blue,
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: fontColor,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: mainColor),
        //set default text color to fontColor
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: fontColor),
          bodyMedium: TextStyle(color: fontColor),
        ),
      ),
      initialRoute: Routes.home,
      getPages: [
        GetPage(
          name: Routes.home,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.welcome,
          page: () => const WelcomePage(),
          binding: WelcomeBinding(),
        ),
        GetPage(
          name: Routes.settings,
          page: () => const SettingsPage(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: Routes.login,
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: Routes.signup,
          page: () => const SignupPage(),
          binding: SignupBinding(),
        ),
      ],
    );
  }
}
