import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/theta_bloc.dart';
import 'package:flutter_application_1/blocs/theta_event.dart';
import 'package:flutter_application_1/blocs/theta_state.dart';
import 'package:flutter_application_1/view/SecondPanoramaViewer';
import 'package:flutter_application_1/view/hotspot_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class PanoramaNetwork extends StatefulWidget {
  const PanoramaNetwork({
    super.key,
  });
  @override
  State<PanoramaNetwork> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<PanoramaNetwork> {
  final GlobalKey<PanoramaState> _widgetInstanceKey = GlobalKey();

  get jpeg => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThetaBloc, ThetaState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PanoramaViewer(
                  key: _widgetInstanceKey,
                  hotspots: [
                    Hotspot(
                      latitude: -15.0,
                      longitude: -129.0,
                      width: 300,
                      height: 300,
                      widget: HotSpotButton(
                          text: "Explore",
                          icon: Icons.open_in_browser,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SecondPanoramaNetwork()));
                          }),
                    ),
                  ],
                  child: Image.asset('assets/images/2.jpg')),
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
      },
    );
  }
}
