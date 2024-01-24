import 'package:connect_app/app/modules/location/domain/provider/controller/location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationProvider = ChangeNotifierProvider((ref) => LocationController());
