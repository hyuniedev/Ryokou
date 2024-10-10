import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/acc/login.dart';
import 'package:ryokou/ui/acc/register.dart';
import 'package:ryokou/ui/main_layout.dart';
import 'package:ryokou/ui/page/account/acc_settings.dart';
import 'package:ryokou/ui/page/account/acc_supportCenter.dart';
import 'package:ryokou/ui/page/account/change_password.dart';
import 'package:ryokou/ui/page/my_tour/tour_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const Login(),
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => Register(),
      ),
      GoRoute(
        path: '/support',
        builder: (context, state) => const AccSupportcenter(),
      ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => const AccSettings(),
      ),
      GoRoute(
        path: '/infoUser',
        builder: (context, state) => const ChangePassword(),
      ),
      GoRoute(
        path: '/tourDetail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          Tour tour = DataController().proposeTours.firstWhere(
              (tour) => id == tour.id,
              orElse: () => DataController().tour);
          return TourDetail(tour: tour);
        },
      ),
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
