import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

// Clase para cargar imagenes de forma infinita
class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

// Gestor de estados
class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imageIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener((){
      // if( ( scrollController.position.pixels + 500 ) >= scrollController.position.maxScrollExtent ){
         loadNextPage();
      // }
    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  //Funcion para cargar nuevas imagenes en nuestra pantalla con un retardo de 2 segundos
  Future loadNextPage() async{
    if( isLoading ) return;
    
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2) );
    addFiveImages();
    isLoading = false;
    
    if( !isMounted ) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3 ));
    if( !isMounted ) return;    //Comprobamos si la aplicacion esta montada y que no lance fallos

    isLoading = false;
    final lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1 );
    addFiveImages();

    setState(() {});

  }

  void moveScrollToBottom(){
    if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }  


  //Funcion  para agregar elementos a nuestro arreglo de imagenes
  void addFiveImages(){
    final lastId = imageIds.last;
    
    // imageIds.add(lastId + 1);
    // imageIds.add(lastId + 2);
    // imageIds.add(lastId + 3);
    // imageIds.add(lastId + 4);
    // imageIds.add(lastId + 5);
    imageIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imageIds.length,
            itemBuilder: (context, index){
              return FadeInImage(
                fit:  BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage( 'https://picsum.photos/id/${imageIds[index]}/500/300' )
              );
            }
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
          child: 
            isLoading ? 
              SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded )
              )
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}