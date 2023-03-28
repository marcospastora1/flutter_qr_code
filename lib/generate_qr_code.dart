import 'package:flutter/material.dart';
import 'package:flutter_qr_code/qr_image.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class GenerateQRCode extends StatefulWidget {
  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();
  final codigo = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + QR code'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your URL',
              ),
            ),
          ),
          //This button when pressed navigates to QR code generation
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(controller);
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE'),
            ),
          ),

          Obx(
            () => Visibility(
              visible: codigo.value.isNotEmpty,
              child: Text(codigo.value),
            ),
          ),

          ElevatedButton(
            onPressed: scanBarcode,
            child: const Text('READ QR CODE'),
          ),
        ],
      ),
    );
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", // Cor da tela do scanner
      "Cancelar", // Texto do botão de cancelar
      true, // Mostrar um flash na tela
      ScanMode.BARCODE, // Tipo de código de barras a ser digitalizado
    );

    if (barcodeScanRes != '-1') {
      //retorna -1 quando tem algum erro
      codigo.value = barcodeScanRes;
    } else {
      codigo.value = 'Falha ao escanear';
    }
  }
}
