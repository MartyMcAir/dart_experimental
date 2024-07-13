abstract class AudioState {}

class AudioInitial extends AudioState {}

class PlayingAudio extends AudioState {}

class PausedAudio extends AudioState {}

class StoppedAudio extends AudioState {}

class OnLoading extends AudioState {
  final bool isLoading;
  OnLoading(this.isLoading);
}

class AudioFilesLoaded extends AudioState {
  final List<String> audioFiles;
  AudioFilesLoaded(this.audioFiles);
}
