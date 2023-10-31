import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService {
  final CollectionReference _videoCollection =
      FirebaseFirestore.instance.collection('Videos');

  Future<List<Map<String, String>>> getVideos() async {
    QuerySnapshot querySnapshot = await _videoCollection.get();

    List<Map<String, String>> videos = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String title = data['title'];
      String url = data['url'];
      videos.add({
        'title': title,
        'url': url,
        'videoId': doc.id,
      });
    }

    return videos;
  }
}
