import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snack_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars(); // Elimina el snakbar si se presiona nuevamente el boton

    final snackbar = SnackBar(  //CONFIGURACION DEL SNACKBAR
      content:const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar( snackbar );//Aparecer el snakbar y reubicar el boton
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, // Forza a que el cierre del dialogo sea por las opciones definidas por el desarrollador
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Enim sint amet duis id nisi ad proident ipsum eiusmod in ipsum sunt. Cillum aliquip mollit proident ullamco commodo irure ea consectetur sit dolor. Qui sunt do consectetur irure quis esse velit id commodo non. Anim cillum dolore fugiat anim occaecat ea nostrud. Do ea fugiat ut excepteur voluptate. Esse ea deserunt eiusmod ea in esse dolor et.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancel') ),     //Al presionar el boton nos regresa a la pantalla de snackbar con pop()
          FilledButton(onPressed: () => context.pop(), child: const Text('A ceptar'))   //Al presionar el boton nos regresa a la pantalla de snackbar con pop()
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  //CENTRAR EL BOTON
          children: [
            FilledButton.tonal( // tonal HACE EL BOTON CON MENOS SATURACION
              onPressed: (){
                showAboutDialog(  //MUESTRA LAS LICENCIAS QUE TIENE LA APLICACION
                  context: context,
                  barrierDismissible: true,
                  children: [
                    const Text('Consequat occaecat exercitation dolor ullamco dolor deserunt esse duis esse minim. Fugiat in veniam laboris ut voluptate occaecat ut id sint. Consectetur aliqua officia magna nostrud quis enim aute quis et anim voluptate amet aliqua. Dolore anim quis voluptate sit fugiat laboris culpa nostrud adipisicing occaecat. Eiusmod excepteur sint laborum fugiat occaecat eiusmod id aliquip ad reprehenderit. Do eu est fugiat aliquip.')
                  ]
                );
              }, 
              child: const Text("Licencias usadas") 
            ),
            
            FilledButton.tonal(onPressed: () => openDialog(context), child: const Text('Mostrar Dialogo'))

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context), 
      ),
    );
  }
}