import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:onesystem/models/signin_model.dart';
import 'package:onesystem/models/spoollist_model.dart';
import 'package:onesystem/models/weldlist_model.dart';

class DatabaseOperations extends GetxController {
  final String _host = 'remotemysql.com';
  final int _port = 3306;
  final String _user = 'nQ9Fu2zziy';
  final String _password = 'odtQEyU3Bs';
  final String _db = 'nQ9Fu2zziy';
  final String _tablename = 'user';

  //OBS GetStateManagement variables
  final _sonuc = 0.obs;
  int get sonuc => _sonuc.value;
  final _islogin = false.obs;
  bool get islogin => _islogin.value;
  final List<SigninModel> _listem = <SigninModel>[].obs;
  List<SigninModel> get listem => _listem;
  final List<SpoolListModel> _listem2 = <SpoolListModel>[].obs;
  List<SpoolListModel> get listem2 => _listem2;
  final List<WeldListModel> _listem3 = <WeldListModel>[].obs;
  List<WeldListModel> get listem3 => _listem3;
  final List<dynamic> _listForFields = <dynamic>[].obs;
  List<dynamic> get listForFields => _listForFields;

  DatabaseOperations();

  Future<List<SigninModel>> loginQuery(
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
          'SELECT * FROM $_db.$_tablename where user_Name=? and user_Password=?',
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
      if (sonuc.isNotEmpty) {
        _islogin.value = true;
        print('Tamam tamam oldu ' + a.toString() + ' ' + _islogin.toString());
      } else {
        print('kullanıcı yok ve pasif...');
        _islogin.value = false;
      }
      await baglan.close();
      return listem;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<SpoolListModel>> getSpool({@required String fno}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      var _table = 'spool_list';
      var sonuc = await baglan
          .query('SELECT * FROM $_db.$_table where fileNo_id=?', [fno]);
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
            item[22],
            item[23]));
      }

      //Kolon isimlerini al
      List<dynamic> getfields() {
        _listForFields.clear();

        for (int z = 0; z < 23; z++) {
          _listForFields.add(sonuc.fields[z].name);
        }
        return listForFields;
      }

      getfields();
      print('Fields : ' + listForFields.length.toString());
      print('Dataop daki listemiz2 : ' + listem2.length.toString());
      await baglan.close();
      return listem2;
    } catch (e) {
      return null;
    }
  }

  Future<List<WeldListModel>> getWeld(
      {@required String fno, @required String sno}) async {
    try {
      print('bağlanmayı deniyorum...GETWELD');
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      var _table = 'weld_list';
      var sonuc = await baglan.query(
          'SELECT * FROM $_db.$_table where fileNo_id=? and spoolNo_id=?',
          [fno, sno]);
      _listem3.clear();
      //print(verilerinListesi.toList());
      for (var item in sonuc) {
        _listem3.add(WeldListModel(
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
            item[22],
            item[23],
            item[24],
            item[25],
            item[26],
            item[27],
            item[28],
            item[29],
            item[30],
            item[31],
            item[32],
            item[33],
            item[34],
            item[35],
            item[36],
            item[37],
            item[38],
            item[39]));
      }

      print(listem3[0].weld.toString());
      print('Dataop daki listemiz3 : ' + listem3.length.toString());
      await baglan.close();
      return listem3;
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
