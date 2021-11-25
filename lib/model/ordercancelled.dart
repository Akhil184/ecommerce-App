class order {
  order({
    required this.message,
    required this.ord_id,

  });
  late final String message;
  late final String ord_id;

  order.fromJson(Map<String, dynamic> json){
    message = json['message'];
    ord_id = json['ord_id'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['ord_id'] = ord_id;

    return _data;
  }
}