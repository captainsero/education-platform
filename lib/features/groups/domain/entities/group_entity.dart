import '../../data/models/schedule_model.dart';

class GroupEntity {
  GroupEntity({
    required this.id,
    required this.name,
    required this.schedules,
    required this.studentCount,
  });

  final String id;
  final String name;
  final List<ScheduleModel> schedules;
  final int studentCount;
}
