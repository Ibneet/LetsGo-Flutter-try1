import 'package:flutter/material.dart';

class NewJourney extends StatefulWidget {
  final Function addj;

  NewJourney(this.addj);

  @override
  _NewJourneyState createState() => _NewJourneyState();
}

class _NewJourneyState extends State<NewJourney> {
  final fromController = TextEditingController();

  final toController = TextEditingController();

  void addedJourney(){
    final enteredFrom = fromController.text;
    final enteredTo = toController.text;

    if(enteredFrom.isEmpty || enteredTo.isEmpty){
      return;
    }

    widget.addj(
      fromController.text, 
      toController.text
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'From'),
              controller: fromController,
              onSubmitted:(val) => addedJourney(),
              // onChanged: (val) => fromInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'To'),
              controller: toController,
              onSubmitted:(_) => addedJourney(),
              // onChanged: (val) => toInput = val,
            ),
            FlatButton(
              child: Text('Add Journey'),
              textColor: Colors.blue,
              onPressed: addedJourney
            ),
          ],
        ),
      ),
    );
  }
}