class Loginmodel {
  Loginmodel({
    required this.message,
    required this.mobile,
    required this.otp,
  });
  late final String message;
  late final String mobile;
  late final int otp;
  Loginmodel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    mobile = json['mobile'];
    otp=json['otp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['mobile'] = mobile;
    _data['otp'] = otp;
    return _data;
  }
}