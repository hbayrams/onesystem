import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:onesystem/models/signin_model.dart';
import 'package:onesystem/models/spoollist_model.dart';

class DatabaseOperations extends GetxController {
  final String _host = '10.0.3.2';
  final int _port = 3306;
  final String _user = 'oguzkaba';
  final String _password = '523287';
  final String _db = 'users';
  final String _tablename = 'user';

  final isLogin = false.obs;
  final List<SigninModel> _listem = <SigninModel>[].obs;
  List<SigninModel> get listem => _listem;
  final List<SpoolListModel> _listem2 = <SpoolListModel>[].obs;
  List<SpoolListModel> get listem2 => _listem2;

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
      _listem.clear();
      for (var item in sonuc) {
        _listem.add(
          SigninModel(item[1], item[2], item[5], item[3]),
        );
        print('Items: ${item[1]}');
      }
      print('Dataop daki listemiz1 : ' + listem.length.toString());
      if (a >= 1) {
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

  // Future<List<SigninModel>> getUsers(
  //     {@required String name, @required String pass}) async {
  //   try {
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );

  //     var sonuc = await baglan.query(
  //         'SELECT * FROM $_db.$_tablename where user_Name=? and user_Password=? and user_Actual=1',
  //         [name, pass]);

  //     //print(verilerinListesi.toList());
  //     for (var item in sonuc) {
  //       _listem.add(
  //         SigninModel(item[1], item[2], item[5], item[3]),
  //       );
  //     }
  //     // print("İlk gelen veriler");
  //     // print(listem[0].user_Name.toString());
  //     await baglan.close();
  //     return listem;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Future<List<SpoolListModel>> getSpool({@required String fno}) async {
    final _dbs = 'spool';
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _dbs),
      );

      var _table = 'spool_list';
      var sonuc = await baglan
          .query('SELECT * FROM $_dbs.$_table where fileNo_id=?', [fno]);
      _listem2.clear();
      //print(verilerinListesi.toList());
      for (var item in sonuc) {
        _listem2.add(SpoolListModel(
            item[1],
            item[2],
            item[3],
            item[4],
            item[5],
            item[6],
            item[7],
            item[8],
            item[9],
            item[10],
            item[11],
            item[12],
            item[13],
            item[14],
            item[15],
            item[16],
            item[17],
            item[18],
            item[19],
            item[20],
            item[21],
            item[22]));
      }

      // print(listem[0].user_Name.toString());
      print('Dataop daki listemiz2 : ' + listem2.length.toString());
      await baglan.close();
      return listem2;
    } catch (e) {
      return null;
    }
  }

// SELECT `COLUMN_NAME`
// FROM `INFORMATION_SCHEMA`.`COLUMNS`
// WHERE `TABLE_SCHEMA`='yourdatabasename'
//     AND `TABLE_NAME`='yourtablename';
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
