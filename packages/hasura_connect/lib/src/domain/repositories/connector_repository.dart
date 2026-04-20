import 'package:either_dart/either.dart';

import '../entities/connector.dart';
import '../errors/errors.dart';

///The [ConnectorRepository] class is an abstract class acting as
///an interface.
abstract class ConnectorRepository {
  ///Method [getConnector] signature

  Future<Either<HasuraError, Connector>> getConnector(String url);
}
