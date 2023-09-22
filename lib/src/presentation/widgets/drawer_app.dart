import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/movie_list_page.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black45,
      child: ListView(
        children: [
          ListTile(
            title: Text(
              "Home",
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
            title: Text(
              "Popular Movies",
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
