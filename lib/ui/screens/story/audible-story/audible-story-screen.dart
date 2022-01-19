// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:value_stories_app/core/constants/colors.dart';
// import 'package:value_stories_app/core/constants/screen-utils.dart';
// import 'package:value_stories_app/core/constants/strings.dart';
// import 'package:value_stories_app/core/constants/textstyle.dart';
// import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
// import 'package:value_stories_app/ui/custom_widgets/custom-widget.dart';
// import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
// import 'package:value_stories_app/ui/custom_widgets/progress-widget.dart';

// class AudibleStoryScreen extends StatefulWidget {
//   final dynamic storyDetails;
//   AudibleStoryScreen(this.storyDetails);
//   @override
//   _AudibleStoryScreenState createState() => _AudibleStoryScreenState();
// }

// class _AudibleStoryScreenState extends State<AudibleStoryScreen>
//     with SingleTickerProviderStateMixin {
//   var _value;
//   Duration duration;
//   AnimationController _controller;
//   final player = AudioPlayer();

//   var isplay;
//   Timer timer;
//   bool _isLoading = true;
//   @override
//   Future<void> didChangeDependencies() async {
//     duration = await player.setUrl(widget.storyDetails["StoryMP3"]);
//     print("@Duration");

//     player.play();
//     setState(() {
//       _isLoading = false;
//     });
//     super.didChangeDependencies();
//   }

//   @override
//   void initState() {
//     _controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 250));
//     _value = 0.1;
//     isplay = false;
//     super.initState();
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       _value = _value + 0.01;
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     player.dispose();
//     timer.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return UtilityBaseScreen(
//       bodyTopPadding: 193,
//       appBarChild: _topAppBar(),
//       // backgroundColor: AppColors.mainColor,
//       body: _isLoading
//           ? Container(
//               color: Colors.transparent,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           : Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 40.h,
//                 ),
//                 ////
//                 ///The cover of book
//                 ///
//                 CustomWidget(
//                   image: widget.storyDetails["StoryCoverPic"],
//                   size: MediaQuery.of(context).size.width * .6,
//                   borderWidth: 5.w,
//                   onTap:
//                       () {}, // { Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailPage(),),);},
//                 ),
//                 Expanded(
//                   child: SizedBox(),
//                 ),
//                 ////
//                 ///TITLE nd subtitle of story book
//                 ///
//                 Text(widget.storyDetails["StoryTitle"],
//                     style: largeheadingTextStyle2.copyWith(
//                       fontSize: 30.sp,
//                     )),
//                 SizedBox(
//                   height: 14.sp,
//                 ),
//                 Text("By " + widget.storyDetails["StoryWriter"],
//                     style: largeheadingTextStyle2.copyWith(
//                         fontSize: 18.sp, color: greyColor.withOpacity(0.9))),
//                 Expanded(
//                   child: SizedBox(),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ProgressWidget(
//                     value: _value,
//                     labelStarts: "0.00",
//                     labelEnds:
//                         "${duration.inHours}:${duration.inMinutes.remainder(60)}:${(duration.inSeconds.remainder(60))}",
//                   ),
//                 ),
//                 Expanded(
//                   child: SizedBox(),
//                 ),

//                 ///
//                 ///Utitlity Row having all play pause and skip 5s buttons
//                 ///
//                 utitlityButtons(),
//                 SizedBox(
//                   height: 50.h,
//                 ),
//               ],
//             ),
//     );
//   }

//   utitlityButtons() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           IconButton(
//             onPressed: () {
//               setState(() async {
//                 if (_value > .2) {
//                   _value -= .1;
//                 }
//               });
//             },
//             icon: Icon(
//               Icons.skip_previous,
//               // color: AppColors.styleColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               if (_controller.value == 0) {
//                 _controller.forward();
//                 setState(() {
//                   isplay = false;
//                   player.pause();
//                   timer.cancel();
//                 });
//               } else {
//                 _controller.reverse();
//                 setState(() {
//                   isplay = true;
//                   player.play();
//                   timer = Timer.periodic(Duration(seconds: 1), (timer) {
//                     _value = _value + 0.01;
//                     setState(() {});
//                   });
//                 });
//               }
//             },
//             child: Container(
//               height: 80.h,
//               width: 80.w,
//               decoration:
//                   BoxDecoration(color: mainThemeColor, shape: BoxShape.circle),
//               child: Center(
//                 child: AnimatedIcon(
//                   size: 38,
//                   icon: AnimatedIcons.pause_play,
//                   progress: _controller,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () async {
//               await player.seek(Duration(seconds: 10));
//               setState(() {
//                 if (_value < .9) {
//                   _value += .1;
//                 }
//               });
//             },
//             icon: Icon(
//               Icons.skip_next,
//               // color: AppColors.styleColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _topAppBar() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//             padding: EdgeInsets.zero,
//             icon: ImageContainer(
//               assetImage: "$assets/back_button_black.png",
//               height: 20.18.h,
//               width: 9.94.w,
//             ),
//             onPressed: () {
//               print('back pressed');
//               Get.back();
//             }),
//         Text("",
//             // "Value Stories",
//             style: leikoHeadingTextStyle.copyWith(
//               fontSize: 26.sp,
//               color: Colors.white,
//               // fontWeight: FontWeight.bold
//             )),
//         Container(width: 20.sp)
//       ],
//     );
//   }
// }

// This is a minimal example demonstrating a play/pause button and a seek bar.
// More advanced examples demonstrating other features can be found in the same
// directory as this example in the GitHub repository.

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as get1;

import 'package:just_audio/just_audio.dart';

import 'package:rxdart/rxdart.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/strings.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';
import 'package:value_stories_app/ui/base_screens/utility-base-screen.dart';
import 'package:value_stories_app/ui/custom_widgets/custom-widget.dart';
import 'package:value_stories_app/ui/custom_widgets/image-container.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';

class AudibleStoryScreen extends StatefulWidget {
  final dynamic storyDetails;
  AudibleStoryScreen(this.storyDetails);
  @override
  _AudibleStoryScreenState createState() => _AudibleStoryScreenState();
}

class _AudibleStoryScreenState extends State<AudibleStoryScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(
          AudioSource.uri(Uri.parse(widget.storyDetails["StoryMP3"])));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return UtilityBaseScreen(
      bodyTopPadding: 193,
      appBarChild: _topAppBar(),
      // backgroundColor: AppColors.mainColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.h,
          ),
          ////
          ///The cover of book
          ///
          CustomWidget(
            image: widget.storyDetails["StoryCoverPic"],
            size: MediaQuery.of(context).size.width * .6,
            borderWidth: 5.w,
            onTap:
                () {}, // { Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailPage(),),);},
          ),
          Expanded(
            child: SizedBox(),
          ),
          ////
          ///TITLE nd subtitle of story book
          ///
          Text(widget.storyDetails["StoryTitle"],
              style: largeheadingTextStyle2.copyWith(
                fontSize: 30.sp,
              )),
          SizedBox(
            height: 14.sp,
          ),
          Text("By " + widget.storyDetails["StoryWriter"],
              style: largeheadingTextStyle2.copyWith(
                  fontSize: 18.sp, color: greyColor.withOpacity(0.9))),
          Expanded(
            child: SizedBox(),
          ),

          Expanded(
            child: SizedBox(),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display play/pause button and volume/speed sliders.

                // Display seek bar. Using StreamBuilder, this widget rebuilds
                // each time the position, buffered position or duration changes.
                StreamBuilder<PositionData>(
                  stream: _positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      duration: positionData?.duration ?? Duration.zero,
                      position: positionData?.position ?? Duration.zero,
                      bufferedPosition:
                          positionData?.bufferedPosition ?? Duration.zero,
                      onChangeEnd: _player.seek,
                    );
                  },
                ),
                ControlButtons(_player),
              ],
            ),
          ),

          ///
          ///Utitlity Row having all play pause and skip 5s buttons
          ///

          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}

/// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opens volume slider dialog
        IconButton(
          icon: Icon(
            Icons.volume_up,
            color: mainThemeColor,
          ),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),
        SizedBox(
          width: 20,
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: EdgeInsets.all(8.0),
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: mainThemeColor),
                child: IconButton(
                  icon: Icon(Icons.play_arrow, color: Colors.white),
                  iconSize: 54.0,
                  onPressed: player.play,
                ),
              );
            } else if (processingState != ProcessingState.completed) {
              return Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: mainThemeColor),
                child: IconButton(
                  icon: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                  iconSize: 54.0,
                  onPressed: player.pause,
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: mainThemeColor),
                child: IconButton(
                  icon: Icon(Icons.replay, color: Colors.white),
                  iconSize: 54.0,
                  onPressed: () => player.seek(Duration.zero),
                ),
              );
            }
          },
        ),
        SizedBox(
          width: 20,
        ),
        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => IconButton(
            icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 1.5,
                value: player.speed,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  SeekBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  SliderThemeData? _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderTheme(
          data: _sliderThemeData!.copyWith(
            thumbShape: HiddenThumbComponentShape(),
            activeTrackColor: Color(0XFF707070).withOpacity(0.14),
            inactiveTrackColor: Colors.grey.shade300,
          ),
          child: ExcludeSemantics(
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(widget.bufferedPosition.inMilliseconds.toDouble(),
                  widget.duration.inMilliseconds.toDouble()),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData!.copyWith(
            inactiveTrackColor: Colors.transparent,
            activeTrackColor: mainThemeColor,
            thumbColor: mainThemeColor,
          ),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: Theme.of(context).textTheme.caption),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

void showSliderDialog({
  required BuildContext context,
  required String title,
  required int divisions,
  required double min,
  required double max,
  String valueSuffix = '',
  // TODO: Replace these two by ValueStream.
  required double value,
  required Stream<double> stream,
  required ValueChanged<double> onChanged,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => Container(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

_topAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          padding: EdgeInsets.zero,
          icon: ImageContainer(
            assetImage: "$assets/back_button_black.png",
            height: 20.18.h,
            width: 9.94.w,
          ),
          onPressed: () {
            print('back pressed');
            get1.Get.back();
          }),
      Text("",
          // "Value Stories",
          style: leikoHeadingTextStyle.copyWith(
            fontSize: 26.sp,
            color: Colors.white,
            // fontWeight: FontWeight.bold
          )),
      Container(width: 20.sp)
    ],
  );
}
