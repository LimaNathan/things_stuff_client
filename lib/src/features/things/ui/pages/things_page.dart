import 'package:flutter/material.dart';
import 'package:things_stuff_client/src/features/auth/interactor/atoms/auth_atom.dart';

class ThingsPage extends StatefulWidget {
  const ThingsPage({super.key});

  @override
  State<ThingsPage> createState() => _ThingsPageState();
}

class _ThingsPageState extends State<ThingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 100),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context);
                loggoutAction();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Things'),
      ),
      body: Container(),
    );
  }
}
