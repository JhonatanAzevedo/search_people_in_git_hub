import 'package:dio/dio.dart';
import 'package:search_people_git_hub/app/modules/search/infra/models/search_model.dart';

import '../domain/errors/errors.dart';
import '../infra/datasources/search_datasource.dart';

class SearchDataSourceImpl extends SearchDataSource {
  final Dio dio;

  SearchDataSourceImpl(this.dio);
  @override
  Future<List<SearchModel>> search(String searchText) async {
    final response = await dio.get(
        "https://api.github.com/search/users?q=${searchText.trim().replaceAll(' ', '+')}");

    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((e) => SearchModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw DatasourceError(mensagem: '');
    }
  }
}



  // TODO: caso queira mudar para o firebase usar esse exemplo de 
  //funcao para fazer a chamada apenas uma vez no firebase quando usar
  // o future em vez do stream que fica ouvindo as mudancas.

  //  @override
  // Future<List<ProductModel>> getProducts() async {
  //   var collection = firebaseFirestore.collection('products');
  //   var resultCollection = await collection.get();

  //   return resultCollection.docs.map((doc) {
  //     return ProductModel.fromMap(
  //       doc,
  //     );
  //   }).toList();
  // }