import 'package:flutter/material.dart';
import 'Calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Calculator(),
      theme: ThemeData(),
      routes: <String, WidgetBuilder> {
          '/utama': (BuildContext context) => Calculator(),
          // '/user': (BuildContext context) => UserPage(),
          // '/user_details': (BuildContext context) => UserDetails(),
          // 'tambah_user':
      }
//  ));
    );
  }

  double returnMSG(double a, double b){
 
    double c ;
 
    c = a + b ;
 
    return c ;
  }

}
