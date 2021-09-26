import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/domain/entities/result.dart';
import 'package:flutter_template/app/modules/search/domain/errors/errors.dart';
import 'package:flutter_template/app/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_template/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutter_template/app/modules/search/infra/models/result_model.dart';
part 'search_repository_impl.g.dart';

@Injectable(singleton: false)
class SearchRepository with SearchRepositoryAbstract {
  final SearchDatasource datasource;

  SearchRepository(this.datasource);

  @override
  Future<Either<Failure, List<Result>>> getUsers(String searchText) async {
    List<ResultModel>? list;

    try {
      list = (await datasource.searchText(searchText))!.cast<ResultModel>();
    } catch (e) {
      return left(ErrorSearch());
    }

    return right(list);
  }
}
