import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testt/Bloc/JobPending/job_pending_bloc.dart';
import 'package:testt/Screen/Home.dart';
import 'package:testt/Screen/Login.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'Bloc/BlocObserver.dart';

void main(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = Uri.https(
    'www.googleapis.com',
    '/books/v1/volumes',
    {'q': '{http}'},
  );

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    if (kDebugMode) {
      print('Number of books about http: $itemCount.');
    }
  } else {
    if (kDebugMode) {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: Blocobserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    if (1 != 2) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<JobPendingBloc>(create: (context) => JobPendingBloc()),
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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue);
//   static const TextStyle optionStyle1 =
//       TextStyle(fontSize: 12, color: Colors.blueGrey);
//   static final List<Widget> _widgetOptions = <Widget>[
//     RichText(
//       textAlign: TextAlign.center,
//       text: const TextSpan(
//         style: optionStyle,
//         children: <TextSpan>[
//           TextSpan(text: 'บริษัท นอร์ทอัส รับเบอร์ จำกัด (มหาชน)\n'),
//           TextSpan(text: 'NORTHEAST RUBBER PLC.\n'),
//           TextSpan(text: 'WWW.NERUBBER.COM\n'),
//           TextSpan(
//               text: 'โทรศัพท์ : 044-666928 และ 044-666929\n',
//               style: optionStyle1),
//           TextSpan(
//               text: 'โทรสาร : 044-666212 และ 044-666213\n',
//               style: optionStyle1),
//           TextSpan(text: 'อีเมล : ner@nerubber.com\n', style: optionStyle1),
//         ],
//       ),
//     ),
//     ListView(
//       children: const <Widget>[
//         Card(
//             child: ListTile(
//                 title: Text('One-line ListTile')
//             )
//         ),
//         Card(
//           child: ListTile(
//             leading: FlutterLogo(),
//             title: Text('One-line with leading widget'),
//           ),
//         ),
//       ],
//     ),
//     const Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//     const Text(
//       'Index 3: Settings',
//       style: optionStyle,
//     ),
//     const Text(
//       'Index 4: QR',
//       style: optionStyle,
//     ),
//     const Text(
//       'Index 5: TEST',
//       style: optionStyle,
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     _selectedIndex = index;
//     setState(() {
//
//     });
//   }
//
//   // void _incrementCounter() {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   // title: const Text('BottomNavigationBar Sample'),
//       // ),
//       backgroundColor: Colors.cyan[100],
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(
//                     'https://media.istockphoto.com/photos/light-teal-defocused-blurred-motion-abstract-background-picture-id1138286481?k=20&m=1138286481&s=612x612&w=0&h=ydTDA5dCLVvJ_D6rvbAf5frQrZfolWAINYHVloU7P1Y='),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: _widgetOptions.elementAt(_selectedIndex),
//           )
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.monetization_on),
//             label: 'รายการรับซื้อ',
//             backgroundColor: Colors.white30,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'ขายล่วงหน้า',
//             backgroundColor: Colors.white30,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_alt),
//             label: 'ประวัติการขาย',
//             backgroundColor: Colors.white30,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'ข้อมูลลูกค้า',
//             backgroundColor: Colors.white30,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.qr_code),
//             label: 'QR',
//             backgroundColor: Colors.white30,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         unselectedItemColor: Colors.black,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.shifting,
//       ),
//     );
//   }
// }
