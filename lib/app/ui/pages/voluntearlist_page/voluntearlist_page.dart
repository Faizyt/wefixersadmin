import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../controllers/voluntearlist_controller.dart';

class VoluntearlistPage extends GetView<VoluntearlistController> {
  const VoluntearlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Voluntears'),
      ),
      body: FutureBuilder(
        future: controller.listofVoluntears(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const GFLoader(
              type: GFLoaderType.android,
            );
          }
          return ListView.builder(
            itemCount: controller.list.value,
            itemBuilder: (context, index) {
              return ExpansionTile(
                expandedAlignment: Alignment.centerLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text(
                  controller.data[index].data['name'],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(controller.data[index].data['email']),
                trailing: const Icon(Icons.arrow_drop_down),
                children: [
                  Text("Ph#: ${controller.data[index].data['number']}"),
                  Text("Address: ${controller.data[index].data['address']}"),
                  Text("City: ${controller.data[index].data['city']}"),
                  Text("Interest: ${controller.data[index].data['interest']}"),
                  Text("Education: ${controller.data[index].data['interest']}"),
                ],
              );
            },
          );

          // return ListView.builder(
          //   itemCount: controller.data.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text(
          //         controller.data[index].data['name'],
          //         style: const TextStyle(
          //             color: Colors.black,
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       subtitle: Text(controller.data[index].data['email']),
          //       trailing: Text(controller.data[index].data['number']),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
