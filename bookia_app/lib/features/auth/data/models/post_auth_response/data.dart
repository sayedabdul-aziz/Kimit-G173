class Data {
  String? token;
  String? tokenType;

  Data({this.token, this.tokenType});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json['token'] as String?,
        tokenType: json['token_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'token_type': tokenType,
      };
}
