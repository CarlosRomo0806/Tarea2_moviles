import 'package:flutter/material.dart';

enum Service{ amazing, good, okay }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Creacion del controlador del costo del servicio
  var serviceAmount = TextEditingController();
  Service? _quality = Service.amazing;
  double _tip = 0.0;
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tip time'),
          backgroundColor: Color.fromARGB(255, 105, 190, 111),
        ),
        body: ListView(
          children: [
            SizedBox(height: 14),
            ListTile(
              leading: Icon(Icons.store),
              title: Padding(
                padding: EdgeInsets.only(right: 24),
                child: TextField(
                  controller: serviceAmount,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cost of Service',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.room_service),
              title: Text("How was the service?"),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: radioButton(
                    'Amazing(20%)', Service.amazing
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: radioButton(
                    'Good(18%)', Service.good
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: radioButton(
                    'Okay(15%)', Service.okay
                    ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 35),
                  child: Icon(
                    Icons.call_made,
                    color: Color.fromARGB(255, 105, 190, 111),
                  ),
                ),
                const Text("Round up tip?"),
                Expanded(
                  child: Container(),
                ),
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: MaterialButton(
                onPressed: _tipCalculation,
                color: Color.fromARGB(255, 105, 190, 111),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // <-- Radius
                ),
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Tip Amount is: \$${_tip}",
                style: TextStyle(color: Color.fromARGB(255, 105, 105, 105), fontSize: 15),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ));
  }

  void _tipCalculation() {
    double cost = double.parse(serviceAmount.text);
    double totalPercent = _quality == Service.amazing
        ? 20
        : _quality == Service.good
            ? 18
            : 15;
    totalPercent = totalPercent / 100.0;
    _tip = _isSwitched ? (cost * totalPercent).ceilToDouble() : cost * totalPercent;
    setState(() {});
  }

  RadioListTile<Service> radioButton(
      String title, Service qvalue) {
    return RadioListTile<Service>(
      title: Text(title),
      value: qvalue,
      groupValue: _quality,
      onChanged: (Service? value) {
        setState(() {
          _quality = value;
        });
      },
    );
  }
}
