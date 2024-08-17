import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_polyline/google_maps_polyline.dart';
import 'package:google_search_place/google_search_place.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import 'package:uggiso/base/common/utils/fonts.dart';
import 'package:uggiso/base/common/utils/strings.dart';
import 'package:google_search_place/model/prediction.dart';


class GetRouteMap extends StatefulWidget {
  const GetRouteMap({super.key});

  @override
  State<GetRouteMap> createState() => _GetRouteMapState();
}

class _GetRouteMapState extends State<GetRouteMap> {
  late GoogleMapController mapController;
  TextEditingController departureController = new TextEditingController();
  TextEditingController arrivalController = new TextEditingController();
  TextEditingController _placeSearchEditingController = TextEditingController();
  bool _showPlaceSearchWidget = false;
  String currentLocation = 'Current Location';
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  List<Marker> markersList = [];
  GoogleMapsPolyline googleMapPolyline =  GoogleMapsPolyline();
  final List<Polyline> polyline = [];
  List<LatLng> routeCoords = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        title: Text('By Route',style: TextStyle(color: AppColors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          HomeHeaderContainer(),
      Expanded(
        child: Container(height:MediaQuery.of(context).size.height*0.62,
          child: GoogleMap(
            onMapCreated: (controller) {
              _controller = controller;
            },

            initialCameraPosition:  CameraPosition(
              target: LatLng(12.9913243,77.7301459),
              zoom: 10,
            ),
            markers: _markers,
            polylines: Set.from(polyline),
          ),
        ),
      )
        ],
      ),

    );
  }

  Widget HomeHeaderContainer() =>
      Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.16,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: const BoxDecoration(
          color: AppColors.appPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              children: [
              const Gap(12),
          _showPlaceSearchWidget
              ? PlaceSearchWidget()
              : RoundedContainer(
              color: AppColors.white,
              borderColor: AppColors.white,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,
              cornerRadius: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      '$currentLocation',
                      style: AppFonts.title,

                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _showPlaceSearchWidget = true;
                      });
                    },
                    child: Text(
                      'Change',
                      style: AppFonts.smallText
                          .copyWith(color: AppColors.appPrimaryColor),
                    ),
                  ),
                ],
              )),
          Gap(8),
          PlaceSearchWidget()

          ],
        ),
      )

  ,

  );

  Widget PlaceSearchWidget() =>
      RoundedContainer(
        color: AppColors.white,
        borderColor: AppColors.white,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.05,
        cornerRadius: 8,
        padding: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: SearchPlaceAutoCompletedTextField(
                  googleAPIKey: Strings.searchKey,
                  textStyle: AppFonts.title,
                  countries: ['in'],
                  isLatLngRequired: true,
                  inputDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // No border
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  controller: _placeSearchEditingController,
                  itmOnTap: (Prediction prediction) {
                    setState(() {
                      _placeSearchEditingController.text =
                      prediction.description!;
                      currentLocation = _placeSearchEditingController.text;
                      _showPlaceSearchWidget = false;
                    });

                    _placeSearchEditingController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: prediction.description?.length ?? 0));
                  },
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    _placeSearchEditingController.text =
                        prediction.description ?? "";

                    _placeSearchEditingController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: prediction.description?.length ?? 0));

                    // Get search place latitude and longitude
                    debugPrint("====>${prediction.lat} ${prediction.lng}");

                    // getNearByRestaurants(userId,double.parse(prediction.lat.toString()), double.parse(prediction.lng.toString()), selectedDistance,selectedMode);
                    // Get place Detail
                    debugPrint("Place Detail : ${prediction.placeDetails}");
                  }),
            ),
            Flexible(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 22,
                    color: AppColors.textGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPlaceSearchWidget = false;
                      _placeSearchEditingController.clear();
                    });
                  },
                ))
          ],
        ),
      );

  // Future<Null> displayPrediction(Prediction p) async {
  //   if (p != null) {
  //     // get detail (lat/lng)
  //     PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(
  //         p.placeId);
  //     final lat = detail.result.geometry.location.lat;
  //     final lng = detail.result.geometry.location.lng;
  //
  //     setState(() {
  //       placeController.text = detail.result.name;
  //       Marker marker = Marker(
  //           markerId: MarkerId('arrivalMarker'),
  //           draggable: false,
  //           infoWindow: InfoWindow(
  //             title: "This is where you searched",
  //           ),
  //           position: LatLng(lat, lng)
  //       );
  //       markersList.add(marker);
  //     });
  //   }

    // computePath()async{
    //   LatLng origin = new LatLng(departure.geometry.location.lat, departure.geometry.location.lng);
    //   LatLng end = new LatLng(arrival.geometry.location.lat, arrival.geometry.location.lng);
    //   routeCoords.addAll(await googleMapPolyline.getCoordinatesWithLocation(origin: origin, destination: end, mode: RouteMode.driving));
    //
    //   setState(() {
    //     polyline.add(Polyline(
    //         polylineId: PolylineId('iter'),
    //         visible: true,
    //         points: routeCoords,
    //         width: 4,
    //         color: Colors.blue,
    //         startCap: Cap.roundCap,
    //         endCap: Cap.buttCap
    //     ));
    //   });
    // }
}
