import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class NetworkDioException extends DioException {
  NetworkDioException({required super.requestOptions});
}

class NetworkErrorInterceptorHandler extends ErrorInterceptorHandler {}

class NetworkFormData extends FormData {
  NetworkFormData() : super();

  NetworkFormData.fromMap(
    Map<String, dynamic> map,
  ) : super.fromMap(map);
}

class NetworkMultipartFile extends MultipartFile {
  NetworkMultipartFile(super.stream, super.length);

  static Future<MultipartFile> fromFile(
    String filePath, {
    String? filename,
    MediaType? contentType,
    Map<String, List<String>>? headers,
  }) async {
    return MultipartFile.fromFile(
      filePath,
      filename: filename,
      contentType: contentType,
      headers: headers,
    );
  }
}
