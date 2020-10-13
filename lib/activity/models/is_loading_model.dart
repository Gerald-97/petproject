class IsLoadingModel {
  String _message;
  bool _is_loading;
  bool _is_error;
  int _start;

  IsLoadingModel(String message, bool is_loading, bool is_error, int start){
    _message = message;
    _is_loading = is_loading;
    _is_error = is_error;
    _start = start;
  }
  bool get is_error => _is_error;
  bool get is_loading => _is_loading;
  String get message => _message;
  int get start => _start;
}