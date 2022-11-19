import 'package:flutter/material.dart';
import 'package:n_crypt/screens/home_screen.dart';
import 'package:n_crypt/screens/login_animate.dart';
import 'package:n_crypt/screens/login_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/':(route) => MaterialPage(child:LoginScreen()),
  '/home':(route) => const MaterialPage(child: HomeScreen()),
  '/animate':(route) => const MaterialPage(child: LoginAnimate())
});

final loggedInRoute = RouteMap(routes: {
  '/':(route) => const MaterialPage(child: HomeScreen()),
  '/animate':(route) => const MaterialPage(child: LoginAnimate())
});