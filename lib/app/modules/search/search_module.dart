import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/search_repository.dart';
import 'domain/usescases/search_by_text.dart';
import 'external/search_datasource_impl.dart';
import 'infra/datasources/search_datasource.dart';
import 'infra/repositories/search_repository_impl.dart';
import 'presenter/bloc/search_bloc.dart';
import 'presenter/pages/search_page.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<Dio>(
      (i) => Dio(),
    ),
    Bind<SearchDataSource>(
      (i) => SearchDataSourceImpl(
        Dio(),
      ),
    ),
    Bind<SearchRepository>(
      (i) => SearchRepositoryImpl(
        i<SearchDataSource>(),
      ),
    ),
    Bind<SearchByText>(
      (i) => SearchByTextImpl(
        i<SearchRepository>(),
      ),
    ),
    Bind<SearchBloc>(
      (i) => SearchBloc(
        i<SearchByText>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const SearchPage(),
    ),
  ];
}
