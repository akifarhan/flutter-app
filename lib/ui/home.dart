import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0;


  calculateTotalPerPerson(int totalTip, double billAmount, int splitBy) {
    var totalPerPerson = (totalTip + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {

    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.purpleAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Per Person", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 15,
                  )),
                  Text("\$ ${calculateTotalPerPerson(_tipPercentage, _billAmount, _personCounter)}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 40))],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.blueGrey.shade100, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                      prefixText: "Bill Amount ",
                      prefixIcon: Icon(Icons.attach_money)),
                  onChanged: (String value) {
                    try {
                      _billAmount = double.parse(value);
                    } catch (exception) {
                      _billAmount = 0.0;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Split",
                        style: TextStyle(color: Colors.grey.shade600)),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCounter > 1) {
                                _personCounter--;
                              }
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.purpleAccent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Center(
                              child: Text("-",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                            ),
                          ),
                        ),
                        Text("$_personCounter", style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _personCounter++;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.purpleAccent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Center(
                              child: Text("+",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Tip",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          )
                        ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "$_tipPercentage %",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                          fontSize: 20,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 100,
                      divisions: 10,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.grey,
                      value: _tipPercentage.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          _tipPercentage = value.round();
                        });
                      }
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = ["hai", "this", "is", "a", "list", "of", "words"];

  void _showQuote() {
    setState(() {
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(quotes[_index % quotes.length],
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        )))),
            Divider(
              thickness: 2,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: FlatButton.icon(
                    onPressed: _showQuote,
                    color: Colors.blueAccent.shade400,
                    icon: Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    ),
                    label: Text("Inspire me!",
                        style: TextStyle(
                          fontSize: 18.8,
                          color: Colors.white,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quotes App"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text("Hello"),
              ],
            )));
  }
}

class ScaffoldExample extends StatelessWidget {
  tapButton() {
    debugPrint("Tap");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => debugPrint("Email Tapped")),
            IconButton(
              icon: Icon(Icons.portrait),
              onPressed: tapButton,
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.power_settings_new), title: Text("Power")),
          BottomNavigationBarItem(
              icon: Icon(Icons.restore_page), title: Text("Reload")),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.chat),
        ),
        backgroundColor: Colors.limeAccent,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton()
              // InkWell(
              //   child: Text(
              //     "Click me!",
              //     style: TextStyle(
              //       color: Colors.red,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 100,
              //       ),
              //   ),
              //   onTap: () => debugPrint("clicked"),
              // )
            ],
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("This is snack bar!"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(8.0)),
          child: Text("Button"),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var material = Material(
      color: Colors.white,
      child: Center(
          child: Text(
        "Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.blue,
        ),
      )),
    );
    return material;
  }
}
