import 'package:flutter/material.dart';
import '../bloc/top_rated_movies_bloc.dart';
import '../widgets/general_widgets/drawer_app.dart';

import '../../core/utils/styles.dart';
import '../widgets/home_page_widgets/stream_builder_top_rated_movies.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TopRatedMoviesBloc topRatedMoviesBloc = TopRatedMoviesBloc();
  @override
  void initState() {
    topRatedMoviesBloc.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          MyAppStyles.appTitle,
          style: TextStyle(color: Colors.white54),
        ),
        backgroundColor: Colors.black45,
      ),
      drawer: const DrawerApp(),
      backgroundColor: MyAppStyles.backgroundColor,
      body: StreamBuilderTopRatedMovies(
        topRatedMoviesBloc: topRatedMoviesBloc,
        topRatedMoviesData: topRatedMoviesBloc.topRatedMoviesStream,
      ),
    );
  }
}
