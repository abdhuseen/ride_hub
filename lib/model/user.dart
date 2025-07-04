class User {
  String name;
  String email;
  String phoneNumber;
  String password;
  String gender;
  int age;
  String licenseDriveImageLink;
  String idImageLink;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.age,
    required this.licenseDriveImageLink,
    required this.idImageLink,
  });

  // fromJson constructor
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      gender: json['gender'],
      age: json['age'],
      licenseDriveImageLink: json['licenseDriveImageLink'],
      idImageLink: json['idImageLink'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email':email,
      'phoneNumber': phoneNumber,
      'password': password,
      'gender': gender,
      'age': age,
      'licenseDriveImageLink': licenseDriveImageLink,
      'idImageLink': idImageLink,
    };
  }
}
