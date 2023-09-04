import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:micro_core/micro_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with BaseApp {
  MyApp({Key? key}) : super(key: key) {
    super.registerInjections();
    super.registerRoutes();
    super.registerListener();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/login',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppLoginResolver(),
        MicroAppHomeResolver(),
      ];
}
