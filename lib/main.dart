import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:NERubber/Bloc/JobDetail/job_detail_bloc.dart';
import 'package:NERubber/Bloc/JobEnding/job_ending_bloc.dart';
import 'package:NERubber/Bloc/JobPending/job_pending_bloc.dart';
import 'package:NERubber/Screen/Login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'Bloc/BlocObserver.dart';

void main(List<String> arguments) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // runApp(const MyApp());

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: Blocobserver(),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'FlutterCode';

  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobPendingBloc>(create: (context) => JobPendingBloc()),
        BlocProvider<JobDetailBloc>(create: (context) => JobDetailBloc()),
        BlocProvider<JobEndingBloc>(create: (context) => JobEndingBloc()),
      ],
      child: const MaterialApp(
        title: _title,
        home: LoginScreen(),
      ),
    );
  }
}
