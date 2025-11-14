class EndPoints {
  static const String baseUrl = "http://smartcity.tryasp.net";

  // ── Auth
  static const String register = "/api/Authentication/register";
  static const String login = "/api/Authentication/login";

  static const String changePassword = "api/Authentication/change-password";

  // ── User
  static const String getMe = "api/users/me";

  // ── Bills
  static const String myBills = "api/bills/my-bills";
  static const String billDetail = "api/bills";
  static const String payBill = "api/bills";
  // ── Complaints
  static const String createComplaint =
      "api/complaints"; // ?citizenId={citizenId}
  static const String myComplaints = "api/complaints/my";

  // ── Suggestions
  static const String suggestions = "api/Suggestions";

  // ── Notifications
  static const String myNotifications = "api/Notification/my";
}

class ApiKey {
  // ── Auth
  static const String name = "name";
  static const String nationalId = "nationalId";
  static const String email = "email";
  static const String phone = "phone";
  static const String password = "password";
  static const String address = "address";

  // ── Token
  static const String token = "token";
  static const String status = "status";

  // ── Complaints
  static const String title = "title";
  static const String description = "description";
  static const String location = "location";
  static const String imageUrl = "imageUrl";

  // ── Bill
  static const String amount = "amount";
  static const String issueDate = "issueDate";
  static const String isPaid = "isPaid";

  // ── Suggestion
  static const String citizenId = "citizenId";
}
