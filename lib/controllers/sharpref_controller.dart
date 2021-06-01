import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'login_controller.dart';

class SharedPrefController extends GetxController {
  final box = GetStorage();
  final _uname = ''.obs;
  final _password = ''.obs;
  final _isRemember = false.obs;

  LoginController _controller = Get.put(LoginController());

  @override
  Future<void> onInit() async {
    super.onInit();
    GetStorage box = GetStorage();
    if (box.read('login') != null) {
      await _loadFromPrefs();
      print('İlk gelen Uname: ' + box.read('name'));
      print('İlk gelen Pass: ' + _password.value);
      print('İlk gelen Login: ' + _isRemember.value.toString());
    }
  }

  bool get isRemember => _isRemember.value;
  String get uname => _uname.value;
  String get password => _password.value;

  String getShared() {
    return remember() ? 't/homePage' : 't/loginPage';
  }

  bool remember() {
    return box.read('login') ?? false;
  }

  //Login remember shared pref begin-----

  _initPrefs() async {
    await GetStorage.init();
  }

  _saveToPrefs() async {
    await _initPrefs();
    if (_controller.uname != null || _controller.password != null) {
      box.write('name', _controller.uname);
      box.write('pass', _controller.password);
      box.write('login', _isRemember.value);
    }

    //print(_isLogin.value);
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _uname.value = box.read('name');
    _password.value = box.read('pass');
    _isRemember.value = box.read('login');
    // print(_isLogin.value);
  }

  _deleteFromPrefs() async {
    await _initPrefs();
    box.remove('name');
    box.remove('pass');
    box.remove('login');
  }

  set isRemember(bool value) {
    _isRemember.value = value;
    if (_isRemember.value) {
      _saveToPrefs();
      //print('Remember: isLogin=>' + _isLogin.toString());
    } else {
      _deleteFromPrefs();
    }
    // if (_controller.uname != null || _controller.password != null) {
    //   print('Remember: Username=>' + box.read('name'));
    //   print('Remember: Password=>' + box.read('pass'));
    // }
  }

//Login remember shared pref end-----
}
