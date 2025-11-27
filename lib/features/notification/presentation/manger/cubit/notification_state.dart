import 'package:smart_city/features/notification/domain/entities/notification_entity.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final List<NotificationEntity> notifications;

  NotificationSuccess(this.notifications);
}

class NotificationFailure extends NotificationState {
  final String message;

  NotificationFailure(this.message);
}

class NotificationDeleted extends NotificationState {
  final String message;

  NotificationDeleted(this.message);
}
