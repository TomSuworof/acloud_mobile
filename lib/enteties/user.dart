class User {
  int id;
  String username;
  String email;
  String secretQuestion;
  String secretAnswer;
  String password;
  String role;

  User({
    this.id,
    this.username,
    this.email,
    this.secretQuestion,
    this.secretAnswer,
    this.password,
    this.role,
  });

  User.fromJson(Map<String, Object> jsonString) {
    this.id = jsonString['id'];
    this.username = jsonString['username'];
    this.email = jsonString['email'];
    this.secretQuestion = jsonString['secretQuestion'];
    this.secretAnswer = jsonString['secretAnswer'];
    this.password = jsonString['password'];
    this.role = jsonString['role'];
  }
}