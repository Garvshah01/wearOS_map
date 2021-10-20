import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapScreen extends StatefulWidget{
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen>{
  // Set<Marker> _markers = {};
  // void _onMapCreated(GoogleMapController controller){
  //   setState(() {
  //     _markers.add(
  //         Marker(markerId: MarkerId('id-1'),position: LatLng(28.630577,77.372170))
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: WatchShape(builder: (context,shape,child){
          return Container(child:
      GoogleMap(
        //onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            target: LatLng(28.630577,77.372170),
            zoom: 10
        ),
      )

      );
    },
    child: AmbientMode(builder: (context,mode,child){
     return Text("Ambient Mode");
     },),));
  }
}