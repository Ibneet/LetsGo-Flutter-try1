import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/new_journey.dart';
import './widgets/journey_list.dart';
import './models/journey.dart';

void main(){ 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'letsGo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'GentiumBookBasic',
        textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 28
            )
          ),
        )
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
  final List<Journey> _userJourneys = [];

  void _addNewJourney(String jFrom, String jTo, DateTime jDate){
    final newj = Journey(
      id: DateTime.now().toString(),
      from: jFrom,
      to: jTo,
      date: jDate
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

  void _deleteJourney(String id){
    setState(() {
      _userJourneys.removeWhere((j) => j.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'letsGO',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewJourney(context), 
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal:5),
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                JourneyList(_userJourneys, _deleteJourney),
              ]),
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewJourney(context), 
      ),
    );
  }
}