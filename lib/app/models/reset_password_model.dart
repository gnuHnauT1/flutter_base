class ResetPasswordModel {
  String Email;
  String Token;
  String NewPassword;
  String ConfirmNewPassword;

  ResetPasswordModel(this.Email,this.Token, this.NewPassword, this.ConfirmNewPassword);

  Map<String, dynamic> toJson() {
    return {
      "Email": Email,
      "Token": Token,
      "NewPassword": NewPassword,
      "ConfirmNewpassword": ConfirmNewPassword,
    };
  }
}
