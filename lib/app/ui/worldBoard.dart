import 'package:cov_tracker/app/models/worldBoardModel.dart';
import 'package:cov_tracker/app/services/api.dart';
import 'package:cov_tracker/app/services/api_service.dart';
import 'package:flutter/material.dart';

class WorldBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WorldBoardModel>>(
      future: APIService(API.sandbox()).getTotals(),
      builder: (context, AsyncSnapshot<List<WorldBoardModel>> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    tile('confirmed', snapshot.data![0].confirmed.toString()),
                    tile('recovered', snapshot.data![0].recovered.toString()),
                  ],
                ),
                Row(
                  children: [
                    tile('critical', snapshot.data![0].critical.toString()),
                    tile('deaths', snapshot.data![0].deaths.toString()),
                  ],
                ),
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

    return Expanded(
      child: Card(
        color: background,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Container(
          height: 50,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
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
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
