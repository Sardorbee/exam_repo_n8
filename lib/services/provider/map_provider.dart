import 'dart:async';

import 'package:exam_repo_n8/services/data/models/adress_model.dart';
import 'package:exam_repo_n8/services/data/models/adress_type.dart';
import 'package:exam_repo_n8/services/data/models/universal_data.dart';
import 'package:exam_repo_n8/services/data/network/api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider with ChangeNotifier {
  MapProvider({required this.apiService, required BuildContext context});

  final ApiService apiService;

  TextEditingController podyezdcontroller = TextEditingController();
  TextEditingController etajcontroller = TextEditingController();
  TextEditingController housecontroller = TextEditingController();
  TextEditingController orientrcontroller = TextEditingController();
  String address = '';
  String kind = "street";
  Set<Marker> markers = {};
  double latt = 0;
  double long = 0;
  bool isKeyboardPressed = false;
  AddressType selectedAddressType = AddressType.none;
  updateSelectedAddressType(value) {
    selectedAddressType = value;
    notifyListeners();
  }

  updateKeyboard(bool v) {
    isKeyboardPressed = v;
    notifyListeners();
  }

  tozalash() {
    podyezdcontroller.clear();
    etajcontroller.clear();
    housecontroller.clear();
    orientrcontroller.clear();
    notifyListeners();
  }

  final Completer<GoogleMapController> controlleer =
      Completer<GoogleMapController>();

  Future<void> followMe({required CameraPosition cameraPosition}) async {
    final GoogleMapController controller = await controlleer.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
    notifyListeners();
  }

  getAddressByLatLong({required LatLng latLng}) async {
    UniversalData universalData = await apiService.getAddress(
      latLng: latLng,
      kind: kind,
    );

    if (universalData.error.isEmpty) {
      address = universalData.data as String;
    } else {
      debugPrint("ERROR:${universalData.error}");
    }
    notifyListeners();
  }

  clearMarkers() {
    markers.clear();
    notifyListeners();
  }

  addSavedMArker(List<AddressModel>? addresses) {
    if (addresses!.isNotEmpty) {
      for (var address in addresses) {
        final customIcon = BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue, // Adjust the color as needed
        );

        markers.add(
          Marker(
            icon: customIcon,
            markerId: MarkerId(address.id.toString()),
            position: LatLng(address.lat, address.long),
            infoWindow: InfoWindow(
              title: address.address,
              snippet: address.createdAt,
            ),
          ),
        );
      }
    }
    notifyListeners();
  }

  updateLatLngAndAddMArker(
    LatLng argument,
  ) {
    latt = argument.latitude;
    long = argument.longitude;

    markers.add(
      Marker(
        markerId: const MarkerId('myMarker'),
        position: LatLng(latt, long),
        infoWindow: InfoWindow(title: address),
      ),
    );
    notifyListeners();
  }

  LatLng? latLng;

  updateLatLng(LatLng lL) {
    latLng = lL;
    notifyListeners();
  }
}
