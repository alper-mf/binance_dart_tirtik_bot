import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tirtik_app/features/home/controller/home_controller.dart';
import 'package:tirtik_app/features/home/widget/data_table.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GetBuilder<HomeController>(
        id: 'homeUpdate',
        builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: MyDataTable(assetsList: controller.assetsList),
                ),
              ],
            )),
      ),
    );
  }
}
