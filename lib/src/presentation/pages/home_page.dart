import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/utils/state.dart';
import '../bloc/top_rated_movies_bloc.dart';
import '../widgets/drawer_app.dart';
import '../widgets/movie_grid_information.dart';

import '../../core/utils/styles.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TopRatedMoviesBloc topRatedMoviesBloc = TopRatedMoviesBloc();

  late Stream<DataState> data;

  @override
  void initState() {
    topRatedMoviesBloc.initialize();
    data = topRatedMoviesBloc.topRatedMoviesStream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          MyAppStyles.appTitle,
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black45,
      ),
      drawer: DrawerApp(),
      backgroundColor: MyAppStyles.backgroundColor,
      body: StreamBuilder(
          stream: data,
          builder: (
            BuildContext context,
            AsyncSnapshot<DataState> snapshot,
          ) {
            switch (snapshot.data!.state) {
              case ResponseState.loading:
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              case ResponseState.error:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ResponseState.empty:
                return Text('we couldn find any movie.');
              case ResponseState.success:
                return GridView.builder(
                  padding: const EdgeInsets.only(top: 12.0),
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return MovieGridInformation(
                      movie: snapshot.data!.data[index],
                      genres: topRatedMoviesBloc
                          .getGenresById(snapshot.data!.data[index].genresIds),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.676,
                  ),
                );
            }
          }),
    );
  }
}
