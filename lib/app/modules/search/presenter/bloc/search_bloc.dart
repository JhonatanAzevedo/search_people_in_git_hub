import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/usescases/search_by_text.dart';
import 'search_bloc_state.dart';

class SearchBloc extends Cubit<SearchState> implements Disposable {
  final SearchByText searchByText;

  SearchBloc(this.searchByText) : super(const StartState());

  void mapEventToState(String textSearch) async {
    emit(const LoadingState());
    var result = await searchByText(textSearch);
    result.fold(
      (l) => emit(ErrorState(l)),
      (r) => emit(SuccessState(r)),
    );
  }

  @override
  void dispose() {
    close();
  }
}
