class EndPoints {
  static const String baseUrl = "http://smartcity.tryasp.net";

  static const String register = "/api/Authentication/register";
  static const String login = "/api/Authentication/login";
  static const String changePassword = "/api/Authentication/change-password";

  static const String me = "/api/users/me";

  static String myBills(int citizenId) => "/api/bills/my-bills/$citizenId";
  static String billDetail(int id) => "/api/bills/$id";
  static String payBill(int id) => "/api/bills/$id/pay";

  static String createComplaint(int citizenId) =>
      "/api/complaints?citizenId=$citizenId";
  static String myComplaints(int citizenId) => "/api/complaints/my/$citizenId";

  static const String suggestionsList = "/api/Suggestions"; // GET all
  static String suggestionDetail(int id) => "/api/Suggestions/$id";
  static const String createSuggestion = "/api/Suggestions"; // POST
  static String updateSuggestion(int id) => "/api/Suggestions/$id"; // PUT
  static String deleteSuggestion(int id) => "/api/Suggestions/$id"; // DELETE

  // ── Notifications
  static String myNotifications(int citizenId) =>
      "/api/Notification/my/$citizenId";
}

class ApiKey {
  // ── Auth
  static const String name = "name";
  static const String nationalId = "nationalId";
  static const String email = "email";
  static const String phone = "phone";
  static const String password = "password";
  static const String address = "address";
  static const String oldPassword = "oldPassword";
  static const String newPassword = "newPassword";

  // ── Token
  static const String token = "token";
  static const String status = "status";

  // ── User
  static const String id = "id";
  static const String role = "role";
  static const String createdAt = "createdAt";
  static const String isActive = "isActive";

  // ── Complaints
  static const String title = "title";
  static const String description = "description";
  static const String location = "location";
  static const String imageUrl = "imageUrl";
  static const String dateSubmitted = "dateSubmitted";
  static const String updatedAt = "updatedAt";
  static const String statusCode = "status";
  static const String citizenId = "citizenId";
  static const String adminId = "adminId";
  static const String adminNote = "adminNote";

  // ── Bill
  static const String amount = "amount";
  static const String issueDate = "issueDate";
  static const String isPaid = "isPaid";
  static const String type = "type";

  // ── Suggestion
  static const String suggestionTitle = "title";
  static const String suggestionDescription = "description";
  static const String suggestionStatus = "status";

  // ── Utility Issue
  static const String utilityType = "type"; //
  static const String reportDate = "reportDate";
}
