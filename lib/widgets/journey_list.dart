import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/journey.dart';

class JourneyList extends StatelessWidget {
  final List<Journey> journeys;

  JourneyList(this.journeys);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            margin: EdgeInsets.only(bottom: 50),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      journeys[index].from, 
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      journeys[index].to,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      size: 18,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(journeys[index].date),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            )
          );
        },
        itemCount: journeys.length,
      ),
    );
  }
}