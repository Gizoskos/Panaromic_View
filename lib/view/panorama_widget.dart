import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<PanoramaState> _widgetInstanceKey = GlobalKey();

  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Icon(icon),
        ),
        text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PanoramaViewer(
              key: _widgetInstanceKey,
              hotspots: [
                Hotspot(
                  latitude: -15.0,
                  longitude: -129.0,
                  width: 90,
                  height: 75,
                  widget: hotspotButton(
                      text: "Next scene",
                      icon: Icons.open_in_browser,
                      onPressed: () {}),
                ),
              ],
              child: Image.asset('assets/images/3.jpg')),
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
