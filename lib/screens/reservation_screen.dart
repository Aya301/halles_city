import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:halles_city/UI_componants/hall_properties.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  String value;
  bool isSatrtingValid = false;
  bool isEndValid = false;
  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // creating an app bar
        appBar: AppBar(
          //setting a color for the app bar
          backgroundColor: main_light_color,
          // creating back button at leading
          leading: IconButton(
            // back_icon is aconstant value
            icon: back_icon,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // adding the logo to the flexible space of abb par
          flexibleSpace: Padding(
            padding: all_sides_padding,
            //adding the logo inside app bar flexibleSpace with 8 padding
            child: Image(
              image: darkLogo, // calling logo image from constants file
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton(
                  value: value,
                  hint: Text('Choose a day'),
                  isExpanded: true,
                  onChanged: (NewValue) {
                    print(value);
                    this.value = NewValue;
                  },
                  items: <DropdownMenuItem>[
                    DropdownMenuItem(
                      child: Text('sat'),
                    ),
                    DropdownMenuItem(
                      child: Text('sat'),
                    ),
                    DropdownMenuItem(
                      child: Text('sat'),
                    ),
                    DropdownMenuItem(
                      child: Text('sat'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Reservation Name',
                      icon: Icon(Icons.perm_identity)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DateTimeField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hoverColor: Colors.cyan,
                    labelText: 'Starting Date',
                    prefixText: 'From: ',
                    alignLabelWithHint: true,
                    errorText: isSatrtingValid ? 'hjgjhjg' : null,
                    icon: Icon(
                      Icons.calendar_today,
                    ),
                  ),
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      print('done');
                      setState(() {
                        isSatrtingValid = true;
                      });
                      return DateTimeField.combine(date, time);
                    } else {
                      print(currentValue);
                      return currentValue;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DateTimeField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hoverColor: Colors.cyan,
                    labelText: 'End Date',
                    prefixText: 'To: ',
                    alignLabelWithHint: true,
                    errorText: isEndValid ? 'hjgjhjg' : null,
                    icon: Icon(
                      Icons.calendar_today,
                    ),
                  ),
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      print('done');
                      setState(() {});

                      return DateTimeField.combine(date, time);
                    } else {
                      print(currentValue);
                      return currentValue;
                    }
                  },
                ),
              ),
              HallProperties.customButton(
                  context: this.context,
                  text: ' Summit Reservation ',
                  onclick: () {})
            ],
          ),
        ),
      ),
    );
  }
}
