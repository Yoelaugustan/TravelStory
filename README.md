# 🧭 TravelStory – A Social Travel Diary App
## Overview:
Travel Memory Map is a mobile application built with Flutter that allows users to create, share, and explore personal travel experiences on an interactive world map. The app combines the fun of travel journaling with the power of social discovery by letting users log places they've visited, plan future routes, and view travel memories from others to get inspiration.

## ✨ Key Features:
1. 🧑‍🚀 User Authentication
Users can sign up and log in securely to create their personalized travel profile and store their travel data in the cloud.

2. 🗺️ Travel Memory Pins
Users can pin memorable places on a world map. Each pin includes:
- A title and description
- Photos of the location
- Date of visit
- Optional notes or ratings

## 🔍 Destination Search & Popular Picks
On the homepage, users can:
- Search for destinations they plan to visit
- View a feed of popular picks, showcasing destinations with the most user memories

## 🧭 Trip Route Planner
Users can plan their holiday by manually creating a travel route:
- Add multiple locations to form a trip itinerary
- Reorder stops to match the intended route
- See the route visualized on a map using polylines
- Save the trip with a custom name and optional photos

## 📍 Auto-Generated Route from Daily Location History
Inspired by Google Maps Timeline, the app can track a user’s location during the day (with their permission). At the end of the day, the app:
- Analyzes their movement to identify stops
- Suggests a draft travel route
- Lets the user edit, remove, or rename stops, and then publish it as a trip

## 👥 Social Travel Discovery
Users can explore routes and memories shared by others who have visited the same destination. This allows travelers to:
- Discover hidden gems
- See real-world photos and notes from fellow travelers
- Use others’ trips as references when planning their own

## 🔐 Privacy & Sharing
Each memory or trip can be:
- Private (visible only to the user)
- Friends-only
- Public (visible in search and popular picks)

## 🔧 Tech Stack:
Frontend: Flutter
Backend: Supabase (Authentication, PostgreSQL Database, Storage)
Maps & Location: Google Maps Flutter SDK, Geolocator
Others: Google Places API (for reverse geocoding & location names)
