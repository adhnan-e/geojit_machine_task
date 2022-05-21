import '/Models/post_model.dart';
import 'package:http/http.dart';

import '../Constants/global.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    final response = await get(Uri.parse(Global.posts));
    final activity = postModelFromJson(response.body);
    return activity;
  }
}