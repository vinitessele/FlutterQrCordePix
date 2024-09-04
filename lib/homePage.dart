import 'package:appqrcodepix/QRCodePixPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Vinicius'),
              accountEmail: const Text('tessele@exemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text('Gerar QrCode'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCodePixPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(child: const Text('Tela Inicial')),
    );
  }
}
