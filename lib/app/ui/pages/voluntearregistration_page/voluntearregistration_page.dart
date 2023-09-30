import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:wefixersadmin/app/ui/global_widgets/customtextfield.dart';
import '../../../controllers/voluntearregistration_controller.dart';
import '../../global_widgets/customheight.dart';

class VoluntearregistrationPage
    extends GetView<VoluntearregistrationController> {
  const VoluntearregistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voluntear Registration'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CustomHeight(height: 10),
              // Image Picker Widget
              Obx(
                () => controller.image.value == null
                    ? GestureDetector(
                        onTap: () async {
                          await controller.pickImage();
                        },
                        child: const CircleAvatar(
                          radius: 80,
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundImage: FileImage(controller.image.value!),
                      ),
              ),

              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setName,
                  labelText: 'Name',
                  hintText: 'Enter your Name',
                  icon: const Icon(Icons.person)),
              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setEmail,
                  labelText: 'Email',
                  hintText: 'Enter your Email',
                  icon: const Icon(Icons.email)),
              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setPhone,
                  labelText: 'Phone',
                  hintText: 'Enter your Phone',
                  icon: const Icon(Icons.phone)),
              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setCity,
                  labelText: 'City',
                  hintText: 'Enter your City',
                  icon: const Icon(Icons.location_city)),
              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setAddress,
                  labelText: 'Address',
                  hintText: 'Enter your Address',
                  icon: const Icon(Icons.location_on)),
              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setInterest,
                  labelText: 'Interest',
                  hintText: 'Enter your Interest',
                  icon: const Icon(Icons.emoji_people)),
              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setEducation,
                  labelText: 'Education',
                  hintText: 'Enter your Education',
                  icon: const Icon(Icons.school)),
              CustomHeight(height: 10),
              CustomTextField(
                  onChanged: controller.setPassword,
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  icon: const Icon(Icons.lock)),
              CustomHeight(height: 10),
              Obx(() => controller.isLoading.value
                  ? const GFLoader(
                      type: GFLoaderType.ios,
                    )
                  : GFButton(
                      onPressed: () async {
                        final check = await controller.submit();
                        if (!check) {
                          Get.snackbar('Error', 'Something went wrong');
                        }
                      },
                      text: 'Register',
                      icon: const Icon(Icons.login),
                      type: GFButtonType.outline,
                      shape: GFButtonShape.pills,
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
