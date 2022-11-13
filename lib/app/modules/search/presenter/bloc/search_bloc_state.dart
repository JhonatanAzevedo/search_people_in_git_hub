import '../../domain/entities/search_entity.dart';
import '../../domain/errors/errors.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class ErrorState implements SearchState {
  final FailureSearch error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
  final List<SearchEntity> list;
  const SuccessState(this.list);
}
