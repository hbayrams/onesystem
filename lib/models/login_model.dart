import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel extends GetxController {
  final _uname = ''.obs;
  final _password = ''.obs;
  final formKey = GlobalKey<FormState>().obs;
  final _autoValidate = false.obs;
  final _isVisible = false.obs;
  final _isLogin = false.obs;
  final _isRemember = false.obs;
  final box = GetStorage();
  //final _pref.obs;

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  String get uname => _uname.value;
  String get password => _password.value;
  bool get autoValidate => _autoValidate.value;
  bool get isVisible => _isVisible.value;
  bool get isLogin => _isLogin.value;
  bool get isRemember => _isRemember.value;

  set autoValidate(bool value) => _autoValidate.value = value;

  set isVisible(bool value) => _isVisible.value = value;

  void onSavedUname(String unameStr) => _uname.value = unameStr;

  void onSavedPassword(String passwordStr) => _password.value = passwordStr;

  String validateUname(String value) {
    if (value.length == 0) {
      return 'Please fill username';
    } else if (value.length < 6) {
      return 'Username must be 6 length character';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return 'Please fill password';
    } else if (value.length < 6) {
      return 'Password must be 6 length character';
    } else {
      return null;
    }
  }

//Login remember shared pref begin-----
  set isRemember(bool value) {
    _isRemember.value = value;
    if (_isRemember.value) {
      _saveToPrefs();
    } else {
      _deleteFromPrefs();
    }
    print('Model: isRemember' + _isRemember.value.toString());
    //print(_pref.getString('name'));
  }

  _initPrefs() async {
    await GetStorage.init();
  }

  _saveToPrefs() async {
    await _initPrefs();
    box.write('name', _uname.value);
    box.write('pass', _password.value);
    box.write('login', _isLogin.value);
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _uname.value = box.read('name');
    _password.value = box.read('pass');
    _isLogin.value = box.read('login');
  }

  _deleteFromPrefs() async {
    await _initPrefs();
    _pref.setString('name', '');
    _pref.setString('pass', '');
    _pref.setBool('login', null);
  }

  set isLogin(bool value) {
    _isLogin.value = value;
    if (_isLogin.value) {
      _saveToPrefs();
    } else {
      _deleteFromPrefs();
    }
    print('Model: isLogin' + _isLogin.value.toString());
    //print(_pref.getString('name'));
  }

//Login remember shared pref end-----
}
