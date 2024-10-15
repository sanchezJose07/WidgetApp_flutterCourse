import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo( this.title, this.caption, this.imageUrl );
}

//lista para la muestra de los textos e imagenes de nuestro tutorial
final slides = <SlideInfo>[
  SlideInfo('Bienvenido', 'Ex fugiat irure nostrud mollit ipsum anim nulla nulla velit.', 'assets/images/1.png'),
  SlideInfo('Navegacion rapida', 'Sunt sint eu eiusmod duis commodo velit dolor culpa nulla.', 'assets/images/2.png'),
  SlideInfo('Disfrute el contenido', 'Enim duis magna nostrud ullamco sint enim esse cillum.', 'assets/images/3.png'),
];



// Clase para la configuracion de la ventana de tutorial de induccion.
class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  
  @override
  void initState() {
    super.initState();
    
    pageviewController.addListener((){
      print( '${pageviewController.page}');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
                (slideData) => _Slide(
                    title: slideData.title, 
                    caption: slideData.caption, 
                    imageUrl: slideData.imageUrl
                  )
              ).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop()
              )          
          )
            
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle )
          ],
        ),
      ),
    );
  }
}