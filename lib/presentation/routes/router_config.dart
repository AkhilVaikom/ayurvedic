import 'package:ayurvedic/presentation/routes/route_names.dart';
import 'package:ayurvedic/presentation/screens/home/home_page.dart';
import 'package:ayurvedic/presentation/screens/invoice/invoice_page.dart';
import 'package:ayurvedic/presentation/screens/login/login_page.dart';
import 'package:ayurvedic/presentation/screens/register/patient_register_page.dart';
import 'package:ayurvedic/presentation/screens/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/patient-register',
        name: RouteNames.patientRegister,
        builder: (context, state) => PatientRegisterPage(),
      ),
      GoRoute(
        path: '/invoice',
        name: RouteNames.invoice,
        builder: (context, state) => InvoicePage(),
      ),
    ],
  );
}
