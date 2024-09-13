import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/ui/acc/login.dart';
import 'package:ryokou/ui/acc/register.dart';
import 'package:ryokou/ui/main_layout.dart';

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
        builder: (context, state) => MainLayout(index: 0),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => MainLayout(index: 1),
      ),
      GoRoute(
        path: '/favorite',
        builder: (context, state) => MainLayout(index: 2),
      ),
      GoRoute(
        path: '/mytour',
        builder: (context, state) => MainLayout(index: 3),
      ),
      GoRoute(
          path: '/account',
          builder: (context, state) => MainLayout(index: 4),
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => const Login(),
            ),
            GoRoute(
              path: 'register',
              builder: (context, state) => const Register(),
            )
          ]),
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
