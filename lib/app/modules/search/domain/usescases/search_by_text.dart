import 'package:dartz/dartz.dart';

import '../entities/search_entity.dart';
import '../errors/errors.dart';
import '../repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<SearchEntity>>> call(
      String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<SearchEntity>>> call(
      String searchText) async {
    return await repository.search(searchText);
  }
}
