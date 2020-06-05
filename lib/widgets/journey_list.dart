import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/journey.dart';

class JourneyList extends StatelessWidget {
  final List<Journey> journeys;
  final Function deleteJny;

  JourneyList(this.journeys, this.deleteJny);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      child: journeys.isEmpty 
      ? Column(
          children: <Widget>[
            Text(
              'No current journey yet!',
              style: TextStyle(
                fontFamily: 'GentiumBookBasic',
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 400,
              child: Image.asset(
                'assets/images/waiting.png', 
                fit: BoxFit.cover,
                color: Colors.teal[300],
              )
            )
          ],
        )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(
                    vertical: 20, 
                    horizontal: 1
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.location_on, 
                        size: 30, 
                        color: Theme.of(context).textTheme.button.color,
                      ),
                    ),
                    title: Text(
                      '${journeys[index].from} - ${journeys[index].to}', 
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                      
                    
                    subtitle: Row(
                      children: <Widget>[
                        Icon(
                          Icons.date_range,
                          size: 16,
                        ),
                        Text(
                          DateFormat.yMMMEd().format(journeys[index].date),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete), 
                      onPressed: () => deleteJny(journeys[index].id) 
                    ),
                  ),
                );
              },
        itemCount: journeys.length,
      ),
    );
  }
}