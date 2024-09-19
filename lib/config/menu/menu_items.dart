import 'package:flutter/material.dart';

// Clase para los items del menu de la aplicacion ***
class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

// Lista de las opciones de la pagina principal
const appMenuItems = <MenuItems>[
  MenuItems(
    title: "Botones",
    subtitle: "Varios botones en flutter",
    link: "/bottons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: "Tarjetas",
    subtitle: "Un contenedor estilizado",
    link: "/cards",
    icon: Icons.credit_card,
  ),
];
