import 'package:app_earn_money/controllers/auth_controller.dart';
import 'package:app_earn_money/models/button_models.dart';
import 'package:app_earn_money/models/textfild_models.dart';
import 'package:app_earn_money/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = Get.put(AuthController());
  late String email, password = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isVisibility = true;
  bool isRememberMe = false;
  Future<void> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? "";
    password = prefs.getString('password') ?? "";
    emailController.text = email;
    passController.text = password;
    setState(() {
      isRememberMe = prefs.getBool("checkbox") ?? false;
    });

    print(isRememberMe);
  }

  @override
  void initState() {
    getEmail();
    super.initState();
  }

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
                  alignment: Alignment.center,
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
                            child: Text("Login",
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
                            iconHide: Icons.arrow_drop_down,
                            colors: Colors.white,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
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
                            iconHide: !isVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            colors: Colors.black45,
                            onPressed: () {
                              setState(() {
                                isVisibility = !isVisibility;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: isRememberMe,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  isRememberMe = value!;
                                  // print(value);
                                  // print(value);
                                });
                              },
                            ),
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ButtonModels(
                            title: "LOGIN",
                            onPressed: () {
                              _authController.signIn(
                                  emailController.text.trim(),
                                  passController.text.trim(),
                                  context,
                                  isRememberMe);
                            }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => RegisterScreen());
                            },
                            child: const Text("Sign Up",
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
