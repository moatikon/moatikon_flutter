class EditPasswordRequest {
  final String email, password, code;

  const EditPasswordRequest({
    required this.email,
    required this.password,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email' : email,
      'code' : code,
      'password': password,
    };
  }
}
