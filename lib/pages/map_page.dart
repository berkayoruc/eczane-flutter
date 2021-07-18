import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(
          color: Colors.grey[900],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 32,
              ),
              onPressed: () => print('22'))
        ],
      ),
      extendBody: true,
      body: Center(
        child: FlutterMap(
            options: MapOptions(
              center: LatLng(41, 29),
              zoom: 10.0,
            ),
            layers: [
              TileLayerOptions(
                  maxZoom: 24,
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(markers: [
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(40.9873, 29.1),
                  builder: (ctx) => Container(
                    child: Image.asset('assets/png/eczane-pin.png'),
                  ),
                ),
                Marker(
                  anchorPos: AnchorPos.align(AnchorAlign.top), //dogru
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(41, 29.1),
                  builder: (ctx) => Container(
                    child: Image.asset('assets/png/nobetci-pin.png'),
                  ),
                ),
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(41.1, 29),
                  builder: (ctx) => Container(
                    child: FlutterLogo(),
                  ),
                ),
              ])
            ]),
      ),
    );
  }
}
