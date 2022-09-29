import 'dart:async';

import 'package:firebase_project/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_project/constants.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();
  //Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  static const LatLng sourceLocation = LatLng(55.7565991,37.6421417);
  static const LatLng destination = LatLng(55.7593107,37.7045845);
  //LocationData? currentLocation ;//= LocationData(Location.instance.getLocation()); //= LocationData (LatLng(37.33500926, -122.03272188));
  static const LatLng currentLocation = LatLng(55.7593107,37.7045845);
  List<LatLng> polylineCoordinates = [];
  //LocationData? currentLocation ;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async{
    Location location = Location();

    location.getLocation().then(
            (location){
          //currentLocation = location;
        }
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen(
            (newLoc) {
          //currentLocation = newLoc;

          googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                  CameraPosition(
                      zoom: 13.5,
                      target: LatLng(
                          newLoc.latitude!,
                          newLoc.longitude!
                      ))
              )
          );

          setState(() {});
        }
    );
  }

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude)
    );
    if(result.points.isNotEmpty){
      result.points.forEach(
              (PointLatLng point) => polylineCoordinates.add(
              LatLng(point.longitude, point.longitude)
          )
      );
      setState(() {});
    }
  }

  void setCustomIcon(){
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/Pin_source.png")
        .then((icon) => sourceIcon = icon);

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/car.png")
        .then((icon) => destinationIcon = icon);
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/car.png")
        .then((icon) => currentLocationIcon = icon);
  }

  @override
  void initState(){
    setCustomIcon();
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Отслеживание заказа",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: //currentLocation == null?
      //const Center(child: Text("Loading")):
      GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(destination!.latitude!,
                destination!.longitude!),
            zoom: 13.5
        ),
        polylines: {
          Polyline(
              polylineId: PolylineId("route"),
              points: polylineCoordinates,
              color: const Color(0xFF7B61FF),
              width: 6
          )
        },
        markers: {
          Marker(
              markerId: const MarkerId("currentLocation"),
              icon: currentLocationIcon,
              position: LatLng(currentLocation!.latitude!,
                  currentLocation!.longitude!)
          ),
          Marker(
              markerId: const MarkerId("source"),
              icon: sourceIcon,
              position: sourceLocation
          ),
          Marker(
              markerId: const MarkerId("destination"),
              icon: destinationIcon,
              position: destination
          )
        },
        onMapCreated: (mapController){
          _controller.complete(mapController);
        },
      ),
    );
  }
}
