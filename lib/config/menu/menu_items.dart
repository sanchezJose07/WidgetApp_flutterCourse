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
    icon: MaterialCommunityIcons.gesture_tap_button,
  ),
  
  MenuItems(
    title: "Tarjetas",
    subtitle: "Un contenedor estilizado",
    link: "/cards",
    icon: MaterialCommunityIcons.cards,
  ),
  
  MenuItems(
    title: "ProgressIndicator", 
    subtitle: "Generales y controlador", 
    link: "/progress", 
    icon: FontAwesome.refresh
    ),

    MenuItems(
      title: "StackBar y dialogos", 
      subtitle: "Indicadores en pantalla", 
      link: "/stackBar",
      icon: Octicons.stack
    ),

    MenuItems(
      title: 'Animated container', 
      subtitle: 'Stateful widget animado', 
      link: '/animated', 
      icon: MaterialCommunityIcons.checkbox_marked_outline
    ),

    MenuItems(
      title: 'UI Controls + Tiles', 
      subtitle: 'Una serie de controles de Flutter', 
      link: '/ui-controls', 
      icon: FontAwesome5Brands.uikit
    ),

    MenuItems(
      title: 'Introduccion a la aplicacion', 
      subtitle: 'Pequeño tutorial introductorio', 
      link: '/tutorial', 
      icon: Feather.slack
    ),


];
