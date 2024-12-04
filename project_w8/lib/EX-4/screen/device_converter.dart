import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _dollarController = TextEditingController();
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  String _selectedDevice = 'Euro';
  double _convertedAmount = 0.0;

  final Map<String, double> _conversionRates = {
    'Euro': 0.9,
    'Reil': 4100,
    'Dong': 24000,
  };
  void _convertCurency() {
    final double? dollarAmount = double.tryParse(_dollarController.text);
    if (dollarAmount != null) {
      setState(() {
        _convertedAmount = dollarAmount * _conversionRates[_selectedDevice]!;
      });
    } else {
      setState(() {
        _convertedAmount = 0.0;
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
            controller: _dollarController,
            decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white)),
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _convertCurency();
            },
          ),
          const SizedBox(height: 30),
          const Text("Device:"),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: _selectedDevice,
            dropdownColor: Colors.orange,
            items: _conversionRates.keys
                .map((device) => DropdownMenuItem(
                      value: device,
                      child: Text(
                        device,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedDevice = value!;
                _convertCurency();
              });
            },
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _convertedAmount.toStringAsFixed(2),
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ))
        ],
      )),
    );
  }
}
