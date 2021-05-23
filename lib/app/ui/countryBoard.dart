import 'package:cov_tracker/app/models/countryDataModel.dart';
import 'package:cov_tracker/app/services/api.dart';
import 'package:cov_tracker/app/services/api_service.dart';
import 'package:flutter/material.dart';

class CountryBoard extends StatelessWidget {
  final countryName;
  CountryBoard({@required this.countryName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryDataModel>>(
      future: APIService(API.sandbox()).getByCountry(countryName),
      builder: (context, AsyncSnapshot<List<CountryDataModel>> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                tile('confirmed', snapshot.data![0].confirmed.toString()),
                tile('recovered', snapshot.data![0].recovered.toString()),
                tile('critical', snapshot.data![0].critical.toString()),
                tile('deaths', snapshot.data![0].deaths.toString()),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget tile(String title, String value) {
    Color background = Colors.black;
    switch (title) {
      case 'confirmed':
        background = Colors.lime.shade900;
        break;
      case 'recovered':
        background = Colors.green.shade900;
        break;
      case 'critical':
        background = Colors.pink.shade900;
        break;
      case 'deaths':
        background = Colors.red.shade900;
        break;
      default:
        background = Colors.black;
    }

    return Card(
      color: background,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
