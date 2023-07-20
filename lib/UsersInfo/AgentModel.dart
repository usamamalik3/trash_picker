// ignore_for_file: file_names
class AgentModel {
  String? uid;
  String? email;
  String? name;
  String? password;
  String? tel;
  AgentModel({this.uid, this.email, this.name, this.password, this.tel});

  // receiving data from server
  factory AgentModel.fromMap(map) {
    return AgentModel(
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
