import 'package:app/views/widgets/header.dart';
import 'package:app/views/widgets/homescreen_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return HomeScreenCard();
        },
      ),
    );
  }
}
