import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wefixersadmin/app/ui/global_widgets/customcard.dart';
import '../../../controllers/mainhome_controller.dart';

class MainhomePage extends GetView<MainhomeController> {
  const MainhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.power_off_rounded))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          CustomCard(
              title: "Voluntear List",
              subTitle: "List of All Voluntears",
              buttonText: "View",
              buttonAction: () {
                Get.toNamed('/voluntearlist');
              }),
          const SizedBox(
            height: 5,
          ),
          CustomCard(
              title: "Registration",
              subTitle: "Add New Voluntear",
              buttonText: "Add",
              buttonAction: () {
                Get.toNamed('/voluntearregister');
              }),
        ],
      )),
    );
  }
}
