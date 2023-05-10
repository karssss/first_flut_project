import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/src/fa_icon.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime); //Tue, May 5, 2020
  }

  static getItem(FaIcon faIcon, int value, String units) {
    return Column(
      children: <Widget>[
        faIcon,
        const SizedBox(height: 10.0),
        Text(
          '$value',
          style: TextStyle(fontSize: 20.0, color: Colors.black87),
        ),
        const SizedBox(height: 10.0),
        Text('$units', style: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ],
    );
  }
}
