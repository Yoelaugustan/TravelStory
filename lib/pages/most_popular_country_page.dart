import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MostPopularCountryPage extends StatefulWidget {
  const MostPopularCountryPage({super.key});

  @override
  State<MostPopularCountryPage> createState() => _MostPopularCountryPageState();
}

class _MostPopularCountryPageState extends State<MostPopularCountryPage> {
  
  // Sample data for itineraries
  final List<Map<String, dynamic>> itineraries = [
    {
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Swiss Alpine Adventure',
      'country': 'Switzerland', 
      'style': 'Adventure',
      'duration': '7 Days',
      'username': '@user123',
      'collaborators': 3,
      'likes': 12,
    },
    {
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Matterhorn Explorer',
      'country': 'Switzerland',
      'style': 'Photography', 
      'duration': '5 Days',
      'username': '@user123',
      'collaborators': 2,
      'likes': 24,
    },
    {
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Swiss Lakes Tour',
      'country': 'Switzerland',
      'style': 'Relaxation',
      'duration': '10 Days', 
      'username': '@user123',
      'collaborators': 5,
      'likes': 18,
    },
    {
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Bernese Oberland',
      'country': 'Switzerland',
      'style': 'Hiking',
      'duration': '8 Days',
      'username': '@user123', 
      'collaborators': 4,
      'likes': 15,
    },
    {
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Jungfrau Region',
      'country': 'Switzerland',
      'style': 'Cultural',
      'duration': '6 Days',
      'username': '@user123',
      'collaborators': 3,
      'likes': 21,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF2E2E2E),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Most Popular Country',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Itineraries count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '6 itineraries available',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF939393),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Itineraries List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: itineraries.length,
                itemBuilder: (context, index) {
                  final itinerary = itineraries[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Image
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              itinerary['image'],
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: const Color(0xFFE3E3E3),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xFF4CB9E7),
                                      strokeWidth: 2,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFFE3E3E3),
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: Color(0xFF939393),
                                      size: 30,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 16),
                        
                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Trip title
                              Text(
                                itinerary['title'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2E2E2E),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              
                              const SizedBox(height: 4),
                              
                              // Country
                              RichText(
                                text: TextSpan(
                                  text: 'Country: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF939393),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: itinerary['country'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 4),
                              
                              // Trip style
                              RichText(
                                text: TextSpan(
                                  text: 'Type: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF939393),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: itinerary['style'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 4),
                              
                              // Duration
                              RichText(
                                text: TextSpan(
                                  text: 'Duration: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF939393),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: itinerary['duration'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 8),
                              
                              // Bottom row with user, collaborators, likes
                              Row(
                                children: [
                                  // Username
                                  Text(
                                    'by ${itinerary['username']}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF939393),
                                    ),
                                  ),
                                  
                                  const Spacer(),
                                  
                                  // Collaborators
                                  PhosphorIcon(
                                    PhosphorIconsFill.users,
                                    size: 14,
                                    color: const Color(0xFF4CB9E7),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${itinerary['collaborators']} collaborators',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF939393),
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 4),
                              
                              // Likes
                              Row(
                                children: [
                                  const Spacer(),
                                  PhosphorIcon(
                                    PhosphorIconsFill.heart,
                                    size: 14,
                                    color: const Color.fromARGB(255, 255, 56, 56),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${itinerary['likes']} likes',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF939393),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}