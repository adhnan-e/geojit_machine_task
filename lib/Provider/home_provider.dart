import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Screens/login_screen.dart';

import '../Models/post_model.dart';
import '../Repositorys/post_repository.dart';
import '../Screens/home_screen.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;
  final loginForm = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  PostRepository postRepository = PostRepository();
  List<PostModel> posts = [];

  clearData() {
    userName.clear();
    password.clear();
    notifyListeners();
  }

  logIn(context) async {
    if (loginForm.currentState!.validate()) {
      if (userName.text.toString() == password.text.toString()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.horizontal,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          backgroundColor: Colors.green,
          content: Text('Successfully logged in'),
        ));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen(),
          ),
        );
        clearData();
        isLoading = true;
        posts =
            await postRepository.getPosts().then((value) {
              isLoading = false;
              return value;
            });
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.horizontal,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          backgroundColor: Colors.red,
          content: Text('Invalid credentials'),
        ));
      }
    }
  }

  logOut(context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
    );
  }
}
