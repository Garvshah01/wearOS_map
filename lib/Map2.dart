import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wear/wear.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen2 extends StatefulWidget {
  final String place;
  final String lat;
  final String lon;
  GoogleMapScreen2(
      {Key key, @required this.place, @required this.lat, @required this.lon})
      : super(key: key);
  @override
  _GoogleMapScreen2State createState() =>
      _GoogleMapScreen2State(this.place, this.lat, this.lon);
}

class _GoogleMapScreen2State extends State<GoogleMapScreen2> {
  Location location = new Location();
  GoogleMapController mapController;
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _currentPosition;
  GoogleMapController _controller;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);

  
  
  final String place;
  final String lat;
  final String lon;
  List<Marker> poiMarker = [];
  _GoogleMapScreen2State(this.place, this.lat, this.lon);
  @override
  void initState() {
    super.initState();
    check();
    poiMarker.add(Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(num.parse(lat), num.parse(lon)),
      infoWindow: InfoWindow(
          title: place,
          onTap: () {
            // print(_markers.toString());
          }),
    ));
  }

  void _onMapCreated(GoogleMapController _controller) {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
    _controller.setMapStyle(Utils.mapStyle);
    setState(() {});
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
    return Scaffold(
        body: WatchShape(
      builder: (context, shape, child) {
        return Container(
            child: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: Set.from(poiMarker),
          initialCameraPosition: _initialPositio,
          myLocationEnabled: true,
        ));
      },
      child: AmbientMode(
        builder: (context, mode, child) {
          return Text("Ambient Mode");
        },
      ),
    ));
  }
}

class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#9e9457"
      },
      {
        "lightness": -40
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]
  ''';
}
