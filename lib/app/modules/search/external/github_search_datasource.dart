import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutter_template/app/modules/search/infra/models/result_model.dart';
import 'package:flutter_template/app/shared/utils.dart';
part 'github_search_datasource.g.dart';

@Injectable(singleton: false)
class GithubSearchDatasource implements SearchDatasource {
  GithubSearchDatasource();

  @override
  Future<List<ResultModel>> searchText(String textSearch) async {
    var result = await http
        .get("https://api.github.com/search/users?q=${textSearch.trim().replaceAll(' ', '+')}");
    if (result.statusCode == 200) {
      var jsonList = result.data['items'] as List;
      var list = jsonList
          .map((item) =>
              ResultModel(nickname: item['login'], image: item['avatar_url'], url: item['url']))
          .toList();
      return list;
    } else {
      throw Exception();
    }
  }
}
