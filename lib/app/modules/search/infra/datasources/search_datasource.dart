import '../models/search_model.dart';

abstract class SearchDataSource {
  Future<List<SearchModel>> search(String searchText);
}
