class Otpmodel {
  Otpmodel({
    required this.message,
    required this.user_id,
    required this.name,
    required this.address,
    required this.phone,
    required this.lat,
    required this.log,
    required this.token,

  });
  late final String message;
  late final String user_id;
  late final String name;
  late final String address;
  late final String phone;
  late final String lat;
  late final String log;
  late final String token;

  Otpmodel.fromJson(Map<String, dynamic> json){
    message= json['message'];
    user_id= json['user_id'];
    name= json['name'];
    address= json['address'];
    phone= json['phone'];
    lat= json['lat'];
    log= json['log'];
    token= json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['user_id'] = user_id;
    _data['name'] = name;
    _data['address'] = address;
    _data['phone'] = phone;
    _data['lat'] = lat;
    _data['log'] = log;
    _data['token'] = token;
    return _data;
  }
}