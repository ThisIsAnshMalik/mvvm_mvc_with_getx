import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/data/responce/status.dart';
import 'package:mvvm_mvc_with_getx/models/home/user_list_model.dart';
import 'package:mvvm_mvc_with_getx/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  void setUserList(UserListModel value) {
    userList.value = value;
  }

  void setError(String value) {
    error.value = value;
  }

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void retryUserListApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
