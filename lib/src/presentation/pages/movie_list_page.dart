import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/parameter/init_values.dart';
import 'package:provider/provider.dart';
import '../bloc/movie_list_page_bloc.dart';
import '../../core/utils/styles.dart';
import '../widgets/general_widgets/drawer_app.dart';
import '../widgets/movie_list_page_widgets/stream_builder_now_playing_movies.dart';
import '../widgets/movie_list_page_widgets/stream_builder_popular_movies.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  static const Color cardColor = Color(0xff2B1C2B);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late MovieListPageBloc movieListPageBloc;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies(){
    movieListPageBloc = Provider.of<InitCore>(context).movieListPageBloc;
    movieListPageBloc.initialize();
    super.didChangeDependencies();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilderNowPlayingMovies(
              nowPlayingMoviesData: movieListPageBloc.popularMoviesStream),
            StreamBuilderPopularMovies(
              popularMoviesData: movieListPageBloc.nowPlayingMoviesStream)
          ],
        ),
      ),
    );
  }
}
