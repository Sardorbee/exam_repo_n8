import 'package:exam_repo_n8/services/data/models/adress_model.dart';
import 'package:exam_repo_n8/services/provider/db_provider.dart';
import 'package:exam_repo_n8/services/provider/map_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved locations'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<DatabaseProvider>().deleteAllAddress();
                context.read<MapProvider>().clearMarkers();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          List<AddressModel> user = context.watch<DatabaseProvider>().addresses;
          if (user.isEmpty) {
            return const Text("You have no saved locations");
          } else if (user.isNotEmpty) {
            AddressModel x = user[index];
            return ListTile(
              onLongPress: () {
                context.read<DatabaseProvider>().deleteAddress(x.id!);
              },
              onTap: () {
                context.read<MapProvider>().followMe(
                      cameraPosition: CameraPosition(
                          target: LatLng(x.lat, x.long), zoom: 10),
                    );
              },
              title: Text(x.address!),
              subtitle: Text(
                  "lat: ${x.lat.toString()} and long: ${x.long.toString()}"),
            );
          }
          return null;
        },
        itemCount: context.watch<DatabaseProvider>().addresses.length,
      ),
    );
  }
}
