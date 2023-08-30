import 'package:flutter/material.dart';
import 'pages/movie_list_page.dart';
import 'utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: MyAppStyles.appTitle,
      debugShowCheckedModeBanner: false,
      home: MovieListPage(),
    );
  }
}
