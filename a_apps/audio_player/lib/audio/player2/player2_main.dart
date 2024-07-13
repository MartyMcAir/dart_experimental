import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;

import 'audio_state.dart';
import 'audios_bloc.dart';
import 'audios_event.dart';

void main() {
  runApp(const AudioPlayerApp());
}

class AudioPlayerApp extends StatelessWidget {
  const AudioPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => AudiosBloc(),
        child: const AudioPlayerPage(title: 'Audio Player'),
      ),
    );
  }
}

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key, required this.title});
  final String title;

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  String _selectedFolder = '';
  List<String> _audioFiles = [];
  String? _currentAudio;

  Future<void> _pickFolder() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      setState(() {
        _selectedFolder = selectedDirectory;
      });
      context.read<AudiosBloc>().add(LoadAudioFilesEvent(_selectedFolder));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<AudiosBloc, AudioState>(
        builder: (context, state) {
          if (state is AudioFilesLoaded) {
            _audioFiles = state.audioFiles;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Audio Player State: $state',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16.0),
              if (_audioFiles.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _audioFiles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(path.basename(_audioFiles[index])),
                        selected: _audioFiles[index] == _currentAudio,
                        onTap: () {
                          setState(() {
                            _currentAudio = _audioFiles[index];
                          });
                          context
                              .read<AudiosBloc>()
                              .add(PlayAudioEvent(_audioFiles[index]));
                        },
                      );
                    },
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  if (_audioFiles.isNotEmpty) {
                    context.read<AudiosBloc>().add(_currentAudio != null
                        ? PlayAudioEvent(_currentAudio!)
                        : PlayAudioEvent(_audioFiles.first));
                  }
                },
                child: const Text('Play'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AudiosBloc>().add(PauseAudioEvent());
                },
                child: const Text('Pause'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AudiosBloc>().add(StopAudioEvent());
                },
                child: const Text('Stop'),
              ),
              ElevatedButton(
                onPressed: _pickFolder,
                child: const Text('Select Folder'),
              ),
            ],
          );
        },
      ),
    );
  }
}
