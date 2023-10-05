import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: const [
            DrawerHeader(
              child: Text("Hello"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Favorite'),
            ),
            ListTile(
              title: Text('Cart'),
            ),
           
          ],
        ),
    );
  }
}
