import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:NERubber/Bloc/JobEnding/job_ending_bloc.dart';
import 'package:NERubber/Model/Drc.dart';
import 'package:NERubber/Screen/Login.dart' as loginpage;

import '../Bloc/JobDetail/job_detail_bloc.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.orderNo1, required this.jobPendingBloc})
      : super(key: key);

  final String orderNo1;
  final DrcModel jobPendingBloc;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late JobDetailBloc _jobDetailBloc;
  late JobEndingBloc _jobEndingBloc;
  TextEditingController disMoney = TextEditingController();
  TextEditingController disPercent = TextEditingController();
  TextEditingController reMark = TextEditingController();
  @override
  void initState() {
    _jobDetailBloc = BlocProvider.of<JobDetailBloc>(context);
    _jobEndingBloc = BlocProvider.of<JobEndingBloc>(context);
    _jobDetailBloc
        .add(FetchDataDetail(Scalenumber: widget.orderNo1.toString()));

    super.initState();
  }

  _buildText({required String textDesc}) {
    return Text(
      textDesc,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }

  _buildCard({required String textDetail, required String textDesc}) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 4),
          Text(
            textDetail,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Text(
            textDesc,
            style: const TextStyle(color: Colors.blue, fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    disMoney.dispose();
    disPercent.dispose();
    reMark.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobDetailBloc, JobDetailState>(
      builder: (context, state) {
        if (state is JobDetailWaiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is JobDetailSuccess) {
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
                                  state.detailModel[0].DRC ??
                                      widget.jobPendingBloc.Drc.toString(),
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
                                  'เลขที่ :' +
                                      state.detailModel[0].Scalenumber!,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  'วันที่ :' +
                                      widget.jobPendingBloc.Datetime.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  'Batch No. :' +
                                      widget.jobPendingBloc.BatchNo.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  'วัตถุดิบ :' +
                                      widget.jobPendingBloc.ProductName
                                          .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  'นามลูกค้า :' +
                                      widget.jobPendingBloc.Name.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  'ทะเบียนรถ :' +
                                      widget.jobPendingBloc.Carlicense
                                          .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
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
                                textDetail: widget.jobPendingBloc.TotalWeight
                                    .toString(),
                                textDesc: "น้ำหนักทั้งหมด")),
                        Expanded(
                          flex: 1,
                          child: _buildCard(
                            textDetail:
                                widget.jobPendingBloc.CarWeight.toString(),
                            textDesc: "น้ำหนักรถ",
                          ),
                        ),
                        Expanded(
                          child: _buildCard(
                            textDetail:
                                widget.jobPendingBloc.ItemWeight.toString(),
                            textDesc: "น้ำหนักสินค้า",
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
                                children: [
                                  _buildText(textDesc: "นน. ก่อนรีด"),
                                ],
                              ),
                              Column(
                                children: [
                                  _buildText(textDesc: 'นน. หลังรีด'),
                                ],
                              ),
                              Column(
                                children: [
                                  _buildText(textDesc: 'ตัวคูณ'),
                                ],
                              ),
                              Column(
                                children: [
                                  _buildText(textDesc: '%DRC'),
                                ],
                              ),
                            ]),
                            ...state.detailModel.map(
                              (item) => TableRow(
                                children: [
                                  Column(
                                    children: [
                                      _buildText(
                                          textDesc:
                                              item.beginWeight.toString()),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      _buildText(
                                          textDesc: item.endWeight.toString()),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      _buildText(
                                          textDesc: item.multiply.toString()),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      _buildText(textDesc: item.DRC.toString()),
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
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}'))
                          ],
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: disPercent.clear,
                              icon: const Icon(Icons.clear),
                              color: Colors.white,
                            ),
                            border: const OutlineInputBorder(),
                            hintText: "ปรับลด (%)",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          controller: disPercent,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}'))
                          ],
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: disMoney.clear,
                              icon: const Icon(Icons.clear),
                              color: Colors.white,
                            ),
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "หักสิ่งปลอมปน (บาท)",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                          controller: disMoney,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: reMark.clear,
                              icon: const Icon(Icons.clear),
                              color: Colors.white,
                            ),
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "หมายเหตุ",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                          controller: reMark,
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
                    child: BlocBuilder<JobEndingBloc, JobEndingState>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            _jobEndingBloc.add(EndingEvent(
                              Scalenumber: widget.orderNo1.toString(),
                              dismoney: disMoney.text,
                              dispercent: disPercent.text,
                              remark: reMark.text,
                            ));
                            if (state is JobEndingError) {}
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const loginpage.LoginScreen();
                            }));
                          },
                          child: const Text(
                            "ปิดรายการ",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Text("Not Found");
      },
    );
  }
}
