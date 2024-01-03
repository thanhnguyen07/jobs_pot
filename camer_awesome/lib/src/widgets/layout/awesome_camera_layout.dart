// ignore_for_file: unused_import

import 'dart:io';

import 'package:camerawesome/src/orchestrator/models/capture_modes.dart';
import 'package:camerawesome/src/orchestrator/states/states.dart';
import 'package:camerawesome/src/widgets/awesome_camera_mode_selector.dart';
import 'package:camerawesome/src/widgets/camera_awesome_builder.dart';
import 'package:camerawesome/src/widgets/filters/awesome_filter_widget.dart';
import 'package:camerawesome/src/widgets/layout/layout.dart';
import 'package:camerawesome/src/widgets/utils/awesome_theme.dart';
import 'package:camerawesome/src/widgets/zoom/awesome_zoom_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// This widget doesn't handle [PreparingCameraState]
class AwesomeCameraLayout extends StatelessWidget {
  final CameraState state;
  final Widget middleContent;
  final Widget topActions;
  final Widget bottomActions;

  AwesomeCameraLayout({
    super.key,
    required this.state,
    OnMediaTap? onMediaTap,
    Widget? middleContent,
    Widget? topActions,
    Widget? bottomActions,
  })  : middleContent = middleContent ??
            (Column(
              children: [
                const Spacer(),
                if (state is PhotoCameraState && state.hasFilters)
                  AwesomeFilterWidget(state: state)
                else if (!kIsWeb && Platform.isAndroid)
                  AwesomeZoomSelector(state: state),
                AwesomeCameraModeSelector(state: state),
              ],
            )),
        topActions = topActions ?? AwesomeTopActions(state: state),
        bottomActions = bottomActions ??
            AwesomeBottomActions(state: state, onMediaTap: onMediaTap);

  @override
  Widget build(BuildContext context) {
    final theme = AwesomeThemeProvider.of(context).theme;
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: topActions,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 4 / 3,
          ),
          Expanded(
            child: Column(
              children: [
                middleContent,
                bottomActions,
              ],
            ),
          ),
          // color: theme.bottomActionsBackgroundColor,
        ],
      ),
    );
  }
}
