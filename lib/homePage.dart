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
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Vinicius'),
              accountEmail: const Text('tessele@exemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/VINICIUS TESSELE3.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
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
            Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                // Ação para ir para a tela de configurações
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                // Ação para ir para a tela de informações
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                size: 100,
                color: Colors.teal,
              ),
              const SizedBox(height: 20),
              Text(
                'Bem-vindo ao App de QrCode Pix!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Selecione uma opção no menu para começar.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
