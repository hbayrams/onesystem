import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:onesystem/models/mysql_conn.dart';
import 'package:onesystem/models/signin_model.dart';
import 'package:onesystem/models/weldlist_model.dart';

class DatabaseOperations extends GetxController {
  //OBS GetStateManagement variables
  final _result = 0.obs;
  int get sonuc => _result.value;
  final _islogin = false.obs;
  bool get islogin => _islogin.value;
  final List<SigninModel> _listem = <SigninModel>[].obs;
  List<SigninModel> get listem => _listem;
  List<dynamic> _listem2 = <dynamic>[].obs;
  List<dynamic> get listem2 => _listem2;
  final List<WeldListModel> _listem3 = <WeldListModel>[].obs;
  List<WeldListModel> get listem3 => _listem3;
  final List<dynamic> _listForFields = <dynamic>[].obs;
  List<dynamic> get listForFields => _listForFields;

  DatabaseOperations();

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

//#region SONUCU LISTEYE AKTAR
      _listem.clear();
      for (var item in result) {
        _listem.add(
          SigninModel(item[1], item[2], item[5], item[3]),
        );
      }
      print('Dataop daki listemiz1 : ' + listem.length.toString());
//#endregion

//#region SONUC BOSMU KONTROL
      if (result.isNotEmpty) {
        _islogin.value = true;
      } else {
        _islogin.value = false;
      }
//#endregion

      await connect.close();
      return listem;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//#endregion

  Future<List<dynamic>> getSpool(
      {@required String fno, @required String query}) async {
    try {
      var connect = await MysqlConn().getConnection();

//#region SORGU OLUSTUR
      var result = await connect.query(query, [fno]);
//#endregion

      _listem2.clear();

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

      result.forEach((v) => _listem2.add(v));

      getfields();

      print('Fields : ' + listForFields.length.toString());
      print('Dataop daki listemiz2 : ' + listem2.length.toString());
      await connect.close();
      return listem2;
    } catch (e) {
      return null;
    }
  }

  // Future<List<WeldListModel>> getWeld(
  //     {@required String fno, @required String sno}) async {
  //   try {
  //     print('bağlanmayı deniyorum...GETWELD');
  //     final baglan = await MySqlConnection.connect(
  //       ConnectionSettings(
  //           host: _host,
  //           port: _port,
  //           user: _user,
  //           password: _password,
  //           db: _db),
  //     );

  //     var _table = 'weld_list';
  //     var sonuc = await baglan.query(
  //         'SELECT * FROM $_db.$_table where fileNo_id=? and spoolNo_id=?',
  //         [fno, sno]);
  //     _listem3.clear();
  //     //print(verilerinListesi.toList());
  //     for (var item in sonuc) {
  //       _listem3.add(WeldListModel(
  //           item[1],
  //           item[2],
  //           item[3],
  //           item[4],
  //           item[5],
  //           item[6],
  //           item[7],
  //           item[8],
  //           item[9],
  //           item[10],
  //           item[11],
  //           item[12],
  //           item[13],
  //           item[14],
  //           item[15],
  //           item[16],
  //           item[17],
  //           item[18],
  //           item[19],
  //           item[20],
  //           item[21],
  //           item[22],
  //           item[23],
  //           item[24],
  //           item[25],
  //           item[26],
  //           item[27],
  //           item[28],
  //           item[29],
  //           item[30],
  //           item[31],
  //           item[32],
  //           item[33],
  //           item[34],
  //           item[35],
  //           item[36],
  //           item[37],
  //           item[38],
  //           item[39]));
  //     }

  //     print(listem3[0].weld.toString());
  //     print('Dataop daki listemiz3 : ' + listem3.length.toString());
  //     await baglan.close();
  //     return listem3;
  //   } catch (e) {
  //     return null;
  //   }
  // }

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
