import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  User? get currentUser => _supabase.auth.currentUser;

  // Sign In
  Future<AuthResponse> signInWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  // Sign Up
  Future<AuthResponse> signUpWithEmailPassword(
      String email, String password, String username, {File? profileImage}) async {
    try {
      // Sign up user with Supabase Auth
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
        }
      );

      if (response.user != null) {
        String? profileImageUrl;

        // Upload profile image if provided
        if (profileImage != null) {
          profileImageUrl = await _uploadProfileImage(
            userId: response.user!.id,
            imageFile: profileImage,
          );
        }

        // Create user profile in users table
        await _supabase.from('users').insert({
          'id': response.user!.id,
          'username': username,
          'email': email,
          'profile_image_url': profileImageUrl,
        });
      }

      return response;
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get User Profile
  Future<Map<String, dynamic>?> getUserProfile([String? userId]) async {
    try {
      final targetUserId = userId ?? currentUser?.id;
      if (targetUserId == null) return null;

      final response = await _supabase
          .from('users')
          .select('*')
          .eq('id', targetUserId)
          .maybeSingle();

      return response;
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }

  // Upload profile image to Supabase Storage
  Future<String> _uploadProfileImage({
    required String userId,
    required File imageFile,
  }) async {
    try {
      final fileExt = imageFile.path.split('.').last;
      final fileName = '$userId/profile.$fileExt';

      await _supabase.storage.from('profile-images').upload(
        fileName,
        imageFile,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: true,
        ),
      );

      // Get public URL
      final publicUrl = _supabase.storage
          .from('profile-images')
          .getPublicUrl(fileName);

      return publicUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  // Update user profile
  Future<void> updateUserProfile({
    String? username,
    File? profileImage,
  }) async {
    try {
      final userId = currentUser?.id;
      if (userId == null) throw Exception('No user logged in');

      Map<String, dynamic> updates = {};

      // Update username if provided
      if (username != null) {
        updates['username'] = username;
      }

      // Update profile image if provided
      if (profileImage != null) {
        final profileImageUrl = await _uploadProfileImage(
          userId: userId,
          imageFile: profileImage,
        );
        updates['profile_image_url'] = profileImageUrl;
      }

      // Update users table if there are changes
      if (updates.isNotEmpty) {
        await _supabase
          .from('users')
          .update(updates)
          .eq('id', userId);
      }
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }
}