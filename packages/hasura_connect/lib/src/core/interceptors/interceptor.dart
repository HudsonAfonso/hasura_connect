import '../../domain/entities/response.dart';
import '../../domain/entities/snapshot.dart';
import '../../domain/errors/errors.dart';
import '../../domain/models/request.dart';
import '../../presenter/hasura_connect_base.dart';

///The [Interceptor] class is an abstract class acting as
///the interface.
abstract class Interceptor {
  ///Method [onRequest] signature
  Future<dynamic>? onRequest(Request request, HasuraConnect connect);

  ///Method [onResponse] signature

  Future<dynamic>? onResponse(Response data, HasuraConnect connect);

  ///Method [onError] signature

  Future<dynamic>? onError(HasuraError request, HasuraConnect connect);

  ///Method [onSubscription] signature

  Future<void>? onSubscription(Request request, Snapshot snapshot);

  ///Method [onConnected] signature

  Future<void>? onConnected(HasuraConnect connect);

  ///Method [onTryAgain] signature

  Future<void>? onTryAgain(HasuraConnect connect);

  ///Method [onDisconnected] signature

  Future<void>? onDisconnected();
}

///The [InterceptorBase] class is an abstract class that extends
///[Interceptor] class, acting as the interface.

abstract class InterceptorBase extends Interceptor {
  @override
  Future<void>? onConnected(HasuraConnect connect) async {}

  @override
  Future<void>? onDisconnected() async {}

  @override
  Future? onError(HasuraError request, HasuraConnect connect) async => request;

  @override
  Future? onRequest(Request request, HasuraConnect connect) async => request;

  @override
  Future? onResponse(Response data, HasuraConnect connect) async => data;

  @override
  Future<void>? onSubscription(Request request, Snapshot snapshot) async {}

  @override
  Future<void>? onTryAgain(HasuraConnect connect) async {}
}
