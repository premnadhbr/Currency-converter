import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyConverter extends StatefulWidget {
  CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          "Currency converter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    hintText: 'Please enter the amount in USD',
                    hintStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: border,
                    enabledBorder: border),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  print(textEditingController.text);
                  print(double.parse(textEditingController.text) * 81);
                  setState(() {
                    result = double.parse(textEditingController.text) * 81;
                  });
                },
                child: const Text("Convert"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
