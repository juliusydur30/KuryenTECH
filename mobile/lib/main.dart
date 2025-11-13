import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/auth/login_page.dart';
import 'screens/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://swnzgvpbakecusuzeanj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN3bnpndnBiYWtlY3VzdXplYW5qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI5NDkxNjAsImV4cCI6MjA3ODUyNTE2MH0.2Cr_Sv3ydv2RtVLQqxldcNxy81AWxpFIK4KRDoVEZhg',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KuryenTECH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFF2C2C2C),
      ),
      home: supabase.auth.currentSession != null
          ? const HomePage()
          : const LoginPage(),
    );
  }
}