import 'package:dartz/dartz.dart';

import '../entities/search_entity.dart';
import '../errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<SearchEntity>>> search(
      String searchText);
}
