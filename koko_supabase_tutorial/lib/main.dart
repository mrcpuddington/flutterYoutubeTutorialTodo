import 'package:flutter/material.dart';
import 'package:koko_supabase_tutorial/note_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
    url: "https://qtqrdegwibiptljgcqpj.supabase.co",
    anonKey: "sb_publishable_K4_RYG0gtcUsXSOaR31JFw_zCrZ_oiE",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotePage(),
    );
  }
}