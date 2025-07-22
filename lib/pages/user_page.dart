import 'package:flutter/material.dart';
import 'package:travel_story/auth/auth_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // get auth service
  final authService = AuthService();

  void logout() async {
    await authService.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}