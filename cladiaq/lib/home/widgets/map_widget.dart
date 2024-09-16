import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(color: Colors.blue[100]),
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(12.2472, 7.3442),
          initialZoom: 20,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(51.5, -0.09),
                child: Icon(Icons.location_on, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
