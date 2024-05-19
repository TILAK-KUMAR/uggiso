import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/strings.dart';

class PlaceSearchScreen extends StatefulWidget {
  const PlaceSearchScreen({super.key});

  @override
  State<PlaceSearchScreen> createState() => _PlaceSearchScreenState();
}

class _PlaceSearchScreenState extends State<PlaceSearchScreen> {
  late GoogleMapController _mapController;
  LatLng _center = LatLng(37.7749, -122.4194); // Default location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        elevation: 0,
        title: Text('Search NearBy Hotel'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GooglePlaceAutoCompleteTextField(
              textEditingController: TextEditingController(),
              googleAPIKey: Strings.searchKey,
              inputDecoration: InputDecoration(
                hintText: 'Search for a place',
                border: OutlineInputBorder(),
              ),
              debounceTime: 800,
              countries: ["in"],
              isLatLngRequired: true,
              getPlaceDetailWithLatLng: (prediction) {
                print("placeDetails ==>"+prediction.lat.toString());
                setState(() {
                  _center = LatLng(prediction.lat as double, prediction.lng as double);
                  _mapController.animateCamera(CameraUpdate.newLatLng(_center));
                });
              },
              itemClick: (prediction) {
                print("Selected: " + prediction.lat.toString());
                print("Selected: " + prediction.lng.toString());
               /* setState(() {
                  _center = LatLng(prediction.lat as double, prediction.lng as double);
                  _mapController.animateCamera(CameraUpdate.newLatLng(_center));
                });*/
              },
            ),
          ),

        ],
      ),
    );
  }
}
