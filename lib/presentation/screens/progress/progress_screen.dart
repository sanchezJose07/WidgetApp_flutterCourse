import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular progress indicator'),
          SizedBox( height: 10),
          CircularProgressIndicator( strokeWidth: 6, backgroundColor: Colors.black12, ),
        
          SizedBox(height: 20),
          Text('Circular y Linear indicador controlado'),
          SizedBox(height: 20),

          _ControllerProgressIndicator(),


        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 500), (value){  //Streams para el llenado de los progressIndicator
        return (value*2)/100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0; // Valor del value

        return  Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,      //Centrar los widgets del row
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 6, backgroundColor: Colors.black12 ),
              const SizedBox(width: 20 ),
              Expanded(
                child: LinearProgressIndicator(value: progressValue)
              )
            ],
          ),
        );
      }
    );
  }
}