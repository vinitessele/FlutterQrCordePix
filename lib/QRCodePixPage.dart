import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:appqrcodepix/util.dart';

class QRCodePixPage extends StatefulWidget {
  const QRCodePixPage({super.key});

  @override
  State<QRCodePixPage> createState() => _QRCodePixPageState();
}

class _QRCodePixPageState extends State<QRCodePixPage> {
  final TextEditingController _amountController = TextEditingController();
  String pixCode = '';

  void _generatePixCode() {
    setState(() {
      // Converter o valor do campo de texto para um double
      double? amount = double.tryParse(_amountController.text);

      print(_amountController.text);
      pixCode = generatePixCode(amount);
      print(pixCode);
    });
  }

  void _setAmountAndGenerate(double amount) {
    setState(() {
      _amountController.text = amount.toStringAsFixed(2);
      _generatePixCode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de QR Code Pix'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (pixCode.isNotEmpty) ...[
              QrImageView(
                data: pixCode,
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              SelectableText(
                pixCode,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20),
            ],
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor do Pix',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildAmountButton(1.00, 'R\$1,00'),
                _buildAmountButton(5.00, 'R\$5,00'),
                _buildAmountButton(10.00, 'R\$10,00'),
                _buildAmountButton(50.00, 'R\$50,00'),
                _buildAmountButton(100.00, 'R\$100,00'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePixCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Gerar QR Code Pix'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountButton(double amount, String label) {
    return ElevatedButton.icon(
      onPressed: () => _setAmountAndGenerate(amount),
      icon: const Icon(Icons.attach_money),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal.shade200,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
