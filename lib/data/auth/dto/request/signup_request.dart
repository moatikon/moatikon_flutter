class SignupRequest {
  final String email;
  final String password;
  final String nickname;

  const SignupRequest({
    required this.email,
    required this.password,
    required this.nickname,
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['nickname'] = nickname;
    data['password'] = password;

    return data;
  }
}