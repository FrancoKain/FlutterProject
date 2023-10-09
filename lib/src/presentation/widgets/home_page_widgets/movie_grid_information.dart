import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import '../../pages/detail_movie_page.dart';
import '../general_widgets/circle_reveal_clipper.dart';

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
  static const Key gridViewNavigation = Key('GridViewNavigateToDetails');
  static const Key gridCachedImage = Key(
    'gridImageKey',
  );
  static const Key floatingButtonKey = Key(
    'floatingButtonAnimation',
  );
  static const double initialAnimationHeight = 0;
  late double animationFinalHeight = animationHeight * 0.75;
  late double animationRadius = animationHeight * 0.9;
  static const double paddingValue = 10.0;
  static const double sizeBoxHeight = 100;
  static const double positionatedSizeBoxHeight = 30;

  static const double positionatedSizeBoxWidth = 30;

  static const int movieOverviewMaxLines = 5;

  static const int durationOfAnimation = 200;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: gridViewNavigation,
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
          height: sizeBoxHeight,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CachedNetworkImage(
                key: gridCachedImage,
                fit: BoxFit.cover,
                imageUrl: widget.movie.fullPosterPath,
              ),
              ClipPath(
                clipper: CircleRevealClipper(
                  center: offset,
                  radius: animationRadius,
                ),
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  height: _selected ? animationHeight : initialAnimationHeight,
                  width: animationWidth,
                  child: Container(
                    color: Colors.black45,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        paddingValue,
                      ),
                      child: Center(
                        child: Text(
                          widget.movie.overview,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: movieOverviewMaxLines,
                        ),
                      ),
                    ),
                  ),
                  duration: const Duration(
                    milliseconds: durationOfAnimation,
                  ),
                ),
              ),
              Positioned(
                bottom:
                    _selected ? animationFinalHeight : initialAnimationHeight,
                child: SizedBox(
                  width: positionatedSizeBoxWidth,
                  height: positionatedSizeBoxHeight,
                  child: FloatingActionButton(
                      key: floatingButtonKey,
                      heroTag: widget.movie.id,
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
