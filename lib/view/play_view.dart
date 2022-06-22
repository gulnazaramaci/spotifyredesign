import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotifyredesign/core/color/color_theme.dart';
import 'package:spotifyredesign/core/constants/constants.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';
import 'package:spotifyredesign/model/track_model.dart';

class PlayView extends StatefulWidget {
  final TrackClass? track;
  PlayView({Key? key, this.track}) : super(key: key);
  ImageConstants imageConstants = ImageConstants.instance;
  final colors = ColorTheme();
  AudioPlayer audioPlayer = new AudioPlayer();
  final constants = Constants();
  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  bool isPlay = false;

  PlayerState? _audioPlayerState;
  Duration? _duration;
  Duration? _position;

  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;
  bool get _isPaused => _playerState == PlayerState.paused;
  String get _durationText => _duration?.toString().split('.').first ?? '';
  String get _positionText => _position?.toString().split('.').first ?? '';

  AudioPlayer get player => widget.audioPlayer;

  @override
  void initState() {
    super.initState();
    _initStreams();
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    player.stop();
    super.dispose();
  }

  void _initStreams() {
    player.setSourceUrl(widget.track!.previewUrl!);
    setState(() => _playerState = PlayerState.playing);
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      player.stop();
      setState(() {
        _playerState = PlayerState.stopped;
        _position = _duration;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        _audioPlayerState = state;
      });
    });
  }

  Future<void> _play() async {
    player.setSourceUrl(widget.track!.previewUrl!);
    final position = _position;
    if (position != null && position.inMilliseconds > 0) {
      await player.seek(position);
    }
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Play')),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.imageConstants.temaBackground),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 25.0, bottom: 16.0, top: 16.0, right: 25.0),
              height: MediaQuery.of(context).size.width - 50,
              width: MediaQuery.of(context).size.width - 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imageConstants.playImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  widget.track!.album!.images![0].url,
                  width: (MediaQuery.of(context).size.width - 50) / 1.5,
                  height: (MediaQuery.of(context).size.width - 50) / 1.5,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 25.0, bottom: 16.0, top: 16.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.track!.name ?? ''),
                          Text(' -  ${widget.track!.artists![0].name ?? ' '}')
                        ]),
                  ),
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {}),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 25.0, bottom: 0.0, top: 16.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _position != null
                        ? '$_positionText'
                        : _duration != null
                            ? _durationText
                            : '',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    _position != null
                        ? '$_durationText'
                        : _duration != null
                            ? _durationText
                            : '',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Slider(
              activeColor: widget.colors.mountainMeadow,
              onChanged: (v) {
                final duration = _duration;
                if (duration == null) {
                  return;
                }
                final position = v * duration.inMilliseconds;
                player.seek(Duration(milliseconds: position.round()));
              },
              value: (_position != null &&
                      _duration != null &&
                      _position!.inMilliseconds > 0 &&
                      _position!.inMilliseconds < _duration!.inMilliseconds)
                  ? _position!.inMilliseconds / _duration!.inMilliseconds
                  : 0.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  key: const Key('play_button'),
                  onPressed: _isPlaying ? null : _play,
                  iconSize: 48.0,
                  icon: const Icon(Icons.play_arrow),
                  color: widget.colors.mountainMeadow,
                ),
                IconButton(
                  key: const Key('pause_button'),
                  onPressed: _isPlaying ? _pause : null,
                  iconSize: 48.0,
                  icon: const Icon(Icons.pause),
                  color: widget.colors.mountainMeadow,
                ),
                IconButton(
                  key: const Key('stop_button'),
                  onPressed: _isPlaying || _isPaused ? _stop : null,
                  iconSize: 48.0,
                  icon: const Icon(Icons.stop),
                  color: widget.colors.mountainMeadow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
