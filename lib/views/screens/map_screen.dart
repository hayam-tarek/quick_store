import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/listener_to_location.dart';
import 'package:quick_store/view_models/location_services_cubit/location_services_cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationServicesCubit, LocationServicesState>(
      listener: (context, state) {
        locationServicesListener(state, context);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Pick a Location')),
          body: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(30.033333, 31.233334), // Cairo coordinates
              initialZoom: 15,
              onTap: (tapPosition, point) {
                setState(() {
                  selectedLocation = point;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              if (selectedLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: selectedLocation!,
                      width: 80,
                      height: 80,
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          floatingActionButton: selectedLocation != null
              ? FloatingActionButton(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kSecondaryColor,
                  onPressed: () {
                    BlocProvider.of<LocationServicesCubit>(context)
                        .determineDetailsOfLatLng(latLng: selectedLocation!);
                  },
                  child: (state is DetermineDetailsOfLatLngLoading)
                      ? CupertinoActivityIndicator(
                          color: kSecondaryColor,
                        )
                      : Icon(Icons.save_alt),
                )
              : null,
        );
      },
    );
  }
}
