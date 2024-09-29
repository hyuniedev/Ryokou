import 'package:flutter/material.dart';
import 'package:ryokou_service/themes/colors_theme.dart';
import 'package:ryokou_service/ui/item/generalContainer.dart';
import 'package:ryokou_service/ui/item/itemListGeneral.dart';
import 'package:ryokou_service/ui/sections/appBar/top_app_bar.dart';

class ListCustomer extends StatefulWidget {
  const ListCustomer({super.key});

  @override
  State<ListCustomer> createState() => _ListTourState();
}

class _ListTourState extends State<ListCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              getAppBar(
                context,
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
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
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
                'Danh sách Khách Hàng',
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
                        name: 'Nguyễn Văn A',
                        isLine: true,
                        isListTour: false,
                      ),
                      ItemListGeneral(
                        name: 'Nguyễn Văn B',
                        isLine: true,
                        isListTour: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
