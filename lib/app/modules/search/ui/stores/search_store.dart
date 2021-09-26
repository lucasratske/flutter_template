import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/domain/entities/result.dart';
import 'package:flutter_template/app/modules/search/domain/errors/errors.dart';
import 'package:flutter_template/app/modules/search/domain/use_cases/search_by_text.dart';
import 'package:flutter_template/app/modules/search/ui/adapters/search_adapter.dart';
import 'package:mobx_triple/mobx_triple.dart';

@Injectable()
class SearchStore extends MobXStore<Failure, List<Result>> {
  final SearchByText searchByText;

  SearchStore(this.searchByText) : super([]);

  void setSearchText(String value) {
    executeEither(() => SearchAdapter.adapter(searchByText(value)),
        delay: const Duration(milliseconds: 500));
  }
}
