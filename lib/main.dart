import 'package:flutter/material.dart';

import 'screens/doctor_profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enzamine Patient',
      debugShowCheckedModeBanner: false,
      home: DoctorProfilePage(),
    );
  }
}
