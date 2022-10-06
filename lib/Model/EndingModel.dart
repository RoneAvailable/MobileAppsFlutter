class EndingModel {
  String? Scalenumber;
  String? disMoney;
  String? disPercent;
  String? reMark;

  EndingModel({
    this.Scalenumber = '',
    this.disMoney = '',
    this.disPercent = '',
    this.reMark = '',
  });

  factory EndingModel.fromJson(Map<String, dynamic> json) => EndingModel(
        Scalenumber: json["scaleno"] ?? '-',
        disMoney: json["dismoney"] ?? '-',
        disPercent: json["dispercent"] ?? '-',
        reMark: json["remark"] ?? '-',
      );
}
