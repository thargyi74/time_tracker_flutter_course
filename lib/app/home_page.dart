import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  static const LatLng _center = const LatLng(16.871311, 96.199379);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  //LatLng _lastMapPosition = HomePage._center;
  LatLng _iconPosition = LatLng(16.871301, 96.199369);

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  int _groupValue = 0;
  int _radioValue2 = 0;
  int _radioValue3 = 0;
  int _radioValue4 = 0;
  int _radioValue5 = 0;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_iconPosition.toString()),
        position: _iconPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2019, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Smart Wast Collect'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              child: Text(
                'Search and pin location',
                style: TextStyle(
                    color: Colors.black, fontSize: 15, letterSpacing: 0.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                width: 450,
                height: 350,
                padding: EdgeInsets.all(8.0),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: HomePage._center,
                    zoom: 11.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    onPressed: _onAddMarkerButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.add_location, size: 32.0),
                  ),
                ),
              ),
            ],
          ),
          Text('Date & Time'),
          Row(
            children: <Widget>[
              RaisedButton.icon(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: Icon(Icons.date_range),
                  label: Text('Select Date')),
              SizedBox(
                width: 8.0,
              ),
              RaisedButton.icon(
                  onPressed: () {
                    _selectTime(context);
                  },
                  icon: Icon(Icons.access_time),
                  label: Text('Select Time')),
            ],
          ),
          Text('${selectedDate.toString()}'),
          SizedBox(
            height: 8.0,
          ),
          Text('Estimated total weight of wasts (Kg)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _groupValue,
                onChanged: (int e) => something(e),
                activeColor: Colors.green,
              ),
              Text('1 - 5'),
              Radio(
                value: 1,
                groupValue: _groupValue,
                onChanged: (int e) => something(e),
                activeColor: Colors.black,
              ),
              Text('5 - 10'),
              Radio(
                value: 2,
                groupValue: _groupValue,
                onChanged: (int e) => something(e),
                activeColor: Colors.red,
              ),
              Text('10 - 20'),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.photo),
                label: Text('Photo'),
              ),
              SizedBox(
                width: 8.0,
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.done_all),
                label: Text('Confirm'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  void something(int e) {
    setState(() {
      if (e == 0) {
        _groupValue = 0;
      } else if (e == 1) {
        _groupValue = 1;
      } else if (e == 2) {
        _groupValue = 2;
      }
    });
  }
}
