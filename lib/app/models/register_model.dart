class RegisterModel {
  String Username;
  String Email;
  String Password;
  String PhoneNumber;
  String Address;
  String Unit;
  String FullName;

  RegisterModel(this.Username, this.Email, this.Password, this.PhoneNumber, this.Address,
      this.Unit, this.FullName);

  Map<String, dynamic> toJson() {
    return {
      "user_name": Username,
      "email": Email,
      'pass_word': Password,
      'phone_number': PhoneNumber,
      'address': Address,
      'unit': Unit,
      'full_name': FullName,
    };
  }
}
