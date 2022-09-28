class DetailModel {
  String? DRC;
  String? Datetime;
  String? Scalenumber;
  String? BatchNo;
  String? Material;
  String? TotalWeight;
  String? CarWeight;
  String? ItemWeight;
  String? beginWeight;
  String? endWeight;
  String? multiply;
  String? Name;
  String? Carlicense;

  DetailModel({
    this.DRC = '',
    this.Datetime = '',
    this.Scalenumber = '',
    this.BatchNo = '',
    this.Material = '',
    this.TotalWeight = '',
    this.CarWeight = '',
    this.ItemWeight = '',
    this.beginWeight = '',
    this.endWeight = '',
    this.multiply = '',
    this.Name = '',
    this.Carlicense = '',
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        Scalenumber: json["scaleNo"] ?? '-',
        Datetime: json["scaleDate"] ?? '-',
        Name: json["customer"] ?? '-',
        BatchNo: json["batchNo"] ?? '-',
        beginWeight: json["weight1"].toString(),
        endWeight: json["weight2"].toString(),
        multiply: json["multiplier"].toString(),
        DRC: json["avgDrc"].toString(),
      );
}
