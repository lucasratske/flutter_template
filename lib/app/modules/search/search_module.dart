import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/external/github_search_datasource.dart';
import 'package:flutter_template/app/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_template/app/modules/search/infra/use_cases/search.use_case.dart';
import 'package:flutter_template/app/modules/search/ui/pages/search_page.dart';
import 'package:flutter_template/app/modules/search/ui/stores/search_store.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    $SearchUseCase,
    $SearchRepository,
    $GithubSearchDatasource,
    Bind.singleton((i) => SearchStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SearchPage()),
  ];
}
