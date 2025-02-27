class SendChangePwCodeRequest {
  final String email;

  const SendChangePwCodeRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email' : email
    };
  }
}