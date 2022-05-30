//@dart=2.9
class UserModel {
  int id;
  String name;
  String email;
  String phone_number;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone_number
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone_number = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name" : name,
      "email": email,
      "phone_number": phone_number
    };
  }
}