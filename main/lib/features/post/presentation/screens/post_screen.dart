import 'package:auto_route/auto_route.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/post/post_providers.dart';

@RoutePage()
class PostJobScreen extends ConsumerStatefulWidget {
  const PostJobScreen({Key? key}) : super(key: null);

  static const String path = 'PostJobScreen';

  @override
  ConsumerState<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends ConsumerState<PostJobScreen> {
  SensorDeviceData? sensorDeviceData;
  bool? isMultiCamSupported;

  @override
  void initState() {
    ref.read(postControllerProvider.notifier).douCamera();
    super.initState();

    CamerawesomePlugin.getSensors().then((value) {
      print("getSensors $value");
      setState(() {
        sensorDeviceData = value;
      });
    });

    CamerawesomePlugin.isMultiCamSupported().then((value) {
      print("isMultiCamSupported $value");

      setState(() {
        debugPrint("📸 isMultiCamSupported: $value");
        isMultiCamSupported = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: sensorDeviceData != null && isMultiCamSupported != null
            ? CameraAwesomeBuilder.awesome(
                sensorConfig: SensorConfig.multiple(
                  sensors: [
                    Sensor.position(SensorPosition.back),
                    Sensor.position(SensorPosition.front),
                  ],
                  flashMode: FlashMode.auto,
                  aspectRatio: CameraAspectRatios.ratio_4_3,
                ),
                // saveConfig: SaveConfig.photoAndVideo(),
                saveConfig: SaveConfig.photo(),
                pictureInPictureConfigBuilder: (index, sensor) {
                  final width = screenSize.width;
                  return PictureInPictureConfig(
                    isDraggable: true,
                    startingPosition: Offset(
                      screenSize.width - width - 20.0 * index,
                      screenSize.height - 356,
                    ),
                    sensor: sensor,
                    onTap: () {
                      print('on preview tap');
                    },
                    // 5.
                    pictureInPictureBuilder: (preview, aspectRatio) {
                      return SizedBox(
                        width: width,
                        height: width,
                        child: SizedBox(
                          width: width,
                          // 6.
                          child: preview,
                        ),
                      );
                    },
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
