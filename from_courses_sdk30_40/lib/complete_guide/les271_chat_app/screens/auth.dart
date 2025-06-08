import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/supabase_config.dart';
import '../utils/debug_helper.dart';
import '../utils/network_checker.dart';
import '../widgets/user_image_picker.dart';

// final _firebase = FirebaseAuth.instance;
final _supabase = Supabase.instance.client;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  File? _selectedImage;
  var _isAuthenticating = false;
  var _enteredUserName = '';

  Future<String> _uploadImageToSupabase(File imageFile, String userId) async {
    final supabase = Supabase.instance.client;
    final bytes = await imageFile.readAsBytes();
    final mimeType = lookupMimeType(imageFile.path) ?? 'application/octet-stream';
    final ext = p.extension(imageFile.path); // .jpg / .png /etc..
    // final fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}$ext';
    final fileName = 'uploads/$userId$ext';
    return await supabase.storage
        .from(supaBaseChatStorage!)
        .uploadBinary(fileName, bytes, fileOptions: FileOptions(upsert: true, contentType: mimeType));
  }

  Future<void> _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid || !_isLogin && _selectedImage == null) {
      return;
    }
    if (await warnIfNoNetworkConnection(context)) return;

    _form.currentState!.save();
    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        logPrint(additionalInfo: 'before auth.signInWithPassword', state: this);
        final response =
            await _supabase.auth.signInWithPassword(email: _enteredEmail, password: _enteredPassword);
        logPrint(
            supaBaseAuthResponse: response, additionalInfo: 'after auth.signInWithPassword', state: this);
      } else {
        final response =
            await Supabase.instance.client.auth.signUp(email: _enteredEmail, password: _enteredPassword);
        logPrint(supaBaseAuthResponse: response, state: this);
        final userId = response.user?.id;
        if (userId == null) {
          throw const AuthException('User creation failed');
        }
        final imageUrl = await _uploadImageToSupabase(_selectedImage!, userId);
        logPrint(additionalInfo: 'Image uploaded to: $imageUrl', state: this);
        // les292 firebase dataBase https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37736672#learning-tools
        await Supabase.instance.client.from('users').insert({
          'user_id': userId,
          'user_name': _enteredUserName,
          'user_email': _enteredEmail,
          'img_url': imageUrl,
        });
      }
    } on AuthException catch (error) {
      logPrint(additionalInfo: 'AuthException error: $error', state: this);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
      setState(() {
        _isAuthenticating = false;
      });
    } catch (error) {
      logPrint(additionalInfo: 'error: $error', state: this);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('An unexpected error occurred.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    logPrint(state: this);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
                width: 200,
                child: Image.asset('assets/compl_guide/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                        key: _form,
                        child: Column(
                          // to make sure that this column,
                          // will only take as much space as needed by its content essentially
                          // instead of taking as much space as it can get
                          // and having no boundaries on the vertical axis
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!_isLogin)
                              UserImagePicker(onPickImage: (pickedImage) {
                                logPrint(additionalInfo: 'pickedImage: $pickedImage', state: this);
                                _selectedImage = pickedImage;
                              }),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Email Address'),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email address.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                            ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(labelText: 'UserName'),
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.trim().length < 4) {
                                    return 'Please enter a valid username (at least 4 characters).';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteredUserName = value!;
                                },
                              ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                            ),
                            const SizedBox(height: 12),
                            if (_isAuthenticating) const CircularProgressIndicator(),
                            if (!_isAuthenticating)
                              ElevatedButton(
                                  onPressed: _submit,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                  ),
                                  child: Text(_isLogin ? 'Login' : 'Signup')),
                            if (!_isAuthenticating)
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: Text(_isLogin ? 'Create an account' : 'I already have an account'))
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
