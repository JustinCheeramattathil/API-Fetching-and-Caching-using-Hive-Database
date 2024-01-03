import 'package:app/controllers/provider/auth_provider.dart';
import 'package:app/controllers/provider/home_provider.dart';
import 'package:app/models/home_model.dart';
import 'package:app/views/home_screen.dart';
import 'package:app/views/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(LeadAdapter().typeId)) {
    Hive.registerAdapter(LeadAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(create:(context) => HomeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Machine Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        routes: {'/home': (context) => const HomeScreen()},
      ),
    );
  }
}
