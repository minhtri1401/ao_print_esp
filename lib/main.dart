import 'package:demo/app/services/navigation_service.dart';
import 'package:demo/setup.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

var navigationService = NavigationService();
void main() {
  setupLocator();
  runApp(const MyApp());
}
