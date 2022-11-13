import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/search_entity.dart';
import '../../domain/errors/errors.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_bloc_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc controller = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget _buildList(List<SearchEntity> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.avataUrl),
          ),
          title: Text(item.login),
        );
      },
    );
  }

  Widget _buildError(FailureSearch error) {
    if (error is EmptyList) {
      return const Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorState) {
      return const Center(
        child: Text('Erro no github'),
      );
    } else {
      return const Center(
        child: Text('Erro interno'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Github Search"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: TextField(
                onChanged: (value) => controller.mapEventToState(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Pesquise...",
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is ErrorState) {
                    return _buildError(state.error);
                  }

                  if (state is StartState) {
                    return const Center(
                      child: Text('Digita alguma coisa...'),
                    );
                  } else if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SuccessState) {
                    return _buildList(state.list);
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
