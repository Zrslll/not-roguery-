class Token {
  const Token(this.token);

  final String token;

  Token.fromJson(Map<String, dynamic> json) : token = json['token'];
}
