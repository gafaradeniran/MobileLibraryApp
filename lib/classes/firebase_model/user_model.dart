class UserModel {
  String? userid, email, fullname, departments;
  UserModel({this.userid, this.email, this.fullname, this.departments});

// recieving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      userid: map['uid'],
      email: map['mail@email.com'],
      fullname: map['fullname'],
      departments: map['dept'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': userid,
      'mail@email.com': email,
      'fullname': fullname,
      'dept': departments,
    };
  }
}
