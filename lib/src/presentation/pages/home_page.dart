import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/parameter/init_values.dart';
import 'package:provider/provider.dart';
import '../bloc/top_rated_movies_bloc.dart';
import '../widgets/general_widgets/drawer_app.dart';

import '../../core/utils/styles.dart';
import '../widgets/home_page_widgets/stream_builder_top_rated_movies.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TopRatedMoviesBloc topRatedMoviesBloc;
  late InitCore init;
  @override
  void initState() {
    super.initState();
  }
  void didChangeDependencies(){
    init = Provider.of<InitCore>(context);
    topRatedMoviesBloc = Provider.of<InitCore>(context).topRatedMoviesBloc;
    topRatedMoviesBloc.initialize();
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
      drawer: Provider(
          create: (_) =>
              init,
          child: const DrawerApp()),
      backgroundColor: MyAppStyles.backgroundColor,
      body: StreamBuilderTopRatedMovies(
        topRatedMoviesData: topRatedMoviesBloc.topRatedMoviesStream,
      ),
    );
  }
}
