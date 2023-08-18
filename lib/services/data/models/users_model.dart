class UserModel {
  String firstName;
  String lastName;
  String age;
  String usersId;
  String fcm;
  String createdDate;
  String usersRole;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.usersId,
    required this.fcm,
    required this.createdDate,
    required this.usersRole,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      age: json['age'] ?? '',
      usersId: json['usersId'] ?? '',
      fcm: json['fcm'],
      createdDate: json['createdDate'] ?? '',
      usersRole: json['usersRole'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'age': age,
      'usersId': usersId,
      'fcm': fcm,
      'createdDate': createdDate,
      'usersRole': usersRole,
    };
  }
}
