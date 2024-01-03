import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class SaveJobScreen extends ConsumerStatefulWidget {
  const SaveJobScreen({Key? key}) : super(key: null);

  static const String path = '/SaveJobScreen';

  @override
  ConsumerState<SaveJobScreen> createState() => _SaveJobScreenState();
}

class _SaveJobScreenState extends ConsumerState<SaveJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CameraAwesomeBuilder.awesome(
          sensorConfig: SensorConfig.multiple(
            sensors: [
              Sensor.position(SensorPosition.back),
              Sensor.position(SensorPosition.front),
            ],
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_4_3,
          ),
          saveConfig: SaveConfig.photoAndVideo(
            photoPathBuilder: (sensors) async {
              // 1.
              final Directory extDir = await getTemporaryDirectory();
              final testDir = await Directory('${extDir.path}/camerawesome')
                  .create(recursive: true);

              // 2.
              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                // 3.
                return SingleCaptureRequest(filePath, sensors.first);
              } else {
                // 4.
                return MultipleCaptureRequest(
                  {
                    for (final sensor in sensors)
                      sensor:
                          '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                  },
                );
              }
            },
            // Other params
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
          previewFit: CameraPreviewFit.fitWidth,
          middleContentBuilder: (state) {
            return Column(
              children: [
                const Spacer(),
                Builder(builder: (context) {
                  return Container(
                    color: AwesomeThemeProvider.of(context)
                        .theme
                        .bottomActionsBackgroundColor,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AwesomeCameraModeSelector(state: state),
                    ),
                  );
                }),
              ],
            );
          },
          bottomActionsBuilder: (state) => AwesomeBottomActions(
            state: state,
            left: null,
            right: AwesomeCameraSwitchButton(
              state: state,
              theme: AwesomeTheme(
                buttonTheme: AwesomeButtonTheme(
                  backgroundColor: Colors.white12,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30),
          ),
          topActionsBuilder: (state) {
            return AwesomeTopActions(
              state: state,
              children: [
                AwesomeFlashButton(state: state),
              ],
            );
          },
          theme: AwesomeTheme(
            bottomActionsBackgroundColor: Colors.black,
          ),
          previewPadding: const EdgeInsets.all(20),
          previewAlignment: Alignment.center,
        ),
      ),
    );
  }
}
