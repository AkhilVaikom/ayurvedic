import 'package:ayurvedic/presentation/provider/treatment_provider.dart';
import 'package:ayurvedic/presentation/routes/router_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TreatmentProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        ensureScreenSize: true,
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
      ),
    );
  }
}
