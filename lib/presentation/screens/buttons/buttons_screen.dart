import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screens';
  
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_outlined ),
          onPressed: (){
            context.pop();
          }
        ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity, //para tomar todo el ancho de la pantalla
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,                        // Espaciado entre cada boton
          alignment: WrapAlignment.center,    // Centrar los botones
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),
            
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.accessibility_new), 
              label: const Text('Filled Icon')
            ),
            
            OutlinedButton(onPressed: (){}, child: const Text('Outline')
            ),
            OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.terminal), 
              label: const Text('Outline Icon')
            ),
            
            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(
              onPressed: (){},
              label: const Text('Text Icon'),
              icon: const Icon(Icons.account_box_outlined),
            ),

            const CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded )),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: MaterialStatePropertyAll( Colors.white )
              ),
            )


          ],
        ),
      ),

    );
  } 
}



class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
            child: Text('Hola Mundo', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}