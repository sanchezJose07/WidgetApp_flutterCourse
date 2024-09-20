import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens/screens.dart';


//Rutas para las pantallas de la aplicacion
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    //HOME
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context,state) => const HomeScreen()
    ),

    // BUTTONS
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context,state) => const ButtonsScreen()
    ),

    // CARDS
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context,state) => const CardsScreen()
    ),
  ]
);