import 'package:mvvm_mvc_with_getx/data/network/network_api_services.dart';
import 'package:mvvm_mvc_with_getx/models/home/user_list_model.dart';
import 'package:mvvm_mvc_with_getx/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}
