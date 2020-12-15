import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'login_controller.dart';

class SharedPrefModel extends GetxController {
  final box = GetStorage();
  final _isRemember = false.obs;
  final _uname = ''.obs;
  final _password = ''.obs;
  final _isLogin = true.obs;
  bool get isRemember => _isRemember.value;
  LoginController _controller = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  bool get isLogin => _isLogin.value;
  String get uname => _uname.value;
  String get password => _password.value;

  //Login remember shared pref begin-----
  set isRemember(bool value) {
    _isRemember.value = value;
    if (_isRemember.value) {
      _saveToPrefs();
    } else {
      _deleteFromPrefs();
    }
    print('Model: isRemember: ' + _isRemember.value.toString());
    print(box.read('pass'));
  }

  _initPrefs() async {
    await GetStorage.init();
  }

  _saveToPrefs() async {
    await _initPrefs();
    box.write('name', _controller.uname);
    box.write('pass', _controller.password);
    box.write('login', _isLogin.value);
    //print(_isLogin.value);
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _uname.value = box.read('name');
    _password.value = box.read('pass');
    _isLogin.value = box.read('login');
    //print(_isLogin.value);
  }

  _deleteFromPrefs() async {
    await _initPrefs();
    box.remove('name');
    box.remove('pass');
    box.remove('login');
  }

  set isLogin(bool value) {
    isLogin = value;
    if (_isLogin.value) {
      _saveToPrefs();
    } else {
      _deleteFromPrefs();
    }
    print('Model: isLogin' + _isLogin.toString());
    //print(_pref.getString('name'));
  }

//Login remember shared pref end-----
}
