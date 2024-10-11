import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/themes/colors_theme.dart';
import 'package:ryokou/ui/item/itemTour.dart';
import 'package:ryokou/ui/sections/appbar/child_app_bar_main_pages.dart';
import 'package:ryokou/ui/sections/appbar/top_app_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {
  List<Tour> lsTour = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListFavorite();
  }

  Future<void> getListFavorite() async {
    List<Tour> lsTourData = await DataController().getUser!.getFavoriteTours();
    setState(() {
      lsTour = lsTourData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      const SizedBox(height: 50),
                      favoGridSection(
                          'Đề xuất cho bạn', DataController().lsTour)
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
      ),
    );
  }

  Container favoGridSection(String title, List<Tour> tours) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Đề xuất cho bạn',
            style: TextStyle(
              fontSize: 21,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          gridTour(tours),
        ],
      ),
    );
  }

  GridView gridTour(List<Tour> tours) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 25,
        crossAxisSpacing: 15,
        mainAxisExtent: 255,
      ),
      itemCount: tours.length,
      itemBuilder: (context, index) => ItemTour(tour: tours[index]),
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
