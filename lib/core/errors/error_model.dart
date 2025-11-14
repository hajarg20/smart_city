// lib/core/errors/error_model.dart

class ErrorModel {
  final int? status;
  final String errorMessage;

  ErrorModel({this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json['status'] as int?,
      errorMessage: _extractMessage(json),
    );
  }

  static String _extractMessage(Map<String, dynamic> json) {
    return json['message']?.toString() ??
        json['error']?.toString() ??
        json['detail']?.toString() ??
        json['title']?.toString() ??
        (json['errors'] is Map
            ? (json['errors'] as Map).values.first?.toString()
            : json['errors']?.toString()) ??
        'An error occurred';
  }
}
