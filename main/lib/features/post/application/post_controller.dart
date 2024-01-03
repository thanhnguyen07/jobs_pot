import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camerawesome/camerawesome_plugin.dart';

class PostController extends StateNotifier<dynamic> {
  PostController(this._ref) : super(null);
  final Ref _ref;

  Future<void> douCamera() async {
    final isSupported = await CamerawesomePlugin.isMultiCamSupported();

    final sensorDeviceData = await CamerawesomePlugin.getSensors();

    print(sensorDeviceData);
  }
}
