import 'package:flutter/material.dart';
import 'package:NERubber/Screen/Login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan[100],
      // appBar: AppBar(
      //   title: const Text("Login"),
      // ),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "บัญชีผู้ใช้",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              const Text(
                "รหัสผ่าน",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(
                obscureText: true,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (1 != 2) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    } else {
                      Widget okButton = TextButton(
                        child: const Text("รับทราบ"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: const Text("ชื่อผู้ใช้งานหรือรหัสผ่านผิด"),
                        content: const Text("กรุณาลองใหม่อีกครั้ง."),
                        actions: [
                          okButton,
                        ],
                      );

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text(
                    "เข้าสู่ระบบ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
