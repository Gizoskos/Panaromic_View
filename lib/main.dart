import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<PanoramaState> _widgetInstanceKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PanoramaViewer(
              key: _widgetInstanceKey,
              child: Image.asset('assets/images/1.jpg')),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: IconButton.filledTonal(
                    onPressed: () {
                      final currentState = _widgetInstanceKey.currentState;
                      if (currentState != null) {
                        final currentZoom = currentState.scene!.camera.zoom;
                        currentState.setZoom(currentZoom + 0.3);
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: IconButton.filledTonal(
                    onPressed: () {
                      final currentState = _widgetInstanceKey.currentState;
                      if (currentState != null) {
                        final currentZoom = currentState.scene!.camera.zoom;
                        currentState.setZoom(currentZoom - 0.3);
                      }
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
