
class User {

  String? name;
  int? age;
  String? profileImagePath;

  User({this.name, this.age, this.profileImagePath});

  User.fromJson(Map<String, dynamic> mapData) {
    name = mapData['name'];
    age = mapData['age'];
    profileImagePath = mapData['profileImagePath'];
  }
}