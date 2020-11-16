import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:terbilang/terbilang.dart';

 
void main() => runApp(Calculator());
 
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SimpleCalculator(),
    );
  }
}
 
class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}
 
class _SimpleCalculatorState extends State<SimpleCalculator> {
 
  String nilai_awal = "0";
  String hasil = "0";
  String expression = "";
  double font_size = 38.0;
  double font_hasil = 48.0;
  double angka=0.0;
 
  buttonPressed(String buttonText)
  {
    setState(() {
      if(buttonText=="C")
        {
          nilai_awal="0";
          hasil="0";
          font_size = 38.0;
          font_hasil = 48.0;
        }
      else if(buttonText=="Del")
        {
          font_size = 48.0;
          font_hasil = 38.0;
          nilai_awal=nilai_awal.substring(0,nilai_awal.length -1);
          if(nilai_awal=="")
            nilai_awal="0";
        }
      else if(buttonText=="=")
        {
          font_size = 38.0;
          font_hasil = 8.0;
          
          expression=nilai_awal;
          expression=expression.replaceAll('x', '*');
          expression=expression.replaceAll('%', '/');
 
          try{
            Parser p=Parser();
            Expression exp=p.parse(expression);
            
            ContextModel cm=ContextModel();
            hasil ='${exp.evaluate(EvaluationType.REAL, cm)}';
            hasil= Terbilang().make(number: double.parse(hasil));
            // angka=double.parse(hasil);
          }catch(e){
            hasil ="Tidak Diketahui";
          }
        }
      else
        {
          font_size = 48.0;
          font_hasil = 38.0;
          if(nilai_awal=="0"){
            nilai_awal=buttonText;
          }
          else {
            nilai_awal = nilai_awal + buttonText;
          }
        }
    });
  }
 
  Widget buildButton(String buttonText, double buttonHeight,Color buttonColor)
  {
    return Container(      
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid)
        ),
        padding: EdgeInsets.all(16.00),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.black
          ),
        ),
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      body: ListView(
        children: <Widget>[ 
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(nilai_awal,style: TextStyle(fontSize: font_size),),
          ),
 
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Row(children: [
              // Text(angka.toString(),style: TextStyle(fontSize: font_hasil),),
              Text(hasil,style: TextStyle(fontSize: font_hasil),),

            ],)
          ),
 
          Expanded(
            child: Divider(),
          ),
 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                          buildButton("C", 1, Colors.red),
                          buildButton("Del", 1, Colors.blue),
                          buildButton("%", 1, Colors.blue),
                      ]
                    ),
                    Row(
                        children: [
                          buildButton("7", 1, Colors.white),
                          buildButton("8", 1, Colors.white),
                          buildButton("9", 1, Colors.white),
                        ]
                    ),
                    Row(
                        children: [
                          buildButton("4", 1, Colors.white),
                          buildButton("5", 1, Colors.white),
                          buildButton("6", 1, Colors.white),
                        ]
                    ),
                    Row(
                        children: [
                          buildButton("1", 1, Colors.white),
                          buildButton("2", 1, Colors.white),
                          buildButton("3", 1, Colors.white),
                        ]
                    ),
                    Row(
                        children: [
                          buildButton("0", 1, Colors.white),
                          buildButton("00", 1, Colors.white),
                          buildButton("000", 1, Colors.white),
                        ]
                    ),
                    Row(
                        children: [
                          buildButton(".", 1, Colors.white),
                          buildButton("(", 1, Colors.white),
                          buildButton(")", 1, Colors.white),
                        ]
                    ),
                  ]
                ),
              ),
 
              Container(
                child:
                  Column(
                    children: [
                      buildButton("x", 1, Colors.blue),
                      buildButton("-", 1, Colors.blue),
                      buildButton("+", 1, Colors.blue),
                      buildButton("^", 1, Colors.blue),
                      buildButton("=", 2, Colors.blue),
                    ],
                  ) 
              )
 
            ],
          )
        ]
      )
 
    );
  }
}