import 'dart:ffi';

class DrcModel {
  String? Scalenumber;
  String? Datetime;
  String? Name;
  String? Carlicense;
  String? Drc;

  String? DrcText;

  String? BatchNo;
  String? Material;
  String? TotalWeight;
  String? CarWeight;
  String? ItemWeight;
  String? beginWeight;
  String? endWeight;
  String? multiply;

  String? CarType;
  String? ProductCode;
  String? ProductName;
  String? Remark;

  DrcModel({
    this.Scalenumber = '',
    this.Datetime = '',
    this.Name = '',
    this.Carlicense = '',
    this.Drc = '',
    this.DrcText = '',
    this.BatchNo = '',
    this.Material = '',
    this.TotalWeight = '',
    this.CarWeight = '',
    this.ItemWeight = '',
    this.beginWeight = '',
    this.endWeight = '',
    this.multiply = '',
    this.CarType = '',
    this.ProductCode = '',
    this.ProductName = '',
    this.Remark = '',
  });

  factory DrcModel.fromJson(Map<String, dynamic> json) => DrcModel(
        Scalenumber: json["scaleNo"] ?? '-',
        Datetime: json["scaleDate"] ?? '-',
        Name: json["customer"] ?? '-',
        BatchNo: json["batchNo"] ?? '-',
        CarType: json["truckType"] ?? '-',
        Carlicense: json["licensePlate"] ?? '-',
        ProductCode: json["pcode"] ?? '-',
        ProductName: json["pname"] ?? '-',
        DrcText: json["drcText"] ?? '-',
        Remark: json["remark"] ?? '-',
        TotalWeight: json["allWeight"].toString(),
        CarWeight: json["truckWeight"].toString(),
        ItemWeight: json["pdWeight"].toString(),
        Drc: json["drc"].toString(),
      );
}
