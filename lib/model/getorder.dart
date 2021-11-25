class getd {
  getd({
    required this.user_id,
    required this.name,
    required this.address,
    required this.phone,
    required this.lat,
    required this.log,

  });
  late final String user_id;
  late final String name;
  late final String address;
  late final String phone;
  late final String lat;
  late final String log;

  getd.fromJson(Map<String, dynamic> json){
    user_id = json['user_id'];
   name  = json['address'];
    phone=json['phone'];
    lat = json['lat'];
    log = json['log'];
    log=json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = user_id;
    _data['address'] = address;
    _data['phone'] = phone;
    _data['user_id'] = user_id;
    _data['address'] = address;
    _data['phone'] = phone;
    return _data;
  }
}