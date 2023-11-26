import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_client/features/login/components/login_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome to our LIBRARY PRO CLIENT '),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.supervised_user_circle),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(child: SvgPicture.asset("assets/login.svg")),
            SizedBox(
              width: size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    LoginInputField(
                      controller: TextEditingController(),
                      labelText: "Email address",
                      hintText: "Enter your e-mail address",
                      iconData: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    LoginInputField(
                      controller: TextEditingController(),
                      labelText: "Password",
                      hintText: "Enter your password",
                      iconData: Icons.password,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: size.width * 0.15,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Login"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
