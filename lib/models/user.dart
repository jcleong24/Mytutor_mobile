class User {
  String? id;
  String? email;
  String? name;
  String? phoneNo;
  String? address;

  User({this.id, this.email, this.name, this.phoneNo, this.address,});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['phoneNo'] = phoneNo;
    data['address'] = address;
    return data;
  }
}