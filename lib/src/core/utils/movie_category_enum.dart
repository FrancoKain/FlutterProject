enum MovieCategory {
  popular(endpoint: "/popular", name: "popular"),
  nowPlaying(endpoint: "/now_playing", name: "nowPlaying"),
  topRated(endpoint: "/top_rated", name: "topRated");

  const MovieCategory({
    required this.endpoint,
    required this.name,
  });

  final String endpoint;
  final String name;
}
