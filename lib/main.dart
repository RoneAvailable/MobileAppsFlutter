import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/Bloc/JobDetail/job_detail_bloc.dart';
import 'package:testt/Bloc/JobPending/job_pending_bloc.dart';
import 'package:testt/Screen/Home.dart';
import 'package:testt/Screen/Login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'Bloc/BlocObserver.dart';

void main(List<String> arguments) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: Blocobserver(),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';

  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    if (1 != 2) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<JobPendingBloc>(create: (context) => JobPendingBloc()),
          BlocProvider<JobDetailBloc>(create: (context) => JobDetailBloc()),
        ],
        child: const MaterialApp(
          title: _title,
          home: HomeScreen(),
        ),
      );
    } else {
      return const MaterialApp(
        title: _title,
        home: LoginScreen(),
      );
    }
  }
}
