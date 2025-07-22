import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_story/auth/auth_service.dart';
import 'package:travel_story/modals/user_modal.dart';
import 'package:travel_story/pages/welcome_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // get auth service
  final authService = AuthService();
  Map<String, dynamic>? userProfile;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final profile = await authService.getUserProfile();
      setState(() {
        userProfile = profile;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading profile: $e')),
        );
      }
    }
  }

  void _editProfile() {
    // Navigate to edit profile page
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const UserModal(),
    ).then((_) {
      _loadUserProfile();
    });
  }

  void logout() async {
    await authService.signOut();
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const WelcomePage())
    );
  }
  
  Widget _buildProfileImage() {
    final imageUrl = userProfile?['profile_image_url'];
    
    if (imageUrl != null && imageUrl.toString().isNotEmpty) {
      // Use network image
      return CircleAvatar(
        radius: 80,
        backgroundColor: Colors.grey[300],
        child: CircleAvatar(
          radius: 78,
          backgroundImage: NetworkImage(imageUrl),
          onBackgroundImageError: (exception, stackTrace) {
            // Will fall back to default asset image below
          },
          backgroundColor: Colors.transparent,
        ),
      );
    } else {
      // Use default asset image
      return CircleAvatar(
        radius: 80,
        backgroundColor: Colors.grey[300],
        child: CircleAvatar(
          radius: 78,
          backgroundImage: const AssetImage('assets/default-avatar.jpg'),
          backgroundColor: Colors.transparent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xFF4CB9E7),
          ),
        ),
      );
    }

    final username = userProfile?['username'] ?? 'Unknown User';
    final email = userProfile?['email'] ?? 'No email';

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Section
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Image
                    _buildProfileImage(),
                    
                    const SizedBox(height: 24),
                    
                    // Username
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Email
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF939393),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Edit Profile Button
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _editProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CB9E7),
                          foregroundColor: Color(0xFF2E2E2E),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Logout Button
            Padding(
              padding: const EdgeInsets.all(32),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: logout,
                  icon: const PhosphorIcon(
                    PhosphorIconsBold.signOut,
                    color: Color(0xFF2E2E2E),
                    size: 20,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2E2E2E),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B6B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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