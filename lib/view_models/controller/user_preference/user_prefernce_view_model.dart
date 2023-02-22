import 'package:mvvm_mvc_with_getx/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserModel responceModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responceModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return UserModel(token: token);
  }

  Future<bool> removeUser(UserModel responceModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
