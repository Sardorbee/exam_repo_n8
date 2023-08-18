import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exam_repo_n8/services/data/models/countries/country_model/countries_model.dart';

class CountryService {
  final Dio _dio = Dio();

  Future<List<CountriesModel>> fetchCountriesData() async {
    try {
      final response = await _dio.get('https://restcountries.com/v3.1/all');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
          
        final List<CountriesModel> countries =
            data.map((item) => CountriesModel.fromJson(item)).toList();
        print(countries);
        return countries;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
