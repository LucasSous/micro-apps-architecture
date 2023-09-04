import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                navigatorKey.currentState?.pushReplacementNamed('/login');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(),
    );
  }
}
