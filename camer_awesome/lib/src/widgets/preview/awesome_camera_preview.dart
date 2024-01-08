import 'dart:async';
import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:camerawesome/src/widgets/preview/awesome_preview_fit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum CameraPreviewFit {
  fitWidth,
  fitHeight,
  contain,
  cover,
}

/// This is a fullscreen camera preview
/// some part of the preview are cropped so we have a full sized camera preview
class AwesomeCameraPreview extends StatefulWidget {
  final CameraPreviewFit previewFit;
  final Widget? loadingWidget;
  final CameraState state;
  final OnPreviewTap? onPreviewTap;
  final OnPreviewScale? onPreviewScale;
  final CameraLayoutBuilder interfaceBuilder;
  final CameraLayoutBuilder? previewDecoratorBuilder;
  final EdgeInsets padding;
  final Alignment alignment;
  final PictureInPictureConfigBuilder? pictureInPictureConfigBuilder;
  final Function(CaptureMode mode)? reSetState;
  final OnMediaTap? onMediaTap;
  final Widget Function(CameraState state)? topActionsBuilder;
  final Widget Function(CameraState state)? bottomActionsBuilder;
  final Widget Function(CameraState state)? middleContentBuilder;
  final Function()? nextCamScreen;

  const AwesomeCameraPreview({
    super.key,
    this.loadingWidget,
    required this.state,
    this.onPreviewTap,
    this.onPreviewScale,
    this.previewFit = CameraPreviewFit.cover,
    required this.interfaceBuilder,
    this.previewDecoratorBuilder,
    required this.padding,
    required this.alignment,
    this.pictureInPictureConfigBuilder,
    this.reSetState,
    this.onMediaTap,
    this.topActionsBuilder,
    this.bottomActionsBuilder,
    this.middleContentBuilder,
    this.nextCamScreen,
  });

  @override
  State<StatefulWidget> createState() {
    return AwesomeCameraPreviewState();
  }
}

class AwesomeCameraPreviewState extends State<AwesomeCameraPreview> {
  PreviewSize? _previewSize;

  final List<Texture> _textures = [];

  PreviewSize? get pixelPreviewSize => _previewSize;

  StreamSubscription? _sensorConfigSubscription;
  StreamSubscription? _aspectRatioSubscription;
  CameraAspectRatios? _aspectRatio;
  double? _aspectRatioValue;
  Preview? _preview;

  final int kMaximumSupportedFloatingPreview = 3;

  @override
  void initState() {
    super.initState();
    Future.wait([
      widget.state.previewSize(0),
      _loadTextures(),
    ]).then((data) {
      if (mounted) {
        setState(() {
          _previewSize = data[0];
        });
      }
    });

    // refactor this
    _sensorConfigSubscription =
        widget.state.sensorConfig$.listen((sensorConfig) {
      _aspectRatioSubscription?.cancel();
      _aspectRatioSubscription =
          sensorConfig.aspectRatio$.listen((event) async {
        final previewSize = await widget.state.previewSize(0);
        if ((_previewSize != previewSize || _aspectRatio != event) && mounted) {
          setState(() {
            _aspectRatio = event;
            switch (event) {
              case CameraAspectRatios.ratio_16_9:
                _aspectRatioValue = 16 / 9;
                break;
              case CameraAspectRatios.ratio_4_3:
                _aspectRatioValue = 4 / 3;
                break;
              case CameraAspectRatios.ratio_1_1:
                _aspectRatioValue = 1;
                break;
            }
            _previewSize = previewSize;
          });
        }
      });
    });
  }

  Future _loadTextures() async {
    // ignore: invalid_use_of_protected_member
    print("================ _loadTextures");
    _textures.clear();
    final sensors = widget.state.cameraContext.sensorConfig.sensors.length;

    // Set it to true to debug the floating preview on a device that doesn't
    // support multicam
    // ignore: dead_code
    if (false) {
      for (int i = 0; i < 2; i++) {
        final textureId = await widget.state.previewTextureId(0);
        if (textureId != null) {
          _textures.add(
            Texture(textureId: textureId),
          );
        }
      }
    } else {
      for (int i = 0; i < sensors; i++) {
        final textureId = await widget.state.previewTextureId(i);
        if (textureId != null) {
          _textures.add(
            Texture(textureId: textureId),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _sensorConfigSubscription?.cancel();
    _aspectRatioSubscription?.cancel();
    super.dispose();
  }

  bool checkDuoMode() {
    return widget.state.captureMode == CaptureMode.duo ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    if (_textures.isEmpty || _previewSize == null || _aspectRatio == null) {
      return widget.loadingWidget ??
          Center(
            child: Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(),
          );
    }

    return Container(
      color: Colors.black,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return checkDuoMode()
              ? _previewDuoMode(context, constraints)
              : _defaultMode(context, constraints);
        },
      ),
    );
  }

  Stack _previewDuoMode(BuildContext context, BoxConstraints constraints) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.only(top: 120, left: 5, right: 5),
            child: AnimatedPreviewFit(
              previewFit: widget.previewFit,
              previewSize: PreviewSize(
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.width * _aspectRatioValue!,
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 10,
                maxHeight:
                    MediaQuery.of(context).size.width * _aspectRatioValue!,
              ),
              sensor: widget.state.sensorConfig.sensors.first,
              onPreviewCalculated: (preview) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  if (mounted) {
                    setState(() {
                      _preview = preview;
                    });
                  }
                });
              },
              child: AwesomeCameraGestureDetector(
                onPreviewTapBuilder:
                    widget.onPreviewTap != null && _previewSize != null
                        ? OnPreviewTapBuilder(
                            pixelPreviewSizeGetter: () => _previewSize!,
                            flutterPreviewSizeGetter: () =>
                                _previewSize!, //croppedPreviewSize,
                            onPreviewTap: widget.onPreviewTap!,
                          )
                        : null,
                onPreviewScale: widget.onPreviewScale,
                initialZoom: widget.state.sensorConfig.zoom,
                child: StreamBuilder<AwesomeFilter>(
                  //FIX performances
                  stream: widget.state.filter$,
                  builder: (context, snapshot) {
                    return snapshot.hasData &&
                            snapshot.data != AwesomeFilter.None
                        ? ColorFiltered(
                            colorFilter: snapshot.data!.preview,
                            child: _textures.first,
                          )
                        : _textures.first;
                  },
                ),
              ),
            ),
          ),
        ),
        if (widget.previewDecoratorBuilder != null && _preview != null)
          Positioned.fill(
            child: widget.previewDecoratorBuilder!(
              widget.state,
              _preview!,
              null,
            ),
          ),
        if (_preview != null)
          Positioned.fill(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: widget.topActionsBuilder?.call(widget.state) ??
                        AwesomeTopActions(state: widget.state),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 4 / 3,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        widget.middleContentBuilder?.call(widget.state) ??
                            AwesomeCameraModeSelector(
                              state: widget.state,
                              reSetState: (mode) {
                                if (widget.reSetState != null) {
                                  widget.reSetState!(mode);
                                  _loadTextures();
                                  setState(() {});
                                }
                              },
                              nextCamScreen: widget.nextCamScreen,
                            ),
                        widget.bottomActionsBuilder?.call(widget.state) ??
                            AwesomeBottomActions(
                                state: widget.state,
                                onMediaTap: widget.onMediaTap),
                      ],
                    ),
                  ),
                  // color: theme.bottomActionsBackgroundColor,
                ],
              ),
            ),
          ),
        ..._buildPreviewTextures(),
      ],
    );
  }

  Stack _defaultMode(BuildContext context, BoxConstraints constraints) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedPreviewFit(
            previewFit: widget.previewFit,
            previewSize: _previewSize!,
            constraints: constraints,
            sensor: widget.state.sensorConfig.sensors.first,
            onPreviewCalculated: (preview) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                if (mounted) {
                  setState(() {
                    _preview = preview;
                  });
                }
              });
            },
            child: AwesomeCameraGestureDetector(
              onPreviewTapBuilder:
                  widget.onPreviewTap != null && _previewSize != null
                      ? OnPreviewTapBuilder(
                          pixelPreviewSizeGetter: () => _previewSize!,
                          flutterPreviewSizeGetter: () =>
                              _previewSize!, //croppedPreviewSize,
                          onPreviewTap: widget.onPreviewTap!,
                        )
                      : null,
              onPreviewScale: widget.onPreviewScale,
              initialZoom: widget.state.sensorConfig.zoom,
              child: StreamBuilder<AwesomeFilter>(
                //FIX performances
                stream: widget.state.filter$,
                builder: (context, snapshot) {
                  return snapshot.hasData && snapshot.data != AwesomeFilter.None
                      ? ColorFiltered(
                          colorFilter: snapshot.data!.preview,
                          child: _textures.first,
                        )
                      : _textures.first;
                },
              ),
            ),
          ),
        ),
        if (widget.previewDecoratorBuilder != null && _preview != null)
          Positioned.fill(
            child: widget.previewDecoratorBuilder!(
              widget.state,
              _preview!,
              null,
            ),
          ),
        if (_preview != null)
          Positioned.fill(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: widget.topActionsBuilder?.call(widget.state) ??
                        AwesomeTopActions(state: widget.state),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 4 / 3,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        widget.middleContentBuilder?.call(widget.state) ??
                            AwesomeCameraModeSelector(
                              state: widget.state,
                              reSetState: (mode) {
                                if (widget.reSetState != null) {
                                  widget.reSetState!(mode);
                                  _loadTextures();
                                  setState(() {});
                                }
                              },
                              nextCamScreen: widget.nextCamScreen,
                            ),
                        widget.bottomActionsBuilder?.call(widget.state) ??
                            AwesomeBottomActions(
                              state: widget.state,
                              onMediaTap: widget.onMediaTap,
                            ),
                      ],
                    ),
                  ),
                  // color: theme.bottomActionsBackgroundColor,
                ],
              ),
            ),
          ),
        ..._buildPreviewTextures(),
      ],
    );
  }

  List<Widget> _buildPreviewTextures() {
    final previewFrames = <Widget>[];
    // if there is only one texture
    if (_textures.length <= 1) {
      return previewFrames;
    }
    // ignore: invalid_use_of_protected_member
    final sensors = widget.state.cameraContext.sensorConfig.sensors;

    for (int i = 1; i < _textures.length; i++) {
      // TODO: add a way to retrive how camera can be added ("budget" on iOS ?)
      if (i >= kMaximumSupportedFloatingPreview) {
        break;
      }

      final texture = _textures[i];
      final sensor = sensors[kDebugMode ? 0 : i];
      final frame = AwesomeCameraFloatingPreview(
        index: i,
        sensor: sensor,
        texture: texture,
        aspectRatio: 1 / _aspectRatioValue!,
        pictureInPictureConfig:
            widget.pictureInPictureConfigBuilder?.call(i, sensor) ??
                PictureInPictureConfig(
                  startingPosition: Offset(
                    i * 20,
                    MediaQuery.of(context).padding.top + 60 + (i * 20),
                  ),
                  sensor: sensor,
                ),
      );
      previewFrames.add(frame);
    }

    return previewFrames;
  }
}
