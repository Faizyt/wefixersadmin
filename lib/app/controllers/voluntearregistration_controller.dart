import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixersadmin/app/data/provider/accountauth.dart';
import 'package:wefixersadmin/app/data/provider/voluntearregistrationprovider.dart';
import 'package:wefixersadmin/app/data/services/globalservices/globalservices.dart';

class VoluntearregistrationController extends GetxController {
  var name = '';
  var email = '';
  var password = '';
  var phone = '';
  var address = '';
  var city = '';
  var interest = '';
  var education = '';
  var nameError = RxnString();
  var emailError = RxnString();
  var passwordError = RxnString();
  var phoneError = RxnString();
  var addressError = RxnString();
  var isLoading = false.obs;
  RxBool isSuccess = false.obs;

  void setName(String value) {
    name = value;
    if (value.length >= 3) {
      nameError.value = null;
    } else {
      nameError.value = 'Name must be at least 3 characters';
    }
  }

  void setEmail(String value) {
    email = value;
    if (value.isEmail) {
      emailError.value = null;
    } else {
      emailError.value = 'Enter a valid email';
    }
  }

  void setPassword(String value) {
    password = value;
    if (value.length >= 6) {
      passwordError.value = null;
    } else {
      passwordError.value = 'Password must be at least 6 characters';
    }
  }

  void setPhone(String value) {
    phone = value;
    if (value.length >= 10) {
      phoneError.value = null;
    } else {
      phoneError.value = 'Phone must be at least 10 characters';
    }
  }

  void setAddress(String value) {
    address = value;
    if (value.length >= 3) {
      addressError.value = null;
    } else {
      addressError.value = 'Address must be at least 3 characters';
    }
  }

  void setCity(String value) {
    city = value;
    if (value.length >= 3) {
      addressError.value = null;
    } else {
      addressError.value = 'City must be at least 3 characters';
    }
  }

  void setInterest(String value) {
    interest = value;
    if (value.length >= 3) {
      addressError.value = null;
    } else {
      addressError.value = 'Interest must be at least 3 characters';
    }
  }

  void setEducation(String value) {
    education = value;
    if (value.length >= 3) {
      addressError.value = null;
    } else {
      addressError.value = 'Education must be at least 3 characters';
    }
  }

  Future<bool> submit() async {
    isLoading.value = true;
    try {
      AccountAuth accountAuth = AccountAuth();

      final String id = await accountAuth.register(email, password, name);
      await Future.delayed(const Duration(seconds: 2));
      VoluntearRegistrationProvider voluntearRegistrationProvider =
          VoluntearRegistrationProvider();
      var data = {
        'name': name.toString(),
        'email': email.toString(),
        'number': phone.toString(),
        'address': address.toString(),
        'city': city.toString(),
        'interest': interest.toString(),
        'education': education.toString(),
      };
      await voluntearRegistrationProvider.registerVoluntear(data, id);
      if (image.value != null) {
        await voluntearRegistrationProvider.uploadImage(
            id, image.value!.path, name.toString());
      }
      isLoading.value = false;
      Get.back();
      Get.snackbar("Success", "Voluntear Registered Successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3));
      return true;
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }

  // function for image picker
  Rx<File?> image = Rx<File?>(null);
  Future<void> pickImage() async {
    GlobalServices.pickImageFromGallery().then((value) {
      if (value.path.isNotEmpty) {
        image.value = value;
      }
    });
  }
}
