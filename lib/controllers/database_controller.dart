import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:mysql1/mysql1.dart';
import 'package:onesystem/models/mysql_conn.dart';
import 'package:onesystem/models/signin_model.dart';

class DatabaseOperations extends GetxController {
  //OBS GetStateManagement variables
  final _result = 0.obs;
  int get sonuc => _result.value;
  final _islogin = false.obs;
  bool get islogin => _islogin.value;
  final List<SigninModel> _lisForSign = <SigninModel>[].obs;
  List<SigninModel> get lisForSign => _lisForSign;
  List<dynamic> _listForSpool = <dynamic>[].obs;
  List<dynamic> get listForSpool => _listForSpool;
  final List<dynamic> _listForWeld = <dynamic>[].obs;
  List<dynamic> get listForWeld => _listForWeld;
  final List<dynamic> _listForFields = <dynamic>[].obs;
  List<dynamic> get listForFields => _listForFields;

//#region DATABASE-LOGIN KONTROL METHOD
  Future<List<SigninModel>> loginQuery(
      {@required String name,
      @required String pass,
      @required String query}) async {
    try {
      print('bağlanmayı deniyorum...');
      var connect = await MysqlConn().getConnection();

//#region SORGU OLUSTUR
      var result = await connect.query(query, [name, pass]);
//#endregion

      _lisForSign.clear();

//#region SONUC BOSMU KONTROL
      if (result.isNotEmpty) {
//#region SONUCU LISTEYE AKTAR
        for (var item in result) {
          _lisForSign.add(
            SigninModel(item[1], item[2], item[6], item[3], item[4]),
          );
        }
//#endregion
        _islogin.value = true;
      } else {
        _islogin.value = false;
      }
//#endregion

      await connect.close();
      return lisForSign;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//#endregion

//#region DATABASE-GETSpool KONTROL METHOD
  Future<List<dynamic>> getSpool(
      {@required String fno, @required String query}) async {
    try {
      var connect = await MysqlConn().getConnection();

//#region SORGU OLUSTUR
      var result = await connect.query(query, [fno]);
//#endregion

      _listForSpool.clear();

      _result.value = result.length;

//#region KOLON ISIMLERINI AL
      List<dynamic> getfields() {
        _listForFields.clear();

        for (int z = 0; z < 23; z++) {
          _listForFields.add(result.fields[z].name);
        }
        return listForFields;
      }

//#endregion
      getfields();
      result.forEach((v) => _listForSpool.add(v));

      // // print('Fields : ' + listForFields.length.toString());
      // // print('Dataop daki listemiz2 : ' + listem2.length.toString());
      await connect.close();
      return listForSpool;
    } catch (e) {
      return null;
    }
  }
//#endregion

//#region DATABASE-GETWeld KONTROL METHOD
  Future<List<dynamic>> getWeld(
      {@required String fno,
      @required String sno,
      @required String query}) async {
    try {
      var connect = await MysqlConn().getConnection();

//#region SORGU OLUSTUR
      var result = await connect.query(query, [fno, sno]);
//#endregion

      _listForWeld.clear();

      _result.value = result.length;

//#region KOLON ISIMLERINI AL
      List<dynamic> getfields() {
        _listForFields.clear();

        for (int z = 0; z < 38; z++) {
          _listForFields.add(result.fields[z].name);
        }
        return listForFields;
      }
//#endregion

      getfields();
      result.forEach((v) => _listForWeld.add(v));
      await connect.close();
      return listForWeld;
    } catch (e) {
      return null;
    }
  }
//#endregion

//#region DATABASE-GETFileNO KONTROL METHOD
  Future<List<dynamic>> getFileNO({@required String query}) async {
    try {
      var connect = await MysqlConn().getConnection();

//#region SORGU OLUSTUR
      var result = await connect.query(query);
//#endregion

      _listForWeld.clear();

      _result.value = result.length;

//#region KOLON ISIMLERINI AL
      List<dynamic> getfields() {
        _listForFields.clear();

        for (int z = 0; z < 38; z++) {
          _listForFields.add(result.fields[z].name);
        }
        return listForFields;
      }
//#endregion

      getfields();
      result.forEach((v) => _listForWeld.add(v));
      await connect.close();
      return listForWeld;
    } catch (e) {
      return null;
    }
  }
//#endregion

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
