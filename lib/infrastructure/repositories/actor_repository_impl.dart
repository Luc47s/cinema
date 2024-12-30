import 'package:cinema/domain/datasources/actors_datasource.dart';
import 'package:cinema/domain/entities/actor.dart';
import 'package:cinema/domain/repositories/actors_repository.dart';

class ActorRepositoyImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoyImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
