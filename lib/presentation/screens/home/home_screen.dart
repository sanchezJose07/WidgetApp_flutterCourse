import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

// Clase para la pantalla principal de la aplicacion
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
      final menuItem = appMenuItems[index];

      return ListTile( 
        title: Text( menuItem.title ),
        subtitle: Text(menuItem.subtitle),
          );
      }
    );
  }
}
