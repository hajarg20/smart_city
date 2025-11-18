import 'package:smart_city/features/notification/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getMyNotifications(int citizenId);
}
