import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';

import 'HomeTab.dart';

class PlaceSearchScreen extends StatefulWidget {
  final PlaceCallback callback;


  const PlaceSearchScreen({
    required this.callback,
  });

  @override
  State<PlaceSearchScreen> createState() => _PlaceSearchScreenState();
}

class _PlaceSearchScreenState extends State<PlaceSearchScreen> {
  late GoogleMapController _mapController;
  LatLng _center = LatLng(37.7749, -122.4194); // Default location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBorderColor,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: IconButton(
              iconSize: 18,
              icon: Image.asset('assets/ic_back_arrow.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: AppColors.appPrimaryColor,
        elevation: 0,
        title: Text('Search NearBy Hotel',style: AppFonts.appBarText,),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedContainer(
              color: AppColors.white,
                borderColor: AppColors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                cornerRadius: 8,
                child: GooglePlaceAutoCompleteTextField(
                  textEditingController: TextEditingController(),
                  textStyle: AppFonts.title,
                  googleAPIKey: Strings.searchKey,
                  inputDecoration: InputDecoration(
                    hintText: 'Search for a place',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none // White border color
                    ),
                  ),
                  debounceTime: 800,
                  countries: ["in"],
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (prediction) {
                    print("placeDetails lat==>" + prediction.lat.toString());
                    print("placeDetails  lag==>" + prediction.lng.toString());
                    print("placeDetails  name==>" + prediction.description.toString());
                    widget.callback(prediction.lat as double, prediction.lng as double, prediction.description.toString());

                    // widget.callback(prediction.lat,prediction.lng,)
                    setState(() {
                      _center = LatLng(
                          prediction.lat as double, prediction.lng as double);
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
                )),
          ),
        ],
      ),
    );
  }
}
