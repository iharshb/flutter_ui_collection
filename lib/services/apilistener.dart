
abstract class ApiListener {
  void onApiSuccess(Object mObject);
  void onApiFailure(Exception exception);
  void onNoInternetConnection();
}