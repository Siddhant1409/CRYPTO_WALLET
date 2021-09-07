import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Net/flutterfire.dart';

class AddView extends StatefulWidget {
  AddView({Key? key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "ethreeum",
    "tether"
  ]; //lowercase nameof the coin.
  String dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          value: dropdownValue,
          onChanged: (value) {
            setState(() {
              dropdownValue = value.toString();
            });
          },
          items: coins.map<DropdownMenuItem<String>>(
            (value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextFormField(
            controller: _amountController,
            decoration: InputDecoration(
              labelText: "Coin Amount",
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.4,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: MaterialButton(
            onPressed: () async {
              await addCoin(dropdownValue, _amountController.text);
              Navigator.of(context).pop();
            },
            child: Text("Add"),
          ),
        ),
      ],
    ));
  }
}