import 'package:flutter/cupertino.dart';

class MysqlQuery {
  Map queryList = {
    'login':
        'SELECT * FROM nQ9Fu2zziy.user where user_Name=? and user_Password=?',
    'getSpool': 'SELECT * FROM nQ9Fu2zziy.spool_list where fileNo_id=?'
  };
}
