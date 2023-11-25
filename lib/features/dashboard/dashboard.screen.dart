import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Client'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.supervised_user_circle),
          ),
        ],
      ),
    );
  }
}
