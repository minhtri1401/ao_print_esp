import 'package:demo/app/core/app_router.dart';
import 'package:demo/app/services/navigation_service.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, builder) {
        return MaterialApp(
          title: "Demo App",
          onGenerateRoute: AppRoute.generateRoute,
          navigatorKey: globalNavigationKey,
        );
      },
    );
  }
}
