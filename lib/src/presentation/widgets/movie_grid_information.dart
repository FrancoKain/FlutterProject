import 'package:flutter/material.dart';

import '../../core/utils/styles.dart';
import '../../domain/entities/genres.dart';
import '../../domain/entities/movie.dart';
import '../pages/detail_movie_page.dart';
import 'circle_reveal_clipper.dart';

class MovieGridInformation extends StatefulWidget {
  MovieGridInformation({
    super.key,
    required this.movie,
    required this.genres,
  });

  final Movie movie;
  final List<Genre> genres;

  @override
  State<MovieGridInformation> createState() => _MovieGridInformationState();
}

class _MovieGridInformationState extends State<MovieGridInformation> {
  bool _selected = false;
  double animationHeight = 290;
  double animationWidth = 200;
  late Offset offset = Offset(animationWidth / 2, animationHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMoviePage(
              movie: widget.movie,
              genres: widget.genres,
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MyAppStyles.movieListPageRadius,
          ),
        ),
        child: SizedBox(
          height: 100,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.movie.fullPosterPath,
                ),
              ),
              ClipPath(
                clipper: CircleRevealClipper(
                    center: offset, radius: animationHeight * 0.9),
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  height: _selected ? animationHeight : 0,
                  width: animationWidth,
                  child: Container(
                    color: Colors.black45,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          widget.movie.overview,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 5,
                        ),
                      ),
                    ),
                  ),
                  duration: Duration(
                    milliseconds: 200,
                  ),
                ),
              ),
              Positioned(
                bottom: _selected ? animationHeight * 0.75 : 0,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                      backgroundColor: Colors.black45,
                      child: Icon(
                        _selected ? Icons.arrow_downward : Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _selected ? _selected = false : _selected = true;
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
