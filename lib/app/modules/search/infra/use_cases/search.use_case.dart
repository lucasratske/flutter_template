import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/domain/entities/result.dart';
import 'package:flutter_template/app/modules/search/domain/errors/errors.dart';
import 'package:flutter_template/app/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_template/app/modules/search/domain/use_cases/search.use_case.dart';
part 'search.use_case.g.dart';

@Injectable(singleton: false)
class SearchUseCase implements SearchUseCaseAbstract {
  final SearchRepositoryAbstract repository;

  SearchUseCase(this.repository);

  @override
  Future<Either<Failure, List<Result>>> call(String? textSearch) async {
    if (textSearch != null && textSearch.isNotEmpty) {
      return await repository.getUsers(textSearch);
    } else {
      return const Right<Failure, List<Result>>([]);
    }
  }
}
