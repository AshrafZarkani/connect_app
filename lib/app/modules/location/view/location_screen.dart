import 'package:connect_app/app/modules/chats/domain/repo/chats_repo.dart';
import 'package:connect_app/app/modules/location/domain/provider/location_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  LatLng initialPosition = const LatLng(29.311661, 47.481766);
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    ref.read(locationProvider).checkLocationPermission();
  }

  final chatRepo = ChatsRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: FutureBuilder(
          future: chatRepo.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialPosition,
                zoom: 2,
              ),
              markers: snapshot.data!
                  .map(
                    (user) => Marker(
                      markerId: MarkerId(user.id),
                      position: LatLng(
                        user.latitude ?? 0,
                        user.longitude ?? 0,
                      ),
                    ),
                  )
                  .toSet(),
              onMapCreated: (controller) => mapController = controller,
            );
          }),
    );
  }
}
