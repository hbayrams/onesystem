class MysqlQuery {
  Map queryList = {
    'login':
        'SELECT * FROM nQ9Fu2zziy.user where user_Name=? and user_Password=?',
    'getSpool': 'SELECT * FROM nQ9Fu2zziy.spool_list where fileNo_id=?',
    'getWeld':
        'SELECT * FROM nQ9Fu2zziy.weld_list where fileNo_id=? and spoolNo_id=?',
    'getFileNO': 'SELECT * FROM nQ9Fu2zziy.file_no',
    'getFileNoSpool':
        'SELECT fileNo_id,spool FROM nQ9Fu2zziy.spool_list where fabrication=?'
  };
}
