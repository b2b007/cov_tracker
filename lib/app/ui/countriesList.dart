import 'package:cov_tracker/app/models/countryModel.dart';
import 'package:cov_tracker/app/ui/countryDataPage.dart';
import 'package:cov_tracker/data/allCountries.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  List<CountryModel> countries = <CountryModel>[];
  List<CountryModel> countriesToDisplay = <CountryModel>[];

  @override
  void initState() {
    super.initState();
    countries = allCountries.map((map) => CountryModel.fromJson(map)).toList();
    countriesToDisplay = countries;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: searchArea(),
        ),
        SizedBox(height: 4),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemCount: countriesToDisplay.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryDataPage(countriesToDisplay[index]),
                      ),
                    );
                  },
                  leading: Image.network("https://flagcdn.com/32x24/" +
                      countriesToDisplay[index]
                          .countryCode
                          .toString()
                          .toLowerCase() +
                      ".png"),
                  title: Text(countriesToDisplay[index].country.toString()),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget searchArea() {
    return TextField(
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 16,
      ),
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.grey.shade900,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        hintText: "Search Here...",
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (value) {
        value = value.toLowerCase();
        setState(() {
          countriesToDisplay = countries.where((element) {
            var noteTitle = element.country.toString().toLowerCase();
            return noteTitle.startsWith(value);
          }).toList();
        });
      },
    );
  }
}
