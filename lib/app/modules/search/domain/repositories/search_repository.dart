import 'package:dartz/dartz.dart';
import 'package:flutter_template/app/modules/search/domain/entities/result.dart';
import 'package:flutter_template/app/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Result>>> getUsers(String searchText);
}
