import 'package:app/views/widgets/homescreen_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const HomeScreenCard();
            },
          );
        },
      ),
    );
  }
}
