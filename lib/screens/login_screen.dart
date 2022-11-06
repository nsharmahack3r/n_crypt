import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:n_crypt/components/text_field.dart';

import '../controller/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final idController = TextEditingController();
  final passwordController = TextEditingController();

  void login(WidgetRef ref, BuildContext context){
    ref.read(authControllerProvider.notifier).login(
      email: idController.text,
      password: passwordController.text,
      context: context
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text(
                "Hello Messiah!",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 40
                ),
              ),
                Text(
                  "Login to continue.",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 25
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100,),
            CustomTextField(controller: idController, hintText: 'email'),
            const SizedBox(height: 20,),
            CustomTextField(controller: passwordController, hintText: 'password'),
            const SizedBox(height: 20,),
            isLoading? CircularProgressIndicator():
            ElevatedButton(
                onPressed: () => login(ref, context),
                child: const Text("Enter World")),
          ],
        ),
      ),
    );
  }
}
