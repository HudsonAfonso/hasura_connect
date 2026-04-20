import 'package:either_dart/either.dart';

import '../entities/response.dart';
import '../errors/errors.dart';
import '../models/request.dart';

///The [RequestRepository] class is an abstract class acting as
///an interface.
abstract class RequestRepository {
  ///Method [sendRequest] signature

  Future<Either<HasuraError, Response>> sendRequest({required Request request});
}
