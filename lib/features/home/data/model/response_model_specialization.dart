import 'package:doc_app/features/home/data/model/specializations_data.dart';

class ResponseModelSpecialization {
  List<SpecializationsData?>? data;

  ResponseModelSpecialization({
    this.data,
  });
  ResponseModelSpecialization.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <SpecializationsData>[];
      v.forEach((v) {
        arr0.add(SpecializationsData.fromJson(v));
      });
      data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['data'] = arr0;
    }
    return data;
  }
}
