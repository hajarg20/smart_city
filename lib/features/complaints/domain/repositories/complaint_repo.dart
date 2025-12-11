import 'package:dartz/dartz.dart';
import '../entities/complaint_entity.dart';
import '../../data/dtos/complaint_create_dto.dart';

abstract class ComplaintRepository {
  Future<Either<String, void>> createComplaint(ComplaintCreateDto complaint);
  Future<Either<String, List<ComplaintEntity>>> getMyComplaints(int citizenId);
}