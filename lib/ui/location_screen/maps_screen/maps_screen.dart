import 'package:exam_repo_n8/services/provider/map_provider.dart';
import 'package:exam_repo_n8/services/provider/tab_provider.dart';
import 'package:exam_repo_n8/services/provider/ui_utils/error_message_dialog.dart';
import 'package:exam_repo_n8/ui/location_screen/maps_screen/widgets/show_place_info/show_info.dart';
import 'package:exam_repo_n8/ui/location_screen/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    super.key,
  });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late CameraPosition myLocation;

  @override
  void initState() {
    super.initState();
    alert();
    myLocation = CameraPosition(
      target: context.read<MapProvider>().latLng!,
      zoom: 20.0,
    );
  }

  alert() async {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedScreen(),
                    ));
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onTap: (argument) {
              // context.read<MapProvider>().updateLatLngAndAddMArker(argument);
              print(argument);
              // context
              //     .read<MapProvider>()
              //     .addSavedMArker(context.read<DatabaseProvider>().addresses);
              showPlaceInfo(context, argument, myLocation);
            },
            zoomControlsEnabled: false,
            compassEnabled: true,
            mapType: MapType.hybrid,
            initialCameraPosition: myLocation,
            markers: context.watch<MapProvider>().markers,
            onMapCreated: (GoogleMapController controller) {
              context.read<MapProvider>().controlleer.complete(controller);
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              heroTag: 'a',
              key: UniqueKey(),
              onPressed: () {
                context
                    .read<MapProvider>()
                    .followMe(cameraPosition: myLocation);
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
