class UserModel {
  final String name;
  final String address;
  final String phoneNumber;

  UserModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
