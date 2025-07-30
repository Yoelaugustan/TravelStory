import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SharedItineraryPage extends StatefulWidget {
  const SharedItineraryPage({super.key});

  @override
  State<SharedItineraryPage> createState() => _SharedItineraryPageState();
}

class _SharedItineraryPageState extends State<SharedItineraryPage> {
  
  // Sample data for shared itineraries
  final List<Map<String, dynamic>> sharedItineraries = [
    {
      'image': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Japan Cherry Blossom',
      'country': 'Japan', 
      'duration': '10 Days',
      'style': 'Cultural',
      'lastEdited': '5 days ago',
      'collaborators': 4,
      'status': 'Public',
      'sharedBy': '@sakura_traveler',
    },
    {
      'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Alpine Hiking Trail',
      'country': 'Switzerland',
      'duration': '6 Days', 
      'style': 'Adventure',
      'lastEdited': '1 week ago',
      'collaborators': 2,
      'status': 'Public',
      'sharedBy': '@mountain_explorer',
    },
    {
      'image': 'https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Italian Food Journey',
      'country': 'Italy',
      'duration': '8 Days',
      'style': 'Culinary', 
      'lastEdited': '2 days ago',
      'collaborators': 3,
      'status': 'Public',  
      'sharedBy': '@foodie_adventures',
    },
    {
      'image': 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
      'title': 'Berlin Art & Culture',
      'country': 'Germany',
      'duration': '5 Days',
      'style': 'Cultural', 
      'lastEdited': '4 days ago',
      'collaborators': 2,
      'status': 'Public',
      'sharedBy': '@berlin_guide',
    },
  ];

  void _showOptionsMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const PhosphorIcon(PhosphorIconsRegular.pencil, color: Color(0xFF4CB9E7)),
              title: const Text('Edit'),
              onTap: () {
                Navigator.pop(context);
                // Handle edit action
              },
            ),
            ListTile(
              leading: const PhosphorIcon(PhosphorIconsRegular.eye, color: Color(0xFF4CB9E7)),
              title: const Text('View'),
              onTap: () {
                Navigator.pop(context);
                // Handle share action
              },
            ),
          ],
        ),
      ),
    );
  }

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
                      'Shared Itinerary',
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
            
            // Shared Itineraries List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: sharedItineraries.length,
                itemBuilder: (context, index) {
                  final itinerary = sharedItineraries[index];
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
                              // Top row with title and menu
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      itinerary['title'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _showOptionsMenu(context, index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      child: const PhosphorIcon(
                                        PhosphorIconsRegular.dotsThreeVertical,
                                        size: 20,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                    ),
                                  ),
                                ],
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
                              
                              const SizedBox(height: 4),
                              
                              // Trip style
                              RichText(
                                text: TextSpan(
                                  text: 'Trip Style: ',
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
                              
                              const SizedBox(height: 8),
                              
                              // Last Edited
                              RichText(
                                text: TextSpan(
                                  text: 'Last Edited: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF939393),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: itinerary['lastEdited'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 4),
                              
                              // Bottom row with collaborators, status, and shared by
                              Row(
                                children: [
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
                                  
                                  const Spacer(),
                                  
                                  // Status
                                  RichText(
                                    text: TextSpan(
                                      text: 'Status: ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '${itinerary['status']}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF4CB9E7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 4),
                              
                              // Shared by
                              Row(
                                children: [
                                  const Spacer(),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Shared by: ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: itinerary['sharedBy'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF4CB9E7),
                                          ),
                                        ),
                                      ],
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