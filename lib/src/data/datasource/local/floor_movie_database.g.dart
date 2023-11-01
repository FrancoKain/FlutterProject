// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_movie_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorMovieDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorMovieDatabaseBuilder databaseBuilder(String name) =>
      _$FloorMovieDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorMovieDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FloorMovieDatabaseBuilder(null);
}

class _$FloorMovieDatabaseBuilder {
  _$FloorMovieDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorMovieDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorMovieDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorMovieDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorMovieDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorMovieDatabase extends FloorMovieDatabase {
  _$FloorMovieDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  MovieGenreDao? _genreDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overview` TEXT NOT NULL, `poster` TEXT NOT NULL, `backDrop` TEXT NOT NULL, `rate` REAL NOT NULL, `genresIds` TEXT NOT NULL, `categories` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Genre` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }

  @override
  MovieGenreDao get genreDao {
    return _genreDaoInstance ??= _$MovieGenreDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'poster': item.poster,
                  'backDrop': item.backDrop,
                  'rate': item.rate,
                  'genresIds': _genresConverter.encode(item.genresIds),
                  'categories': _categoryListConverter.encode(item.categories)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  @override
  Future<List<Movie>> findMoviesByCategory(String category) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Movie WHERE categories LIKE \'%\' || ?1 || \'%\'',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            title: row['title'] as String,
            rate: row['rate'] as double,
            backDrop: row['backDrop'] as String,
            poster: row['poster'] as String,
            genresIds: _genresConverter.decode(row['genresIds'] as String),
            categories:
                _categoryListConverter.decode(row['categories'] as String)),
        arguments: [category]);
  }

  @override
  Future<Movie?> findMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM Movie WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            title: row['title'] as String,
            rate: row['rate'] as double,
            backDrop: row['backDrop'] as String,
            poster: row['poster'] as String,
            genresIds: _genresConverter.decode(row['genresIds'] as String),
            categories:
                _categoryListConverter.decode(row['categories'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> deleteMovieById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Movie WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }
}

class _$MovieGenreDao extends MovieGenreDao {
  _$MovieGenreDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genreInsertionAdapter = InsertionAdapter(
            database,
            'Genre',
            (Genre item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Genre> _genreInsertionAdapter;

  @override
  Future<List<Genre>> getAllGenres() async {
    return _queryAdapter.queryList('SELECT * From Genre',
        mapper: (Map<String, Object?> row) =>
            Genre(name: row['name'] as String, id: row['id'] as int));
  }

  @override
  Future<void> deleteGenre() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Genre');
  }

  @override
  Future<void> insertGenre(Genre movieGenre) async {
    await _genreInsertionAdapter.insert(movieGenre, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _genresConverter = GenresConverter();
final _categoryListConverter = CategoryListConverter();
