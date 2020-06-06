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
      ? SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'No current journey yet!',
                style: TextStyle(
                  fontFamily: 'GentiumBookBasic',
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/16,
              ),
              Container(
                height: MediaQuery.of(context).size.height/1.5,
                child: Image.asset(
                  'assets/images/waiting.png', 
                  fit: BoxFit.cover,
                  color: Colors.teal[300],
                )
              )
            ],
          ),
        )
      : LayoutBuilder(builder: (ctx, constraints){
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 20,
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: ListTile(
                  leading: Container(
                    width: constraints.maxWidth*0.15,
                    child: CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.location_on, 
                        size: 25, 
                        color: Theme.of(context).textTheme.button.color,
                      ),
                    ),
                  ),
                  title: Container(
                    width: constraints.maxWidth*0.75,
                    child: Text(
                      '${journeys[index].from} - ${journeys[index].to}', 
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                    
                  subtitle: Container(
                    width: constraints.maxWidth*0.75,
                    child: Row(
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
                  ),
                  trailing: Container(
                    width: constraints.maxWidth*0.10,
                    child: IconButton(
                      icon: Icon(Icons.delete), 
                      onPressed: () => deleteJny(journeys[index].id) 
                    ),
                  ),
                ),
              );
            },
            itemCount: journeys.length
          );
          }
        ),
        
    );
  }
}