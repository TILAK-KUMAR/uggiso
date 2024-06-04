import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';

class GetHotelListinMap extends StatefulWidget {
  final List<Payload>? payload;
  final String userId;

  GetHotelListinMap(this.payload,this.userId, {super.key});

  @override
  State<GetHotelListinMap> createState() => _GetHotelListinMapState();
}

class _GetHotelListinMapState extends State<GetHotelListinMap> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  double lat=0.0,lng=0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCurrentLocation();

  }
  @override
  Widget build(BuildContext context) {
    return  Container(height:MediaQuery.of(context).size.height*0.62,
      child: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition:  CameraPosition(
          target: LatLng(lat,lng),
          zoom: 10,
        ),
        markers: _markers,
      ),
    );
  }

  void _setMarkers() {
    if (widget.payload != null) {
      setState(() {
        _markers = widget.payload!.map((restaurant) {
          return Marker(
            markerId: MarkerId(restaurant.restaurantName!),
            position: LatLng(restaurant.lat!, restaurant.lng!),
            infoWindow: InfoWindow(
              title: restaurant.restaurantName!,
            ),
          );
        }).toSet();
      });
    }
  }

  getUserCurrentLocation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      lat = prefs.getDouble('user_latitude') ?? 0.0;
      lng = prefs.getDouble('user_longitude') ?? 0.0;

    });
    _setMarkers();

  }
}
