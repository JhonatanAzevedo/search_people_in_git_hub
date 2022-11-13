import 'package:dartz/dartz.dart';

import '../../domain/entities/search_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource datasource;

  SearchRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureSearch, List<SearchEntity>>> search(
      String searchText) async {
    try {
      final result = await datasource.search(searchText);
      return Right(result);
    } catch (e) {
      return left(
        DatasourceError(mensagem: 'error'),
      );
    }
  }
}
