import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;

import 'audio_state.dart';
import 'audios_event.dart';

class AudiosBloc extends Bloc<AudiosEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudiosBloc() : super(AudioInitial()) {
    on<OnLoadingEvent>(_onLoading);
    on<PlayAudioEvent>(_onPlayAudio);
    on<PauseAudioEvent>(_onPauseAudio);
    on<StopAudioEvent>(_onStopAudio);
    on<LoadAudioFilesEvent>(_onLoadAudioFiles);
  }

  _onLoading(OnLoadingEvent event, Emitter<AudioState> emit) {
    emit(OnLoading(true));
  }

  _onPlayAudio(PlayAudioEvent event, Emitter<AudioState> emit) async {
    await _audioPlayer.play(UrlSource(event.audioUrl));
    emit(PlayingAudio());
  }

  _onPauseAudio(PauseAudioEvent event, Emitter<AudioState> emit) async {
    await _audioPlayer.pause();
    emit(PausedAudio());
  }

  _onStopAudio(StopAudioEvent event, Emitter<AudioState> emit) async {
    await _audioPlayer.stop();
    emit(StoppedAudio());
  }

  _onLoadAudioFiles(LoadAudioFilesEvent event, Emitter<AudioState> emit) async {
    final directory = Directory(event.folderPath);
    if (await directory.exists()) {
      final audioFiles = directory
          .listSync()
          .where((item) => item is File && path.extension(item.path) == '.mp3')
          .map((item) => item.path)
          .toList();
      emit(AudioFilesLoaded(audioFiles));
      if (audioFiles.isNotEmpty) {
        add(PlayAudioEvent(audioFiles.first));
      }
    }
  }
}
