import '../../Model/DetailModel.dart';
import '../../Model/Drc.dart';

class NetworkServices {
  static final NetworkServices _singleton = NetworkServices._internal();

  factory NetworkServices() {
    return _singleton;
  }

  NetworkServices._internal();

  List<DrcModel> drcModelData() {
    List<DrcModel> _drcModel = [];
    _drcModel.add(DrcModel(
      Scalenumber: '70',
      Datetime: '15/กย./2565',
      Name: 'พิมพ์ภาวรรณ',
      Carlicense: 'บธ 5790',
      Drc: 40,
      BatchNo: '650001',
      Material: 'RM1B00(ยางก้อนถ้วย)',
      TotalWeight: '10,220.00',
      CarWeight: '5,605.00',
      ItemWeight: '4,615.00',
      beginWeight: '20.15',
      endWeight: '19.07',
    ));
    _drcModel.add(DrcModel(
      Scalenumber: '40',
      Datetime: '15/กย./2565',
      Name: 'พิมพ์ภาวรรณ',
      Carlicense: 'บธ 5790',
      Drc: 70,
      BatchNo: '650001',
      Material: 'RM1B00(ยางก้อนถ้วย)',
      TotalWeight: '10,220.00',
      CarWeight: '5,605.00',
      ItemWeight: '4,615.00',
      beginWeight: '20.15',
      endWeight: '19.07',
    ));
    _drcModel.add(DrcModel(
      Scalenumber: '6000',
      Datetime: '15/กย./2565',
      Name: '123123213',
      Carlicense: 'บธ 5790',
      Drc: 60,
      BatchNo: '650001',
      Material: 'RM1B00(ยางก้อนถ้วย)',
      TotalWeight: '10,220.00',
      CarWeight: '5,605.00',
      ItemWeight: '4,615.00',
      beginWeight: '20.15',
      endWeight: '19.07',
    ));
    return _drcModel;
  }

  List<DetailModel> detailModelData() {
    List<DetailModel> _detailModelData = [];
    _detailModelData.add(DetailModel(
      BatchNo: '650001',
      Material: 'RM1B00(ยางก้อนถ้วย)',
      TotalWeight: '10,220.00',
      CarWeight: '5,605.00',
      ItemWeight: '4,615.00',
      beginWeight: '20.15',
      endWeight: '19.07',
      multiply: 70,
    ));
    _detailModelData.add(DetailModel(
      BatchNo: '650001',
      Material: 'RM1B00(ยางก้อนถ้วย)',
      TotalWeight: '10,220.00',
      CarWeight: '5,605.00',
      ItemWeight: '4,615.00',
      beginWeight: '20.15',
      endWeight: '19.07',
      multiply: 60,
    ));
    return _detailModelData;
  }
}
