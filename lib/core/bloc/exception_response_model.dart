import 'package:dio/dio.dart';

class ExceptionResponseModel {
  final int statusCode;
  final List<String> message;
  final String timestamp;
  final String path;

  const ExceptionResponseModel({
    required this.statusCode,
    required this.message,
    required this.timestamp,
    required this.path,
  });

  factory ExceptionResponseModel.fromJson(Response<dynamic> response){
    return ExceptionResponseModel(
      statusCode: response.data['statusCode'],
      message: List<String>.from(response.data['message']),
      timestamp: response.data['timestamp'],
      path: response.data['path'],
    );
  }
}