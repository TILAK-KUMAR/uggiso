import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';

import '../../../app_routes.dart';
import 'MenuListArgs.dart';

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
          target: LatLng(12.9913243,77.7301459),
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
          print('this is restaurant lat lng : ${restaurant.lat} and ${restaurant.lng}');
          return Marker(
            markerId: MarkerId(restaurant.restaurantName!),
            position: LatLng(restaurant.lat!, restaurant.lng!),

            infoWindow: InfoWindow(
              title: restaurant.restaurantName!,
              onTap: ()=>
                Navigator.pushNamed(context, AppRoutes.menuList,
                    arguments: MenuListArgs(
                        restaurantId: restaurant.restaurantId,
                        name: restaurant.restaurantName,
                        foodType: restaurant.restaurantMenuType,
                        ratings: restaurant.ratings,
                        landmark: restaurant.landmark,
                        distance: restaurant.distance,
                        duration: restaurant.duration,
                        payload: restaurant))
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
