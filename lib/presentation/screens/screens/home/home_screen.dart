import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/screens/cards/cards_screen.dart';


// Clase para la pantalla principal de la aplicacion
class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  
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

      return _CustomListTile(menuItem: menuItem);
      }
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile( 
      leading: Icon( menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text( menuItem.title ),
      subtitle: Text(menuItem.subtitle),
      onTap: (){

        // NAVEGACION A UNA PANTALLA ESPECIFICA CON FLUTTER
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => const ButtonsScreen()
        //   )
        // );
        // NAVEGACION POR LINK DEL CONTEXTO CON FLUTTER
        // Navigator.of(context).pushNamed(menuItem.link);


        // GOROUTER_NAVEGACION POR PANTALLAS DEPENDIENDO DEL CONTEXTO
        // NAVEGACION MEEDIANTE EL LINK DE LA PANTALLA
        context.push(menuItem.link);
        // NAVEGACION MEDIANTE EL NOMBRE DE LA PANTALLA
        // context.pushNamed(CardsScreen.name);


      },
    );
  }
}
