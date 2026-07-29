class ScheduleSlotInput {
  const ScheduleSlotInput({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  final int dayOfWeek; // 0 = Sunday ... 6 = Saturday
  final String startTime; // "16:00"
  final String endTime; // "17:30"

  Map<String, dynamic> toJson() => {
    'day_of_week': dayOfWeek,
    'start_time': startTime,
    'end_time': endTime,
  };
}
