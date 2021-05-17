import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:onesystem/models/signin_model.dart';

class DatabaseOperations extends GetxController {
  final String _host = '10.0.3.2';
  final int _port = 3306;
  final String _user = 'oguzkaba';
  final String _password = '523287';
  final String _db = 'users';
  final String _tablename = 'user';

  final isLogin = false.obs;
  final List<SigninModel> listem = <SigninModel>[].obs;
  DatabaseOperations();

  Future<bool> loginQuery(
      {@required String name, @required String pass}) async {
    try {
      print('bağlanmayı deniyorum...');
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );
      var sonuc = await baglan.query(
          'SELECT * FROM $_db.$_tablename where user_Name=? and user_Password=? and user_Actual=1',
          [name, pass]);

      var a = sonuc.length;
      print(a.toString());

      for (var item in sonuc) {
        listem.add(
          SigninModel(item[1], item[2], item[5], item[3]),
        );
        print('Name: ${listem[0].user_Name}');
      }

      if (a == 1) {
        isLogin.value = true;
        print('Tamam tamam oldu ' + a.toString() + ' ' + isLogin.toString());
      } else {
        print('kullanıcı yok...');
        isLogin.value = false;
      }
      await baglan.close();
      return isLogin.value;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<List<SigninModel>> verileriGetir(
      {@required String name, @required String pass}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      List<SigninModel> listem = [];
      var sonuc = await baglan.query(
          'SELECT * FROM $_db.$_tablename where user_Name=? and user_Password=?',
          [name, pass]);

      //print(verilerinListesi.toList());
      for (var item in sonuc) {
        listem.add(
          SigninModel(item[1], item[2], item[5], item[3]),
        );
      }
      print("İlk gelen veriler");
      print(listem[0].user_Name.toString());
      await baglan.close();
      return listem;
    } catch (e) {
      return null;
    }
  }

  // Future<bool> veriEkle(
  //     {@required String name, String password, String role}) async {
  //   try {
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );
  //     // ekleme kodları sonra eklerse true döndür

  //     await baglan.query(
  //         "insert into $_db.$_tablename (name,password,role) values (?,?,?)",
  //         [name, password, role]);
  //     await baglan.close();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> veriGuncelle(
  //     {@required int id, String ders, String ogretmen, String donem}) async {
  //   try {
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );
  //     // güncelledikte  sonra  true döndür

  //     await baglan.query(
  //         "update deneme.dersler set ders=? , ogretmen=? , donem = ? where id = ?",
  //         [ders, ogretmen, donem, id]);
  //     await baglan.close();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> veriSil({@required int id}) async {
  //   try {
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );
  //     // sildikten sonra  true döndür

  //     await baglan.query('delete from deneme.dersler where id=?', [id]);
  //     await baglan.close();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

}
