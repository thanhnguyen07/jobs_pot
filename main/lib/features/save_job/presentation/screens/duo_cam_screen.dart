import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart';

@RoutePage()
class DuoCamScreen extends ConsumerStatefulWidget {
  const DuoCamScreen({Key? key}) : super(key: null);

  static const String path = '/DuoCamScreen';

  @override
  ConsumerState<DuoCamScreen> createState() => _DuoCamScreenState();
}

class _DuoCamScreenState extends ConsumerState<DuoCamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: CameraAwesomeBuilder.awesome(
          nextCamScreen: () {
            // context.router.removeLast();
            // context.router.navigateNamed(SaveJobScreen.path);
          },
          sensorConfig: SensorConfig.multiple(
            sensors: [
              Sensor.position(SensorPosition.back),
              Sensor.position(SensorPosition.front),
            ],
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_4_3,
          ),
          saveConfig: SaveConfig.custom(
            initialCaptureMode: CaptureMode.duo,
          ),
          pictureInPictureConfigBuilder: (index, sensor) {
            return PictureInPictureConfig(
              isDraggable: true,
              startingPosition: const Offset(
                20,
                150,
              ),
              onTap: () {
                debugPrint('on preview tap');
              },
              sensor: sensor,
              pictureInPictureBuilder: (preview, aspectRatio) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: preview,
                );
              },
            );
          },
          onMediaTap: (mediaCapture) {
            mediaCapture.captureRequest.when(
              single: (single) => {},
              multiple: (multiple) => Navigator.of(context).pushNamed(
                '/gallery',
                arguments: multiple,
              ),
            );
          },
        ),
      ),
    );
  }
}
