import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  String gender;

  @HiveField(4)
  String school;

  @HiveField(5)
  String hobby;

  @HiveField(6)
  String address;

  StudentModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.school,
    required this.hobby,
    required this.address,
  });
}
