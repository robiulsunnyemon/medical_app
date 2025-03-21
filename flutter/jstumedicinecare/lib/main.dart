import 'package:flutter/material.dart';
import 'package:jstumedicinecare/presentation/home_page.dart';
import 'package:provider/provider.dart';

import 'api_services/crud_api_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=> CrudMedicineProvider(),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSTU Medicine Care',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
