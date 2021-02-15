class User {
  String email;
  String firstName;
  String lastName;
  String dateOfBirth;
  String gender;
  String sId;

  User(
      {this.email,
        this.firstName,
        this.lastName,
        this.dateOfBirth,
        this.gender,
        this.sId});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['_id'] = this.sId;
    return data;
  }
}