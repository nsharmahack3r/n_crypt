import 'package:flutter/material.dart';
import 'package:n_crypt/screens/home_screen.dart';
import 'package:routemaster/routemaster.dart';

class LoginAnimate extends StatefulWidget {
  const LoginAnimate({Key? key}) : super(key: key);

  @override
  State<LoginAnimate> createState() => _LoginAnimateState();
}

class _LoginAnimateState extends State<LoginAnimate> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 200),(){
      Routemaster.of(context).replace('/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: 'EARTH',
      child: Image.asset(
        "assets/images/earth.png",
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
