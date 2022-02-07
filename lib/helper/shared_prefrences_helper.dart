import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper {
  SharedPrefrencesHelper._();

  static SharedPrefrencesHelper sharedPrefrencesHelper =
      SharedPrefrencesHelper._();
  SharedPreferences sharedPrefrences;

  initSharedPrefrences() async {
    sharedPrefrences = await SharedPreferences.getInstance();
  }

  setToken(String token) async {
    await sharedPrefrences.setString('token', token);
  }

  String getToken() {
    return sharedPrefrences.getString('token');
  }

  setType(String type) async {
    await sharedPrefrences.setString('type', type);
  }

  String getType() {
    return sharedPrefrences.getString('type');
  }

  setPassword(String password) async {
    await sharedPrefrences.setString('password', password);
  }

  String getPassword() {
    return sharedPrefrences.getString('password');
  }

  setIsLogin(bool login) async {
    await sharedPrefrences.setBool('isLogin', login);
  }

  bool getIsLogin() {
    return sharedPrefrences.getBool('isLogin');
  }

  clear(){
    return sharedPrefrences.clear();
  }
}
