class User{
  late String name;
  late int age;
  User({required this.name, required this.age});
  User.fromJson(Map<String, dynamic> json):
        name= json['name'],
        age = json['age'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'age': age,
      };

}