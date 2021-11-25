class vendor {
 late List<Vender> vender;

  vendor({required this.vender});

  vendor.fromJson(Map<String, dynamic> json) {
    if (json['vender'] != null) {
      vender = <Vender>[];
      json['vender'].forEach((v) {
        vender.add(new Vender.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vender != null) {
      data['vender'] = this.vender.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vender {
 late String venderId;
 late String name;
 late String business;
 late String dob;
 late String address;
 late String phone;
 late String lat;
 late String log;
 late String email;
  late String upiId;
  late String status;

  Vender(
      {required this.venderId,
        required this.name,
        required this.business,
        required this.dob,
        required this.address,
        required this.phone,
        required this.lat,
        required this.log,
        required this.email,
        required this.upiId,
        required this.status});

  Vender.fromJson(Map<String, dynamic> json) {
    venderId = json['vender_id'];
    name = json['name'];
    business = json['Business'];
    dob = json['dob'];
    address = json['address'];
    phone = json['phone'];
    lat = json['lat'];
    log = json['log'];
    email = json['email'];
    upiId = json['upi_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vender_id'] = this.venderId;
    data['name'] = this.name;
    data['Business'] = this.business;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['log'] = this.log;
    data['email'] = this.email;
    data['upi_id'] = this.upiId;
    data['status'] = this.status;
    return data;
  }
}