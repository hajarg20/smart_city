class NotificationEntity {
  final int id;
  final String title;
  final String message;
  final String date;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
  });

  get isRead => null;
}
