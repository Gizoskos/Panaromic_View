import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/theta_bloc.dart';
import 'package:flutter_application_1/blocs/theta_state.dart';
import 'package:flutter_application_1/data/jpeg.dart';
import 'package:flutter_application_1/view/panorama_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ThetaBloc>(
          create: (context) => ThetaBloc(),
        ),
        ChangeNotifierProvider<JpgFilesProvider>(
          create: (_) => JpgFilesProvider(),
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<ThetaBloc, ThetaState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Panoramic View"),
              ),
              body: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}

  /*@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThetaBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: BlocBuilder<ThetaBloc, ThetaState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black54,
                title: const Text("THETA TSD"),
              ),
            );
          },
        ),
      ),
    );
  }
}*/