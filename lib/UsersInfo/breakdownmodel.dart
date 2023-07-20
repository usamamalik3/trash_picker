// ignore_for_file: file_names
class pannemodel {
  String? uid;
  String? name;
  String? tel;
  String? camion;
  String? panne;
  pannemodel({this.uid, this.name, this.tel, this.panne, this.camion});

  // receiving data from server
  factory pannemodel.fromMap(map) {
    return pannemodel(
      uid: map['uid'],
      camion: map['camion'],
      name: map['name'],
      panne: map['panne'],
      tel: map['tel'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'panne': panne,
      'name': name,
      'camion': camion,
      'tel': tel
    };
  }
}
