import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Map2.dart';
import 'package:wear/wear.dart';

class PoiList extends StatefulWidget {
  @override
  _PoiListState createState() => _PoiListState();
}

class _PoiListState extends State<PoiList> {
  List<String> places = ["Annapurna", "A2Z", "Gate-3", "Gate-1"];
  List<String> lati = [
    "28.629467450222382",
    "28.629449917631206",
    "28.629000435847097",
    "28.631260224216607"
  ];
  List<String> long = [
    "77.37286286798305",
    "77.37320958750782",
    "77.374096586435",
    "77.37092329568665"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WatchShape(builder: (context, shape, child) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: places.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(places[index]),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GoogleMapScreen2(
                            place: places[index],
                            lat: lati[index],
                            lon: long[index]))),
              );
            }),
      );
    }));
  }
}
