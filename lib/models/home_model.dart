import 'package:hive/hive.dart';
part 'home_model.g.dart';

@HiveType(typeId: 0)
class Lead {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final String mobile;

  Lead({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.mobile,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      createdAt: json['created_at'] ?? '',
      mobile: json['mobile'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt,
      'mobile': mobile,
    };
  }
}
