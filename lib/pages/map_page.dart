import 'package:eczaneistanbul/core/services/pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> markers4map = [];

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
        child: FutureBuilder(
          future: getPharmacies(false),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Column(
                  children: [Text('Yukleniyor...')],
                );
              default:
                if (snapshot.hasError) {
                  return Text(snapshot.error);
                } else {
                  return createMap(snapshot.data);
                }
            }
          },
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  FlutterMap createMap(data) {
    markers4map.clear();
    data.forEach((pharmacy) {
      isNumeric(pharmacy.locx) && isNumeric(pharmacy.locy)
          ? markers4map.add(Marker(
              anchorPos: AnchorPos.align(AnchorAlign.top),
              width: 40,
              height: 40,
              point: LatLng(
                  double.parse(pharmacy.locx), double.parse(pharmacy.locy)),
              builder: (ctx) => Image.asset('assets/png/eczane-pin.png')))
          : print('s');
    });
    return FlutterMap(
        options: MapOptions(
          plugins: [
            MarkerClusterPlugin(),
          ],
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          maxZoom: 20,
          center:
              markers4map.isNotEmpty ? markers4map.first.point : LatLng(41, 28),
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
              maxZoom: 20,
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerClusterLayerOptions(
            maxClusterRadius: 120,
            size: Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            polygonOptions: PolygonOptions(
                borderColor: Colors.transparent,
                color: Colors.transparent,
                borderStrokeWidth: 3),
            markers: markers4map,
            builder: (context, markers) {
              return FloatingActionButton(
                backgroundColor: Colors.redAccent,
                onPressed: null,
                child: Text(markers.length.toString()),
              );
            },
          ),
          // MarkerLayerOptions(markers: markers4map)
        ]);
  }
}
