class ResultModel {
  String id;
  String total;
  String name;
  String detail;

  ResultModel({this.id, this.total, this.name, this.detail});

  ResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    name = json['name'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['name'] = this.name;
    data['detail'] = this.detail;
    return data;
  }
}