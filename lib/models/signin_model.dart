class SigninModel {
  int id, levels_id, user_Actual;
  String user_Name, user_Password,photo_String;
  //bool login;

  SigninModel(
      this.user_Name, this.user_Password, this.levels_id, this.user_Actual,this.photo_String,
      {this.id});
}
