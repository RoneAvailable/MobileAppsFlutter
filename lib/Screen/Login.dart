import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/Bloc/JobPending/job_pending_bloc.dart';
import 'package:testt/Screen/Detail.dart';
import '../Model/Drc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingController = TextEditingController();
  late JobPendingBloc _jobPendingBloc;

  List<DrcModel> drcModel = [];

  List<DrcModel> drcModel1() {
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
    drcModel = drcModel1();
    _jobPendingBloc = BlocProvider.of<JobPendingBloc>(context);
    _jobPendingBloc.add(FetchData());
    super.initState();
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void _refreshData() {
    setState(() {
      _jobPendingBloc = BlocProvider.of<JobPendingBloc>(context);
      _jobPendingBloc.add(FetchData());
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            labelText: 'Search...',
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Colors.white : Colors.white),
          ),
          controller: textEditingController,
        ),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        key: _refreshIndicatorKey,
        onRefresh: () async {
          return _refreshData();
        },
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
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<JobPendingBloc, JobPendingState>(
            builder: (context, state) {
              if (state is JobPendingWaiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is JobPendingSuccess) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.drcModelData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Detail();
                              }));
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
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
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          const Text(
                                            'DRC(%)',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            drcModel[index].Drc.toString(),
                                            style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'เลขที่ :' +
                                                drcModel[index].Scalenumber!,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'วันที่ :' +
                                                drcModel[index].Datetime!,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'ลูกค้า :' + drcModel[index].Name!,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'ทะเบียนรถ :' +
                                                drcModel[index].Carlicense!,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 4),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              }
              return const Text("Not Found");
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _refreshData,
        icon: const Icon(Icons.refresh),
        label: const Text('Refresh'),
      ),
    );
  }
}
