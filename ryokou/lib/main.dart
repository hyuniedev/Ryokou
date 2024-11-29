import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/acc/login.dart';
import 'package:ryokou/ui/acc/register.dart';
import 'package:ryokou/ui/booking/pay.dart';
import 'package:ryokou/ui/main_layout.dart';
import 'package:ryokou/ui/page/account/acc_settings.dart';
import 'package:ryokou/ui/page/account/acc_supportCenter.dart';
import 'package:ryokou/ui/page/account/change_password.dart';
import 'package:ryokou/ui/page/my_tour/tour_detail.dart';
import 'package:ryokou/ui/page/search/showTourSearch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DataController().loadDataTour();
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

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
        path: '/pay/:idTour/:numPerson/:startDay',
        builder: (context, state) {
          final String id = state.pathParameters['idTour']!;
          final int numPerson = int.parse(state.pathParameters['numPerson']!);
          final String startDay = state.pathParameters['startDay']!;
          return Pay(
              tour: TourBooked(
                  idTour: id, numPerson: numPerson, startDay: startDay));
        },
      ),
      GoRoute(
        path: '/searchTour/:text?/:from/:to/:province?',
        builder: (context, state) {
          var text = state.pathParameters['text'];
          var from = int.parse(state.pathParameters['from']!);
          var to = int.parse(state.pathParameters['to']!);
          var province = state.pathParameters['province'];
          List<Tour> lsTour = [];
          DataController().lsTour.map((tour) {
            if (text == null || text!.isEmpty) {
              text = '';
            }
            if (province == null || province!.isEmpty) {
              province = '';
            }
            if (tour.name.contains(text!) &&
                tour.city.contains(province!) &&
                int.parse(tour.cost) > from &&
                int.parse(tour.cost) < to) {
              lsTour.add(tour);
            }
          });
          return ResultSearch(lsTour: lsTour);
        },
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
