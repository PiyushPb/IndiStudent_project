import 'package:flutter/material.dart';
import 'package:indistudent/core/features/home/screen/home_screen.dart';
import 'package:indistudent/landingpage.dart';
import 'package:indistudent/screen/login.dart';
import 'package:indistudent/screen/welcome_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: WelcomePage()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
});

final landingPageRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LandingPage()),
});
