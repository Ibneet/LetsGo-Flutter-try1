import 'package:flutter/material.dart';
import 'package:frontend/widgets/journey_list.dart';

import './widgets/new_journey.dart';
import './widgets/journey_list.dart';
import './models/journey.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'letsGo',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Journey> _userJourneys = [
    Journey(
      from: 'Patiala', 
      to: 'Jalandhar', 
      date: DateTime.parse('2020-06-06')
    ),
    Journey(
      from: 'Chandigarh', 
      to: 'Manali', 
      date: DateTime.parse('2020-05-08')
    ),
  ];

  void _addNewJourney(String jFrom, String jTo){
    final newj = Journey(
      from: jFrom,
      to: jTo,
      date: DateTime.parse('2020-06-08')
    );

    setState(() {
      _userJourneys.add(newj);
    });
  }

  void _startAddNewJourney(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (_){
      return GestureDetector(
        onTap: (){},
        child: NewJourney(_addNewJourney),
        behavior: HitTestBehavior.opaque,
      ); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('letsGO'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewJourney(context), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal:30),
          padding: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              JourneyList(_userJourneys),
            ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewJourney(context), 
      ),
    );
  }
}