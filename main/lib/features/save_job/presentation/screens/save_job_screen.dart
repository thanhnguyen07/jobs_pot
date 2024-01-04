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
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.custom(
            photoPathBuilder: (sensors) async {
              // 1.
              final Directory extDir = await getTemporaryDirectory();
              final testDir = await Directory('${extDir.path}/camerawesome')
                  .create(recursive: true);
              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                return SingleCaptureRequest(filePath, sensors.first);
              } else {
                return MultipleCaptureRequest(
                  {
                    for (final sensor in sensors)
                      sensor:
                          '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                  },
                );
              }
            },
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
          previewFit: CameraPreviewFit.cover,
          middleContentBuilder: (state) {
            return Column(
              children: [
                Builder(builder: (context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: AwesomeCameraModeSelector(state: state),
                  );
                }),
              ],
            );
          },
          bottomActionsBuilder: (state) {
            return AwesomeBottomActions(
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
            );
          },
          topActionsBuilder: (state) {
            return SizedBox(
              child: AwesomeTopActions(
                state: state,
                children: [
                  AwesomeFlashButton(state: state),
                ],
              ),
            );
          },
          theme: AwesomeTheme(
            bottomActionsBackgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
