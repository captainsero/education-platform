class ScheduleModel {
  ScheduleModel({
    required this.id,
    required this.groupId,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'] as String,
      groupId: json['group_id'] as String,
      dayOfWeek: json['day_of_week'] as int,
      startTime: json['start_time'] as String, // e.g. "16:00:00"
      endTime: json['end_time'] as String,
    );
  }

  final String id;
  final String groupId;
  final int dayOfWeek; // 0 = Sunday ... 6 = Saturday
  final String startTime;
  final String endTime;
}
