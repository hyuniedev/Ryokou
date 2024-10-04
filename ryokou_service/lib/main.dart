import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou_service/entity/tour.dart';
import 'package:ryokou_service/ui/acc/login.dart';
import 'package:ryokou_service/ui/acc/register.dart';
import 'package:ryokou_service/ui/page/listCustomer.dart';
import 'package:ryokou_service/ui/page/listTour.dart';
import 'package:ryokou_service/ui/page/newTour.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(routes: [
      GoRoute(
        path: '/listTour',
        builder: (context, state) => const ListTour(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => Login(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => NewTour(
        ),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => Register(),
      ),
      GoRoute(
        path: '/customer',
        builder: (context, state) => const ListCustomer(),
      ),
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
