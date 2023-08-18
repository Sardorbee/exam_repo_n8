import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_repo_n8/services/data/models/countries/country_model/countries_model.dart';
import 'package:exam_repo_n8/services/data/network/countries.dart';
import 'package:exam_repo_n8/ui/country_screen/detail_page.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country Screen"),
      ),
      body: FutureBuilder<List<CountriesModel>>(
        future: CountryService().fetchCountriesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available.'));
          } else {
            final List<CountriesModel> countries = snapshot.data!;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Details(countriesModel: country),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      color: Colors.teal,
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      child: Column(
                        children: [
                          CachedNetworkImage(imageUrl: country.flags.png),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                country.name!.common,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                "Population: ${country.population.toString()}",
                              ),
                              Text(
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                "Capital: ${country.capital?.first ?? ''}",
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
