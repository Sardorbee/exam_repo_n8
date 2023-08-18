import 'package:exam_repo_n8/services/data/models/adress_model.dart';
import 'package:exam_repo_n8/services/data/models/adress_type.dart';
import 'package:exam_repo_n8/services/provider/db_provider.dart';
import 'package:exam_repo_n8/services/provider/map_provider.dart';
import 'package:exam_repo_n8/ui/users_screen/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

void showPlaceInfo(
    BuildContext context, LatLng location, CameraPosition mylocation) async {
  var result = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext builder) {
      if (!context.mounted) {
        context.read<MapProvider>().tozalash();
      }
      double responsiveHeight = MediaQuery.of(context).size.height;

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: context.watch<MapProvider>().isKeyboardPressed
                ? responsiveHeight * 0.68
                : responsiveHeight * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<MapProvider>(
                  builder: (context, x, child) {
                    x.getAddressByLatLong(latLng: location);
                    return Text(x.address, style: TextStyle(fontSize: 18.sp));
                  },
                ),
                Text('Lat: ${location.latitude}'.substring(0, 12)),
                Text('Long: ${location.longitude}'.substring(0, 12)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70.h,
                      child: CustomText(
                        controller:
                            context.read<MapProvider>().podyezdcontroller,
                        label: 'Podyezd',
                        keyboardType: TextInputType.number,
                        onTap: () {
                          context.read<MapProvider>().updateKeyboard(true);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20.h,
                    ),
                    SizedBox(
                      width: 70.h,
                      child: CustomText(
                        controller: context.read<MapProvider>().etajcontroller,
                        label: 'Floor',
                        keyboardType: TextInputType.number,
                        onTap: () {
                          context.read<MapProvider>().updateKeyboard(true);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20.h,
                    ),
                    SizedBox(
                      width: 70.h,
                      child: CustomText(
                        controller: context.read<MapProvider>().housecontroller,
                        label: 'House',
                        keyboardType: TextInputType.number,
                        onTap: () {
                          context.read<MapProvider>().updateKeyboard(true);
                        },
                      ),
                    ),
                    SizedBox(
                        width: 70.w,
                        child: Consumer<MapProvider>(
                          builder: (context, x, child) {
                            return PopupMenuButton<AddressType>(
                              initialValue: x.selectedAddressType,
                              onSelected: (AddressType value) {
                                x.updateSelectedAddressType(value);
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<AddressType>>[
                                const PopupMenuItem<AddressType>(
                                  value: AddressType.home,
                                  child: Text('Home'),
                                ),
                                const PopupMenuItem<AddressType>(
                                  value: AddressType.work,
                                  child: Text('Work'),
                                ),
                                const PopupMenuItem<AddressType>(
                                  value: AddressType.another,
                                  child: Text('Another'),
                                ),
                              ],
                              icon: Text(x.selectedAddressType ==
                                      AddressType.home
                                  ? "Home"
                                  : x.selectedAddressType == AddressType.work
                                      ? "Work"
                                      : x.selectedAddressType ==
                                              AddressType.another
                                          ? "Another"
                                          : "Choose Category"),
                            );
                          },
                        ))
                  ],
                ),
                SizedBox(
                  child: CustomText(
                    controller: context.read<MapProvider>().orientrcontroller,
                    label: "Orientr",
                    onTap: () {
                      context.read<MapProvider>().updateKeyboard(true);
                    },
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Consumer<MapProvider>(
                      builder: (context, x, child) {
                        return ElevatedButton(
                            onPressed: () {
                              {
                                context.read<DatabaseProvider>().insertAddress(
                                      AddressModel(
                                        type: x.selectedAddressType ==
                                                AddressType.home
                                            ? "Home"
                                            : x.selectedAddressType ==
                                                    AddressType.work
                                                ? "Work"
                                                : x.selectedAddressType ==
                                                        AddressType.another
                                                    ? "Another"
                                                    : "None",
                                        address: x.address,
                                        podyezd: context
                                            .read<MapProvider>()
                                            .podyezdcontroller
                                            .text,
                                        etaj: context
                                            .read<MapProvider>()
                                            .etajcontroller
                                            .text,
                                        house: context
                                            .read<MapProvider>()
                                            .housecontroller
                                            .text,
                                        orientir: context
                                            .read<MapProvider>()
                                            .orientrcontroller
                                            .text,
                                        lat: location.latitude,
                                        long: location.longitude,
                                        createdAt: DateTime.now().toString(),
                                      ),
                                    );
                                context.read<MapProvider>().tozalash();
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("Save Adress"));
                      },
                    ))
              ],
            ),
          ),
        ),
      );
    },
  );
  if (result == null) {
    if (context.mounted) {
      context.read<MapProvider>().updateKeyboard(false);
      context.read<MapProvider>().updateSelectedAddressType(AddressType.none);
      context.read<MapProvider>().tozalash();
    }
  }
}
