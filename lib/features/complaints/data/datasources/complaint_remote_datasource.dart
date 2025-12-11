import 'package:smart_city/core/database/api/api_consumer.dart';
import '../dtos/complaint_create_dto.dart';

abstract class ComplaintRemoteDataSource {
  Future<List<dynamic>> getMyComplaints(int citizenId);
  Future<void> createComplaint(ComplaintCreateDto complaint);
}

class ComplaintRemoteDataSourceImpl implements ComplaintRemoteDataSource {
  final ApiConsumer api;

  ComplaintRemoteDataSourceImpl(this.api);

  @override
  Future<List<dynamic>> getMyComplaints(int citizenId) async {
    final response = await api.get(
      "/api/complaints/my/$citizenId",
      requireAuth: true,
    );

    // الـ API بيرجّع {"status":"success","data":[...]}
    return response['data'] as List<dynamic>;
  }

  @override
  Future<void> createComplaint(ComplaintCreateDto complaint) async {
    await api.post(
      "/api/complaints",
      data: complaint.toJson(),
      requireAuth: true, // التوكن هيتضاف تلقائي
    );
    // لو السيرفر بيرجع 201 بدون body مفيش مشكلة
  }
}