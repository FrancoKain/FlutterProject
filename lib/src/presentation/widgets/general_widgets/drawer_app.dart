import 'package:flutter/material.dart';

import '../../pages/home_page.dart';
import '../../pages/movie_list_page.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  static const String homeText = "Home";
  static const String popularMoviesText = "Popular Movies";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black45,
      child: ListView(
        children: [
          ListTile(
            title: const Text(
              homeText,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              popularMoviesText,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MovieListPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
