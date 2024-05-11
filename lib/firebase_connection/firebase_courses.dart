import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static Future<Set<String>> fetchFavoriteCourses() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('favorites').get();
      Set<String> favorites = querySnapshot.docs.map((doc) => doc['title'].toString()).toSet();
      return favorites;
    } catch (e) {
      print('Error fetching favorite courses: $e');
      return {};
    }
  }

  static Future<void> addFavoriteCourse(String title, String url) async {
    try {
      await FirebaseFirestore.instance.collection('favorites').add({
        'title': title,
        'url': url,
      });
    } catch (e) {
      print('Error adding favorite course: $e');
    }
  }

  static Future<void> removeFavoriteCourse(String title) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('favorites')
          .where('title', isEqualTo: title)
          .get();
      querySnapshot.docs.forEach((doc) async {
        await doc.reference.delete();
      });
    } catch (e) {
      print('Error removing favorite course: $e');
    }
  }
}