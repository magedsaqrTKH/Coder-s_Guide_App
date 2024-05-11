// favorites_helper.dart

import '../firebase_connection/firebase_courses.dart'; // Import FirebaseService

class FavoritesHelper {
  static Future<Set<String>> loadFavorites() async {
    // Load favorites from Firebase
    return await FirebaseService.fetchFavoriteCourses();
  }

  static void toggleFavorite(String title, String url, Set<String> favorites) {
    if (favorites.contains(title)) {
      favorites.remove(title);
      // Remove from Firebase
      FirebaseService.removeFavoriteCourse(title);
    } else {
      favorites.add(title);
      // Add to Firebase
      FirebaseService.addFavoriteCourse(title, url);
    }
  }
}