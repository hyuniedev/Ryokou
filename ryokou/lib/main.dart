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
  DataController().LoadDataTour();
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
        builder: (context, state) => const Login(),
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
          final String? id = state.pathParameters['id'];
          return TourDetail(tour: DataController().findTour(id!));
        },
      ),
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      routerConfig: router,
    );
  }
}
