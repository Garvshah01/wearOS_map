import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wear/wear.dart';

class CLocation extends StatefulWidget {
  @override
  _CLocation createState() => _CLocation();
}

class _CLocation extends State<CLocation> {
  Location location = new Location();
  GoogleMapController mapController;
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _currentPosition;
  GoogleMapController _controller;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  initState() {
    super.initState();
    check();
  }

  check() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
      _currentPosition = await location.getLocation();
      _initialcameraposition =
          LatLng(_currentPosition.latitude, _currentPosition.longitude);
      location.onLocationChanged.listen((LocationData currentLocation) {
        print("${currentLocation.longitude} : ${currentLocation.longitude}");
        setState(() {
          _currentPosition = currentLocation;
          _initialcameraposition =
              LatLng(_currentPosition.latitude, _currentPosition.longitude);
        });
      });
    }
  }

  final CameraPosition _initialPositio = CameraPosition(
    target: LatLng(28.630577, 77.372170),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WatchShape(builder: (context, shape, child) {
      return Container(
          child: GoogleMap(
        initialCameraPosition: _initialPositio,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
      ));
    }));
  }
}
