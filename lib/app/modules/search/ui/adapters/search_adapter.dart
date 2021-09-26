import 'package:dartz/dartz.dart';
import 'package:flutter_template/app/modules/search/domain/entities/result.dart';
import 'package:flutter_template/app/modules/search/domain/errors/errors.dart';
import 'package:mobx_triple/mobx_triple.dart';

class SearchAdapter implements EitherAdapter<Failure, List<Result>> {
  // receive an usecase in constructor
  final Either<Failure, List<Result>> usecase;
  SearchAdapter(this.usecase);

  @override
  T fold<T>(T Function(Failure l) leftF, T Function(List<Result> r) rightF) {
    return usecase.fold(leftF, rightF);
  }

  // Adapter Future Either(Dartz) to Future EitherAdapter(Triple)
  static Future<EitherAdapter<Failure, List<Result>>> adapter(
      Future<Either<Failure, List<Result>>> usecase) {
    return usecase.then((value) => SearchAdapter(value));
  }
}
