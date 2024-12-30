import 'package:cinema/domain/entities/actor.dart';
import 'package:cinema/presentation/providers/actors/actors_repository_providider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMoviesNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMoviesNotifier(getActors: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMoviesNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;
  ActorsByMoviesNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
