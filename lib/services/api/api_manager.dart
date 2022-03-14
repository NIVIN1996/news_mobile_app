import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class ApiManager {
  String url;
  Object? body;
  String? commonErrorMsg;
  String? timeoutErrorMsg;
  String? socketErrorMsg;
  String? formatErrorMsg;
  String? internalServerErrorMsg;
  String? routingMsg;
  bool routeIf401;
  late http.Response _response;
  int timeOut;

  ApiManager(
      {required this.url,
        this.body,
        this.timeOut = 15,
        this.commonErrorMsg,
        this.formatErrorMsg,
        this.socketErrorMsg,
        this.routingMsg,
        this.routeIf401 = true,
        this.timeoutErrorMsg}) {
    //default error messages for the api errors. If need to change to a custom error message, they can be changed from service
    commonErrorMsg ??= 'Something went wrong.';
    formatErrorMsg ??= 'Something went wrong.';
    internalServerErrorMsg ??= 'Internal server error.';
    routingMsg ??= 'Please log in to continue.';
    socketErrorMsg ??= 'Failed to connect to internet. Please check your internet connection.';
    timeoutErrorMsg ??= 'Your connection has timed out.';

  }

  Map<String, String> _getHeaders() {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
  }

  Future<dynamic> get(Function(Map<String, dynamic>) jsonToObjectFn) async {
    return await _callApi(http.get(Uri.parse(url), headers: _getHeaders()), jsonToObjectFn);
  }

  Future<dynamic> post(Function(Map<String, dynamic>) jsonToObjectFn) async {
    return await _callApi(http.post(Uri.parse(url), body: jsonEncode(body), headers: _getHeaders()), jsonToObjectFn);
  }

  Future<dynamic> patch(Function(Map<String, dynamic>) jsonToObjectFn) async {
    return await _callApi(http.patch(Uri.parse(url), body: jsonEncode(body), headers: _getHeaders()), jsonToObjectFn);
  }

  Future<dynamic> delete(Function(Map<String, dynamic>) jsonToObjectFn) async {
    return await _callApi(http.delete(Uri.parse(url), headers: _getHeaders()), jsonToObjectFn);
  }

  Future<dynamic> _callApi(Future httpFuture, Function(Map<String, dynamic>) jsonToObjectFn) async {
    try {
      _response = await httpFuture.timeout(Duration(seconds: timeOut));

      if (_response.statusCode != 200 && _response.statusCode != 201) {
        debugPrint("StatusCode was not 200||201");
        debugPrint(_response.body);
      }
      if (_response.statusCode == 500) {
        return jsonToObjectFn({"success": false, "statusMessage": internalServerErrorMsg});
      }

      ///return actual response if it was an OK
      return jsonToObjectFn(jsonDecode(_response.body));
    } on TimeoutException catch (_) {
      debugPrint("Timeout Exception");
      return jsonToObjectFn({"success": false, "statusMessage": timeoutErrorMsg});
    } on FormatException catch (_) {
      debugPrint("Format Exception");
      debugPrint(_response.body);
      return jsonToObjectFn({"success": false, "statusMessage": formatErrorMsg});
    } on SocketException catch (_) {
      debugPrint("Socket Exception");
      return jsonToObjectFn({"success": false, "statusMessage": socketErrorMsg});
    } catch (e, stack) {
      debugPrint("Unknown Exception");
      debugPrint(e.toString());
      debugPrint(stack.toString());
      return jsonToObjectFn({"success": false, "statusMessage": commonErrorMsg});
    }
  }
}
