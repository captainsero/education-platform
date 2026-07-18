// features/group/data/models/group_model.dart
import '../../domain/entities/group_entity.dart';
import 'schedule_model.dart';

class GroupModel {
  GroupModel({
    required this.id,
    required this.teacherId,
    required this.name,
    required this.timezone,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.schedules,
    required this.studentCount,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    final schedulesJson = json['schedules'] as List? ?? [];
    final studentsJson = json['students'] as List? ?? [];

    return GroupModel(
      id: json['id'] as String,
      teacherId: json['teacher_id'] as String,
      name: json['name'] as String,
      timezone: json['timezone'] as String,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      schedules: schedulesJson
          .map((s) => ScheduleModel.fromJson(s as Map<String, dynamic>))
          .toList(),
      studentCount: studentsJson.isEmpty
          ? 0
          : (studentsJson.first as Map<String, dynamic>)['count'] as int,
    );
  }

  final String id;
  final String teacherId;
  final String name;
  final String timezone;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ScheduleModel> schedules;
  final int studentCount;

  GroupEntity toDomain() => GroupEntity(
    id: id,
    name: name,
    schedules: schedules,
    studentCount: studentCount,
  );
}
