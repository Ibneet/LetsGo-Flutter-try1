import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewJourney extends StatefulWidget {
  final Function addj;

  NewJourney(this.addj);

  @override
  _NewJourneyState createState() => _NewJourneyState();
}

class _NewJourneyState extends State<NewJourney> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  DateTime _selectedDate;

  void _addedJourney(){
    final enteredFrom = _fromController.text;
    final enteredTo = _toController.text;

    if(enteredFrom.isEmpty || enteredTo.isEmpty || _selectedDate==null){
      return;
    }

    widget.addj(
      _fromController.text, 
      _toController.text,
      _selectedDate
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now(), 
      lastDate: DateTime.now().add(Duration(days: 50))
    ).then((pickedDate) {
      if(pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'From'),
                controller: _fromController,
                onSubmitted:(val) => _addedJourney(),
                // onChanged: (val) => fromInput = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'To'),
                controller: _toController,
                onSubmitted:(_) => _addedJourney(),
                // onChanged: (val) => toInput = val,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(_selectedDate == null 
                    ? 'No date chosen!' 
                    : 'Date: ${DateFormat.yMMMEd().format(_selectedDate)}', 
                    style: TextStyle(
                      fontSize: 18),
                    ),
                 FlatButton(
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('Choose date.', 
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ]),
              ),
              RaisedButton(
                child: Text('Add Journey', 
                  style: TextStyle(fontSize: 20),
                ),
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _addedJourney
              ),
            ],
          ),
        ),
      ),
    );
  }
}