import 'package:bloc/bloc.dart';
import 'package:smart_city/features/complaints/data/dtos/complaint_create_dto.dart'; // تأكد من المسار
import 'package:smart_city/features/complaints/domain/usecases/create_complaint_usecase.dart'; // تأكد من المسار
import 'package:smart_city/features/complaints/domain/usecases/get_my_complaints_usecase.dart'; // تأكد من المسار
import 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  final GetMyComplaintsUseCase getMyComplaintsUseCase;
  final CreateComplaintUseCase createComplaintUseCase;

  ComplaintsCubit({
    required this.getMyComplaintsUseCase,
    required this.createComplaintUseCase,
  }) : super(ComplaintsInitial());

  Future<void> getMyComplaints(int citizenId) async {
    emit(ComplaintsLoading());
    final result = await getMyComplaintsUseCase(citizenId: citizenId);

    result.fold(
          (failure) => emit(ComplaintsError(failure)),
          (complaints) => emit(ComplaintsLoaded(complaints)),
    );
  }

  Future<void> createComplaint({
    required ComplaintCreateDto complaintData,
    int? citizenId, // optional لو عايز get بعد الcreate
  }) async {
    // emit(ComplaintsLoading()); // أضفه لو عايز

    final result = await createComplaintUseCase(
      complaint: complaintData,
    );

    result.fold(
          (failure) => emit(ComplaintCreationFailed(failure)),
          (_) {
        emit(ComplaintCreatedSuccess());
        if (citizenId != null) getMyComplaints(citizenId);
      },
    );
  }
}