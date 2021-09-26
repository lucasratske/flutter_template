import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/domain/entities/result.dart';
import 'package:flutter_template/app/modules/search/domain/errors/errors.dart';
import 'package:flutter_template/app/modules/search/ui/search_store.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchStore> {
  Widget _buildList(List<Result> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        return ListTile(
          leading: Hero(
            tag: item.image!,
            child: CircleAvatar(
              backgroundImage: NetworkImage(item.image!),
            ),
          ),
          title: Text(item.nickname!),
        );
      },
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return const Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorSearch) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Search"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: TextField(
              onChanged: store.setSearchText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pesquise...",
              ),
            ),
          ),
          Expanded(
            child: ScopedBuilder<SearchStore, Failure, List<Result>>(
              onState: (_, state) {
                if (state.isEmpty) {
                  return const Center(
                    child: Text('Digita alguma coisa...'),
                  );
                } else {
                  return _buildList(state);
                }
              },
              onError: (_, error) {
                return _buildError(error!);
              },
              onLoading: (_) => const Center(child: CircularProgressIndicator()),
            ),
          )
        ],
      ),
    );
  }
}
