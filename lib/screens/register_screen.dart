import 'package:app_earn_money/controllers/auth_controller.dart';
import 'package:app_earn_money/models/button_models.dart';
import 'package:app_earn_money/models/textfild_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authController = Get.put(AuthController());
  bool isVisibility = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 450,
            height: 700,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0x665ac18e),
                  Color(0x995ac18e),
                  Color(0xcc5ac18e),
                  Color(0xff5ac18e)
                ])),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/logo1.png",
                            color: Colors.green,
                            width: 250,
                            height: 250,
                          ),
                          const Positioned(
                            width: 250,
                            bottom: 0,
                            child: Text("Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextfildModels(
                            hint: "Email",
                            icon: Icons.email,
                            controller: emailController,
                            iconHide: Icons.signal_cellular_null,
                            colors: Colors.white,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextfildModels(
                            hint: "Password",
                            icon: Icons.lock,
                            isPassword: isVisibility,
                            controller: passController,
                            iconHide: Icons.visibility,
                            colors: Colors.white,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Confirm Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextfildModels(
                              hint: "Confirm Password",
                              icon: Icons.lock,
                              isPassword: isVisibility,
                              controller: confirmController,
                              iconHide: !isVisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              colors: Colors.black45,
                              onPressed: () {
                                setState(() {
                                  isVisibility = !isVisibility;
                                });
                              }),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        height: 45,
                        width: double.infinity,
                        child: ButtonModels(
                            title: "Register",
                            onPressed: () {
                              authController.signUp(
                                  emailController.text.trim(),
                                  passController.text.trim(),
                                  confirmController.text.trim());
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Register?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            child: const Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
