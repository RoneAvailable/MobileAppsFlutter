import 'package:flutter/material.dart';
import 'package:testt/Model/DetailModel.dart';
import 'package:testt/Screen/Login.dart';

import '../Model/Drc.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<DrcModel> drcModel = [];
  List<DetailModel> detailModel = [];

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
        Drc: 70));
    _drcModel.add(DrcModel(
        Scalenumber: '6000',
        Datetime: '15/กย./2565',
        Name: '123123213',
        Carlicense: 'บธ 5790',
        Drc: 60));
    return _drcModel;
  }

  @override
  void initState() {
    drcModel = drcModelData();
    detailModel = detailModelData();
    super.initState();
  }

  _buildCard({required String textDetail, required String textDesc}) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 4),
          Text(
            textDetail,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            textDesc,
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  double iconSize = 40;
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.lightBlueAccent,
              Colors.blueAccent,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            Card(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.lightBlueAccent,
                      Colors.blueAccent,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          const Text(
                            'DRC(%)',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            drcModel[0].Drc.toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            'เลขที่ :' + drcModel[0].Scalenumber!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'วันที่ :' + drcModel[0].Datetime!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Batch No. :' + drcModel[0].BatchNo!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'วัตถุดิบ :' + drcModel[0].Material!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'นามลูกค้า :' + drcModel[0].Name!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'ทะเบียนรถ :' + drcModel[0].Carlicense!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: _buildCard(
                          textDetail: drcModel[0].TotalWeight.toString(),
                          textDesc: "น้ำหนักทั้งหมด")),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            drcModel[0].CarWeight.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "น้ำหนักรถ",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            drcModel[0].ItemWeight.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "น้ำหนักสินค้า",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Column(
                          children: const [
                            Text(
                              'นน. ก่อนรีด',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'นน. หลังรีด',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'ตัวคูณ',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '%DRC',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ]),
                      ...detailModel.map(
                        (item) => TableRow(
                          children: [
                            Column(
                              children: [
                                Text(
                                  item.beginWeight.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  item.endWeight.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  item.beginWeight.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  item.multiply.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'ปรับลด (%)',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'หักสิ่งปลอมปน (บาท)',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'หมายเหตุ',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.blueAccent,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                child: const Text(
                  "ปิดรายการ",
                  style: TextStyle(color: Colors.white),
                ),
                // style: TextButton.styleFrom(
                //   backgroundColor: Colors.blueAccent,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
