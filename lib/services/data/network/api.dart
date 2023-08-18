import 'package:dio/dio.dart';
import 'package:exam_repo_n8/services/data/models/geocoding/geocoding.dart';

import 'package:exam_repo_n8/services/data/models/universal_data.dart';
import 'package:exam_repo_n8/ui/utils/constants/constants.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiService {
  // DIO SETTINGS

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": apiKey,
      },
      connectTimeout: const Duration(seconds: 25),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 15),
    ),
  );
  Future<UniversalData> getAddress({
    required LatLng latLng,
    required String kind,
    
  }) async {
    Response response;
    try {
      response = await dio.get(
        '/1.x/',
        queryParameters: {
          "apikey": apiKey,
          "geocode": "${latLng.longitude}, ${latLng.latitude}",
          "lang": "uz_UZ",
          "format": "json",
          "kind": kind,
          "rspn": "1",
          "results": "1",
        },
      );

      if (response.statusCode == 200) {
        String text = 'Aniqlanmagan Hudud';
        Geocoding geocoding = Geocoding.fromJson(response.data);
        if (geocoding.response.geoObjectCollection.featureMember.isNotEmpty) {
          text = geocoding.response.geoObjectCollection.featureMember[0]
              .geoObject.metaDataProperty.geocoderMetaData.text;
        }
        return UniversalData(data: text);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
