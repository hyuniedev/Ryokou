import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/generalContainer.dart';
import 'package:ryokou_service/ui/item/itemListGeneral.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

class ListTour extends StatefulWidget {
  const ListTour({super.key});

  @override
  State<ListTour> createState() => _ListTourState();
}

class _ListTourState extends State<ListTour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  getAppBar(
                    context,
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      
                      child: SizedBox(
                        height: 50.0,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                size: 30,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    haveLeading: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Danh sách Tour',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: GeneralContainer(
                      child: Column(
                        children: [
                          ItemListGeneral(
                            name: 'Ngắm hoa anh đào tại Tokyo',
                            isLine: true,
                            isListTour: true,
                          ),
                          ItemListGeneral(
                            name: 'Tham quan công viên Tokyo',
                            isLine: true,
                            isListTour: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 16.0, 
                right: 16.0, 
                child: SizedBox(
                  width: 64, 
                  height: 64, 
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/newTour');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40, 
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
