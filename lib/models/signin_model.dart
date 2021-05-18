class SigninModel {
  int id, levels_id, user_Actual;
  String user_Name, user_Password;
  //bool login;

  SigninModel(
      this.user_Name, this.user_Password, this.levels_id, this.user_Actual,
      {this.id});
}
