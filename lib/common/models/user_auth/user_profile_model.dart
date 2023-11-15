class UserProfileModel {
  final String? id;
  final String? name;
  final String? email;
  final String? height;
  final String? weight;
  final String? dateOfBirth;

  UserProfileModel({
    this.id,
    this.name,
    this.email,
    this.height,
    this.weight,
    this.dateOfBirth,
  });
  // final String? photoUrl;

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Email": email,
      "Height": height,
      "Weight": weight,
      "DateOfBirth": dateOfBirth,
    };
  }

  // fetch data
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['Name'],
      email: json['Email'],
      height: json['Height'],
      weight: json['Weight'],
      dateOfBirth: json['DateOfBirth'],
    );
  }
}
