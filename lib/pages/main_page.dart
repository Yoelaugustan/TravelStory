import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_story/pages/create_page.dart';
import 'package:travel_story/pages/home_page.dart';
import 'package:travel_story/pages/user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CreatePage(),
    const UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(30),
        height: 70,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Main navigation bar
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF4CB9E7),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home Icon
                  IconButton(
                    onPressed: () => setState(() => _currentIndex = 0),
                    icon: PhosphorIcon(
                      PhosphorIconsFill.house,
                      color: _currentIndex == 0 ? Colors.white : Color(0xFF2E2E2E),
                      size: 28,
                    ),
                  ),
                  
                  // Empty space for the floating button
                  const SizedBox(width: 60),
                  
                  // Profile Icon
                  IconButton(
                    onPressed: () => setState(() => _currentIndex = 2),
                    icon: PhosphorIcon(
                      PhosphorIconsFill.user,
                      color: _currentIndex == 2 ? Colors.white : Color(0xFF2E2E2E),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            
            // Floating center button
            Positioned(
              top: -20, 
              left: MediaQuery.of(context).size.width / 2 - 60,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CB9E7),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () => setState(() => _currentIndex = 1),
                  icon: PhosphorIcon(
                    PhosphorIconsBold.plus,
                    color:  _currentIndex == 1 ? Colors.white : Color(0xFF2E2E2E),
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}