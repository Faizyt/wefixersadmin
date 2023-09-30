import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Here'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Obx(() {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: controller.setEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      errorText: controller.emailError.value,
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blue), // Border when focused
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.grey), // Border when not focused
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.red), // Border when there's an error
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: controller.setPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      errorText: controller.passwordError.value,
                      prefixIcon:
                          const Icon(Icons.lock), // Icon before the input
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blue), // Border when focused
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.grey), // Border when not focused
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.red), // Border when there's an error
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  obscureText: true,
                  controller: controller.apikey,
                  decoration: InputDecoration(
                    labelText: 'API Key',
                    hintText: 'Enter your API key',
                    prefixIcon:
                        const Icon(Icons.vpn_key), // Icon before the input
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue), // Border when focused
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey), // Border when not focused
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
                    onPressed: controller.login,
                    child: controller.isLoading.value
                        ? const GFLoader(
                            duration: Duration(seconds: 3),
                            type: GFLoaderType.circle,
                          )
                        : const Text('Login'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
