class ResponseData<T> {
  T? data;
  String? errorMessage;
  String status;
  ResponseData({
    required this.status,
    this.data,
    this.errorMessage,
  });
}
