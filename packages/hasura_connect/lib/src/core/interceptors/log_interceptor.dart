// ignore_for_file: avoid_print

import '../../domain/entities/response.dart';
import '../../domain/entities/snapshot.dart';
import '../../domain/errors/errors.dart';
import '../../domain/models/request.dart';
import '../../presenter/hasura_connect_base.dart';
import 'interceptor.dart';

///The class [LogInterceptor] is responsible for creating a log
///for [onConnected], [onDisconnected] and [onTryAgain] methods
class LogInterceptor extends Interceptor {
  @override
  Future onError(HasuraError? request, HasuraConnect connect) async {
    return request;
  }

  @override
  Future onRequest(Request? request, HasuraConnect connect) async {
    return request;
  }

  @override
  Future onResponse(Response? data, HasuraConnect connect) async {
    return data;
  }

  @override
  Future<void> onSubscription(Request request, Snapshot snapshot) async {}

  @override
  Future<void> onConnected(HasuraConnect connect) async {
    print('📡HASURA CONNECT📡');
  }

  @override
  Future<void> onDisconnected() async {
    print('HASURA DISCONNECTED');
  }

  @override
  Future<void> onTryAgain(HasuraConnect connect) async {
    print('hasura trying reconnect...');
  }
}
