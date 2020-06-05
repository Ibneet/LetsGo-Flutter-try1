import 'package:flutter/foundation.dart';

class Journey{
  final String id;
  final String from;
  final String to;
  final DateTime date;

  Journey({
    @required this.id,
    @required this.from, 
    @required this.to, 
    @required this.date
  });
}