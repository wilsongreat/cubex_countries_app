// ignore_for_file: avoid_dynamic_calls, use_build_context_synchronously, strict_raw_type, inference_failure_on_function_invocation

import 'dart:async';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../core/network/globals.dart';
import 'package:flutter/foundation.dart';


class ApiCall extends Globals {
  Duration timeoutDuration = const Duration(seconds: 1500);
  Map<String, String> headers = {};
  final log = getLogger('Logger', printCallstack: true);
  final client = http.Client();


  Map<String, String> userApiHeader() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }


  Future<http.Response> getReq(
    Uri url, {
    Map<String, dynamic>? params,
    Map<String, String>? customHeaders,
  }) async {
    try {
      final uri = url.replace(queryParameters: params);
      final response = await client
          .get(
            uri,
            headers: userApiHeader() ?? headers,)
          .timeout(timeoutDuration);
      _logResponse(response);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw response;
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }


  void _logResponse(http.Response response) {
    if (!kReleaseMode) {
      print('URL: ${response.request?.url}');
      print('Status Code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
    }
  }

  void dispose() {
    client.close();
  }
}



class MultipleLoggerOutput extends LogOutput {
  MultipleLoggerOutput(this.logOutputs);

  final List<LogOutput> logOutputs;

  @override
  void output(OutputEvent event) {
    for (final logOutput in logOutputs) {
      try {
        logOutput.output(event);
      } catch (e) {
        debugPrint('Logger error !!');
      }
    }
  }
}
Logger getLogger(
    String className, {
      bool printCallingFunctionName = true,
      bool printCallstack = false,
      List<String> exludeLogsFromClasses = const [],
      String? showOnlyClass,
    }) {
  return Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 1,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    output: MultipleLoggerOutput([
      ConsoleOutput(),
    ]),
  );
}