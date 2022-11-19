import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:n_crypt/widgets/text_field.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../controller/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final idController = TextEditingController();
  final passwordController = TextEditingController();

  int bgMotionSensitivity = 6;
  int bgMotionSensitivityL2 = 8;
  int planetMotionSensitivity = 2;

  void login(WidgetRef ref, BuildContext context){
    ref.read(authControllerProvider.notifier).login(
      email: idController.text,
      password: passwordController.text,
      context: context
    );
    Future.delayed(const Duration(seconds: 3),(){
      Routemaster.of(context).replace('/animate');
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<AccelerometerEvent>(
        stream: accelerometerEvents,
        builder: (context, event){
          final AccelerometerEvent? acceleration = event.data;
          if(acceleration == null) {
            return Container();
          }
          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                top: acceleration.y * bgMotionSensitivityL2,
                bottom: acceleration.y * -bgMotionSensitivityL2,
                right: acceleration.x * -bgMotionSensitivityL2,
                left: acceleration.x * bgMotionSensitivityL2,
                child: Align(
                  child: Image.asset(
                    "assets/images/stars_layer_2.png",
                    height: size.height,
                    fit: BoxFit.cover,
                    //fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                top: acceleration.y * bgMotionSensitivity,
                bottom: acceleration.y * -bgMotionSensitivity,
                right: acceleration.x * -bgMotionSensitivity,
                left: acceleration.x * bgMotionSensitivity,
                child: Align(
                  child: Image.asset(
                    "assets/images/stars_layer_1.png",
                    height: size.height,
                    fit: BoxFit.cover,
                    //fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SafeArea(
                  child: Container(
                    height: size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.1,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Hello Messiah!",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 40
                                ),
                              ),
                              const Text(
                                "Login to continue.",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 25
                                ),
                              ),
                              SizedBox(height: size.height * 0.05,),
                              Hero(
                                tag: 'EARTH',
                                child: Image.asset(
                                  "assets/images/earth.png",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.05,),
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
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
