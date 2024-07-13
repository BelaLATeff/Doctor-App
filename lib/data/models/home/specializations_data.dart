import 'package:doc_app/data/models/home/doctor_data.dart';

class SpecializationsData {
  int? id;
  String? name;
  List<DoctorsData?>? doctors;

  SpecializationsData({
    this.id,
    this.name,
    this.doctors,
  });
  SpecializationsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    if (json['doctors'] != null) {
      final v = json['doctors'];
      final arr0 = <DoctorsData>[];
      v.forEach((v) {
        arr0.add(DoctorsData.fromJson(v));
      });
      doctors = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (doctors != null) {
      final v = doctors;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['doctors'] = arr0;
    }
    return data;
  }
}
