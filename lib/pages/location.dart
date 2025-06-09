import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/actionmenu.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String location = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        centerTitle: true,
        leading: Container(),
        actions: actionMenu(context),
      ),
      body: Column(
        children: [
          Center(child: ElevatedButton(onPressed: () async {
            await getLocation();
          }, child: Text('Get Location')))
        ],
      )
    );
  }

  Future<void> getLocation() async {
    // Check permissions
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          location = 'Location permissions are denied';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        location = 'Location permissions are permanently denied.';
      });
      return;
    }


    // Get current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      location = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
    });

    print(location);

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String address = '''
          ${place.name}, ${place.street},
          ${place.locality}, ${place.administrativeArea},
          ${place.country} - ${place.postalCode}
          ''';

      print(address);
    }

    return;
  }
}
