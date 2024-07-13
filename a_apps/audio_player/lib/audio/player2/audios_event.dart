abstract class AudiosEvent {}

class OnLoadingEvent extends AudiosEvent {}

class PauseAudioEvent extends AudiosEvent {}

class StopAudioEvent extends AudiosEvent {}

class PlayAudioEvent extends AudiosEvent {
  final String audioUrl;
  PlayAudioEvent(this.audioUrl);
}

class LoadAudioFilesEvent extends AudiosEvent {
  final String folderPath;
  LoadAudioFilesEvent(this.folderPath);
}
