// ignore_for_file: file_names
class DriverModel {
  String? uid;
  String? email;
  String? name;
  String? password;
  String? tel;
  DriverModel({this.uid, this.email, this.name, this.password, this.tel});

  // receiving data from server
  factory DriverModel.fromMap(map) {
    return DriverModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      password: map['password'],
      tel: map['tel'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'password': password,
      'tel': tel
    };
  }
}
