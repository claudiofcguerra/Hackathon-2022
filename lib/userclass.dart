class User {
  int id;
  String userid;
  String email;
  String password;
  String profilepicurl;

  User(this.id, this.userid, this.email, this.password, this.profilepicurl);

  User.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        userid = json['userid'],
        email = json['email'],
        password = json['password'],
        profilepicurl = json['profilepicurl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'userid': userid,
        'email': email,
        'password': password,
        'profilepicurl': profilepicurl
      };
}
