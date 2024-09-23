import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  
  MenuItems(
    title: "Tarjetas",
    subtitle: "Un contenedor estilizado",
    link: "/cards",
    icon: MaterialCommunityIcons.credit_card_outline,
  ),
  
  MenuItems(
    title: "ProgressIndicator", 
    subtitle: "Generales y controlador", 
    link: "/progress", 
    icon: MaterialCommunityIcons.refresh_circle
    ),

    MenuItems(
      title: "StackBar y dialogos", 
      subtitle: "Indicadores en pantalla", 
      link: "/stackBar",
      icon: MaterialCommunityIcons.inbox_multiple_outline
    ),


];
