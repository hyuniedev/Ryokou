import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/IDataRefresh.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/controller/controller_page.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/sections/appbar/child_app_bar_main_pages.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';
import 'package:ryokou/ui/sections/grid_tour/grid_tour.dart';

class FavoritePage extends StatefulWidget implements IDataRefresh {
  FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePage();

  @override
  void RefreshPage() {
    if (funLoadData != null) {
      funLoadData!();
    }
  }

  @override
  Function? funLoadData;
}

class _FavoritePage extends State<FavoritePage> {
  List<Tour> lsTour = [];
  List<Tour> lsTourRecomment = [];
  @override
  void initState() {
    super.initState();
    MyPageController().CurrentPage = widget;
    widget.funLoadData = getListFavorite;
    getListFavorite();
  }

  @override
  void dispose() {
    MyPageController().CurrentPage = null;
    super.dispose();
  }

  void getListFavorite() {
    setState(() {
      lsTour = DataController().getUser?.getFavoriteTours() ?? [];
      lsTourRecomment = DataController().lsTour;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                getAppBar(context, childAppBarMainPages()),
                const SizedBox(height: 30),
                Column(
                  children: [
                    (DataController().getUser != null && lsTour.isNotEmpty)
                        ? favoGridSection('Tour yêu thích của bạn ', lsTour)
                        : favoriteIsNull(context),
                    const SizedBox(height: 20),
                    favoGridSection('Đề xuất cho bạn', lsTourRecomment),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
          // Nut Dang nhap - Dang ky neu chua dang nhap
          DataController().getUser == null
              ? Container(
                  color: Colors.white.withOpacity(0.95),
                  height: 100,
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          context.go('/login');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: AppColors.primaryColor)),
                          child: const Center(
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            context.push('/register');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor,
                            ),
                            child: const Center(
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Container favoGridSection(String title, List<Tour> tours) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GridTour(tours: tours),
        ],
      ),
    );
  }

  Container favoriteIsNull(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/image/favou_img.png'),
          const Text(
            'Tour yêu thích của bạn đang trống!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'Hãy khám phá Ryokou và chọn tour yêu thích của bạn.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
