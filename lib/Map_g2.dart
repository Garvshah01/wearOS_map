import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  //Completer<GoogleMapController> _controller = Completer();
  //Map<MarkerId, Marker> marker = <MarkerId, Marker>{};
  List<Marker> marker = [];
  @override
  void initState() {
    initilize();
    super.initState();
  }

  initilize() {
    Marker marker1 = Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(28.629467450222382, 77.37286286798305),
      infoWindow: InfoWindow(
        title: "Annapurna",
        onTap: () {
          //print(_markers.toString());
        },
        snippet: "College Mess :)",
      ),
    );
    Marker marker2 = Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(28.631260224216607, 77.37092329568665),
      infoWindow: InfoWindow(
          title: "Gate-1",
          onTap: () {
            // print(_markers.toString());
          }),
    );
    Marker marker3 = Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(28.629449917631206, 77.37320958750782),
      infoWindow: InfoWindow(
        title: "A2Z",
        snippet: "A2Z",
      ),
    );
    Marker marker4 = Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(28.629000435847097, 77.374096586435),
      infoWindow: InfoWindow(
        title: "Gate-3",
      ),
    );
    Marker marker5 = Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(28.631221676774143, 77.37231399144166),
      infoWindow: InfoWindow(
        title: "Gate-2",
      ),
    );
    Marker marker6 = Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(28.631260224216607, 77.37092329568665),
      infoWindow: InfoWindow(
        title: "Gate-1",
      ),
    );
    marker.add(marker1);
    marker.add(marker2);
    marker.add(marker3);
    marker.add(marker4);
    marker.add(marker5);
    marker.add(marker6);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WatchShape(
      builder: (context, shape, child) {
        return Container(
            child: GoogleMap(
          mapType: MapType.normal,
          compassEnabled: true,
          cameraTargetBounds: CameraTargetBounds.unbounded,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          myLocationButtonEnabled: true,
          markers: marker.map((e) => e).toSet(),
          initialCameraPosition:
              CameraPosition(target: LatLng(28.630577, 77.372170), zoom: 16),
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



/*

*/

/*
      _markers.add(
       
      _markers.add(
          
      );
      _markers.add(
         
      );
      _markers.add(
          
      );*/