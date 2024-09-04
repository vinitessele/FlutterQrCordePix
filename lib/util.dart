String generatePixCode({
  required String pixKey,      // Chave Pix (e-mail, CPF, CNPJ, etc.)
  String? merchantName,        // Nome do recebedor
  String? merchantCity,        // Cidade do recebedor
  double? amount,              // Valor opcional
  String? transactionId,       // Identificador da transação (opcional)
}) {
  // Formatação padrão do código Pix de acordo com o padrão EMV
  String pixCode = '';

  // Identificador do Payload Format Indicator
  pixCode += '000201';

  // Merchant Account Information
  String merchantAccountInfo = '0014BR.GOV.BCB.PIX01${pixKey.length}$pixKey';
  pixCode += '26${merchantAccountInfo.length}$merchantAccountInfo';

  // Merchant Category Code
  pixCode += '52040000';

  // Transaction Currency (BRL)
  pixCode += '5303986';

  // Valor
  if (amount != null && amount > 0) {
    String formattedAmount = amount.toStringAsFixed(2).replaceAll('.', '');
    pixCode += '54${formattedAmount.length}$formattedAmount';
  }

  // Nome do recebedor
  if (merchantName != null) {
    pixCode += '5802BR';  // Código do país
    pixCode += '59${merchantName.length}$merchantName';
  }

  // Cidade do recebedor
  if (merchantCity != null) {
    pixCode += '60${merchantCity.length}$merchantCity';
  }

  // Transaction ID
  if (transactionId != null) {
    pixCode += '62${transactionId.length}$transactionId';
  }

  // Adicionar CRC (Checksum)
  pixCode += '6304';
  String crc16 = calculateCRC16(pixCode);
  pixCode += crc16;

  return pixCode;
}

// Função para calcular o CRC16 do código Pix
String calculateCRC16(String str) {
  int crc = 0xFFFF;
  for (int i = 0; i < str.length; i++) {
    crc ^= str.codeUnitAt(i) << 8;
    for (int j = 0; j < 8; j++) {
      if ((crc & 0x8000) != 0) {
        crc = (crc << 1) ^ 0x1021;
      } else {
        crc <<= 1;
      }
    }
  }
  return crc.toRadixString(16).toUpperCase().padLeft(4, '0');
}


