import 'package:cinema/domain/entities/movies.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getUpComing({int page = 1});
  Future<Movie> getMovieById(String id);
}
