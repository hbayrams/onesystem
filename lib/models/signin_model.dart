class SigninModel {
  int id, levels_id;
  String user_Name, user_Password;
  bool login;

  SigninModel(this.login, this.user_Name, this.user_Password, this.levels_id,
      {this.id});
}

