import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  var value = 0, amount = 0;
  double tempvalue = 0, totalamount = 0;
  TextEditingController priceController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  void calculate() {
    setState(() {
      value = int.parse(priceController.text);
      amount = int.parse(amountController.text);
      tempvalue = value / 1000;
      totalamount = tempvalue * amount;

      // var alertDialog = AlertDialog(
      //   title: Text("Alert Message By ME"),
      //   content: Text('$totalamount'),
      //   actions: <Widget>[
      //     new FlatButton(
      //       child: new Text('OK'),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     )
      //   ],
      // );
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return alertDialog;
      //     });

      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("\n\n\n\n\nYOUR TOTAL PRICE"),
            // Retrieve the text which the user has entered by
            // using the TextEditingController.
            content: Text('\n\n\n\n\n\n\nn$totalamount',
                style: TextStyle(fontSize: 20)),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator For Everything'),
        ),
        backgroundColor: Colors.blueGrey,
        body: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                Center(
                    child: Text(
                  "Hello ! WELCOME TO MY Calculator  ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0,
                      wordSpacing: 1,
                      shadows: [
                        Shadow(
                            color: Colors.blue,
                            offset: Offset(5, 3),
                            blurRadius: 10)
                      ]),
                )),
                Padding(
                  padding: EdgeInsets.all(45),
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter The Price Of 1KG',
                      hintText: '',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(45),
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter The Amount In Gram That U Want Buy ',
                      hintText: '',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Calulate', style: TextStyle(fontSize: 20)),
                  onPressed: calculate,
                )
              ],
            )));
  }
}
