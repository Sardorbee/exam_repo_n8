import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_repo_n8/services/data/models/countries/country_model/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.countriesModel});
  CountriesModel countriesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text("Country Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: countriesModel.flags.png),
            SizedBox(
              height: 5.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  countriesModel.name!.common,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  "Population: ${countriesModel.population.toString()}",
                ),
                Text(
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  "Capital: ${countriesModel.capital?.first ?? ''}",
                ),
                Text(
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  " ${countriesModel.continents}",
                ),
                Text(
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  "${countriesModel.status}",
                ),
                Text(
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  " ${countriesModel.timezones}",
                ),
                Text(
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  " ${countriesModel.capital?.first ?? ''}",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
