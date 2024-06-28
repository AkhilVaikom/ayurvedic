import 'package:ayurvedic/presentation/routes/router_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          designSize: const Size(390, 844),
          ensureScreenSize: true,
          fontSizeResolver: (fontSize, instance) => fontSize / 2,
          minTextAdapt: true,
          rebuildFactor: (old, data) => old != data,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          key: const Key('app_widget'),
          builder: (context, child) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            );
          },
    );
  }
}