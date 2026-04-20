import 'package:either_dart/either.dart';
import 'package:string_validator/string_validator.dart' as validator;

import '../entities/connector.dart';
import '../errors/errors.dart';
import '../repositories/connector_repository.dart';

///The [GetConnector] class is an abstract class acting as
///an interface.
abstract class GetConnector {
  ///Method [call] signature

  Future<Either<HasuraError, Connector>> call(String url);
}

///Class [GetConnectorImpl] implements the [GetConnector] interface
///implements the method [call]
class GetConnectorImpl implements GetConnector {
  ///Variable [repository] type [ConnectorRepository]
  final ConnectorRepository repository;

  ///[GetConnectorImpl] constructor
  GetConnectorImpl(this.repository);

  ///check if the url received
  ///is valid, if it's valid, will return the repository.getConnector call
  ///otherwise, Will return a [Left] with a [InvalidRequestError] error.
  @override
  Future<Either<HasuraError, Connector>> call(String url) async {
    if (!validator.isURL(url)) {
      return Left(InvalidRequestError('Invalid URL'));
    }

    return repository.getConnector(url);
  }
}
