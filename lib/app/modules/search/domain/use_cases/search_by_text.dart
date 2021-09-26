import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/domain/entities/result.dart';
import 'package:flutter_template/app/modules/search/domain/errors/errors.dart';
import 'package:flutter_template/app/modules/search/domain/repositories/search_repository.dart';
part 'search_by_text.g.dart';

mixin SearchByText {
  Future<Either<Failure, List<Result>>> call(String textSearch);
}

@Injectable(singleton: false)
class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<Failure, List<Result>>> call(String? textSearch) async {
    if (textSearch != null && textSearch.isNotEmpty) {
      return await repository.getUsers(textSearch);
    } else {
      return const Right<Failure, List<Result>>([]);
    }
  }
}
