import 'package:cov_tracker/app/models/countryModel.dart';
import 'package:cov_tracker/app/ui/countryBoard.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class CountryDataPage extends StatelessWidget {
  final CountryModel country;
  CountryDataPage(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Image.network(
            "https://flagcdn.com/32x24/" +
                country.countryCode.toString().toLowerCase() +
                ".png",
          ),
        ],
        title: Text(
          country.country.toString().toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CountryBoard(countryName: country.country),
            Expanded(
              child: SfMaps(
                layers: [
                  MapShapeLayer(
                    source: MapShapeSource.asset(
                      "assets/world_map.json",
                      shapeDataField: "name",
                      dataCount: 1,
                      primaryValueMapper: (index) => country.country,
                      shapeColorValueMapper: (index) => Colors.green,
                    ),
                    showDataLabels: false,
                    tooltipSettings: MapTooltipSettings(
                      color: Colors.grey[700],
                      strokeColor: Colors.white,
                      strokeWidth: 2,
                    ),
                    strokeColor: Colors.white,
                    strokeWidth: 0.5,
                    shapeTooltipBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          country.country,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
