import 'package:cinema/config/constants/environment.dart';
import 'package:cinema/domain/datasources/movies_datasource.dart';
import 'package:cinema/domain/entities/movies.dart';
import 'package:cinema/infrastructure/datasources/models/moviesdb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cinema/infrastructure/datasources/mappers/movie_mapper.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbkey,
        'lenguage': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing?');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
