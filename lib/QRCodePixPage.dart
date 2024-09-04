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
      
      // Definir o código Pix com o valor inserido
      pixCode = generatePixCode(
        pixKey: 'vinicius_tessele@hotmail.com', // Substitua pela sua chave Pix
        merchantName: 'Vinicius Tessele',
        merchantCity: 'Toledo',
        amount: amount ?? 0.0, // Valor em BRL, ou 0 se o valor for inválido
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de QR Code Pix'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor do Pix',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePixCode,
              child: const Text('Gerar QR Code Pix'),
            ),
            const SizedBox(height: 20),
            if (pixCode.isNotEmpty) // Exibir o QR Code somente se o código Pix for gerado
              QrImageView(
                data: pixCode, // Dados para gerar o QR Code
                version: QrVersions.auto,
                size: 200.0,
              ),
          ],
        ),
      ),
    );
  }
}
