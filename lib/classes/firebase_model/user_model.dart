class UserModel {
  String? userid, email, fullname, departments;
  UserModel({this.userid, this.email, this.fullname, this.departments});

// recieving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      userid: map['userid'],
      email: map['me@gmail.com'],
      fullname: map['Ola Adeniran'],
      departments: map['Science'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'userid' : userid,
      'me@gmail.com' : email,
      'Ola Adeniran' : fullname,
      'Science' : departments,
    };
      
  }
}
