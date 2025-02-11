import 'package:dio/dio.dart';
import '../core/ignore/base_url.dart';

final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));