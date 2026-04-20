import 'package:web_socket_channel/web_socket_channel.dart';

import '../../hasura_connect.dart';
import '../domain/entities/connector.dart';
import '../infra/datasources/connector_datasource.dart';

///Class [WebsocketConnector] implements the interface [ConnectorDatasource]
///implements the method [websocketConnector]
class WebsocketConnector implements ConnectorDatasource {
  ///Variable [wrapper] type [WebSocketWrapper]
  final WebSocketWrapper? wrapper;

  ///[WebsocketConnector] constructor
  WebsocketConnector(this.wrapper);

  ///Responsible for
  ///connecting the websocket
  ///in case of error, throws a [ConnectionError]
  @override
  Future<Connector> websocketConnector(String url) async {
    try {
      final _wrapper = wrapper ?? _WebSocketWrapper();
      final _channelPromisse = await _wrapper.connect(url.replaceFirst('https', 'wss').replaceFirst('http', 'ws'));
      return Connector(
        _channelPromisse.stream,
        add: _channelPromisse.sink.add,
        close: _channelPromisse.sink.close,
        closeCodeFunction: () => _channelPromisse.closeCode ?? -1,
        done: _channelPromisse.sink.done,
      );
    } catch (e) {
      throw ConnectionError(
        'Websocket Error',
        request: Request(
          url: url,
          query: const Query(document: ''),
        ),
      );
    }
  }
}

///The [WebSocketWrapper] class is an abstract class acting as
///an interface.
abstract class WebSocketWrapper {
  ///Method [connect] signature
  Future<WebSocketChannel> connect(String url);
}

class _WebSocketWrapper implements WebSocketWrapper {
  @override
  Future<WebSocketChannel> connect(String url) async {
    return WebSocketChannel.connect(Uri.parse(url), protocols: ['graphql-ws']);
  }
}
