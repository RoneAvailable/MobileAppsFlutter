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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  List<DrcModel> drcModel = [];

  @override
  void initState() {
    _jobPendingBloc = BlocProvider.of<JobPendingBloc>(context);
    _jobPendingBloc.add(FetchData());
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _refreshData() {
    setState(() {
      _jobPendingBloc = BlocProvider.of<JobPendingBloc>(context);
      _jobPendingBloc.add(FetchData());
      textEditingController.clear();
    });
  }

  void _filterData(String word) {
    setState(() {
      _jobPendingBloc = BlocProvider.of<JobPendingBloc>(context);
      _jobPendingBloc.add(FilterData(word: word));
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
            suffixIcon: IconButton(
              onPressed: textEditingController.clear,
              icon: const Icon(Icons.clear),
              color: Colors.white,
            ),
            labelText: 'Search...',
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Colors.white : Colors.white),
          ),
          controller: textEditingController,
          onChanged: (value) => _filterData(value),
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
                        padding: const EdgeInsets.only(bottom: 100, top: 10),
                        itemCount: state.drcModelData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            autofocus: true,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Detail(
                                  orderNo1:
                                      state.drcModelData[index].Scalenumber!,
                                  jobPendingBloc: state.drcModelData[index],
                                );
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              state.drcModelData[index].Drc
                                                  .toString(),
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
                                                  state.drcModelData[index]
                                                      .Scalenumber!,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'วันที่ :' +
                                                  state.drcModelData[index]
                                                      .Datetime!,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'ลูกค้า :' +
                                                  state.drcModelData[index]
                                                      .Name!,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'ทะเบียนรถ :' +
                                                  state.drcModelData[index]
                                                      .Carlicense!,
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
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              }
              return const Center(child: Text("Not Found"));
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
