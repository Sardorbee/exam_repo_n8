import 'package:exam_repo_n8/services/data/network/api.dart';
import 'package:exam_repo_n8/services/data/network/countries.dart';
import 'package:exam_repo_n8/services/firebase/users_firebase.dart';
import 'package:exam_repo_n8/services/provider/country_provider.dart';
import 'package:exam_repo_n8/services/provider/db_provider.dart';
import 'package:exam_repo_n8/services/provider/map_provider.dart';
import 'package:exam_repo_n8/services/provider/tab_provider.dart';
import 'package:exam_repo_n8/services/provider/user_provider.dart';
import 'package:exam_repo_n8/ui/splash_screen/splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TabProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(UserService()),
      ),
      ChangeNotifierProvider(
        create: (context) => DatabaseProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) =>
            MapProvider(apiService: ApiService(), context: context),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => Countryprovider(
      //       apiServiceCountries: ApiServiceCountries(), context: context),
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        );
      },
    );
  }
}
