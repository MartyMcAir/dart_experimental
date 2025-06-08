import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/user_image_picker.dart';

final _firebase = FirebaseAuth.instance;

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

  Future<void> _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid || !_isLogin && _selectedImage == null) {
      return;
    }

    _form.currentState!.save();
    try {
      if (_isLogin) {
        final userCredentials =
            await _firebase.signInWithEmailAndPassword(email: _enteredEmail, password: _enteredPassword);
        print('userCredentials: $userCredentials and with uder.uid: {$userCredentials.user.uid}');
      } else {
        // les279 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37736614#overview
        // behind the scenes, this method from the Firebase SDK will send a HTTP request to Firebase
        final userCredentials =
            await _firebase.createUserWithEmailAndPassword(email: _enteredEmail, password: _enteredPassword);
        print('userCredentials: $userCredentials and with uder.uid: {$userCredentials.user.uid}');
        // upload selected img
        // les289 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37736656#overview
        // FireBaseStorage.instance.ref()
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        // ..
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            //
                            if (!_isLogin)
                              UserImagePicker(onPickImage: (pickedImage) {
                                print('pickedImage: $pickedImage');
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
                            ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                ),
                                child: Text(_isLogin ? 'Login' : 'Signup')),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isLogin = !_isLogin;
                                  });
                                },
                                child: Text(_isLogin ? 'Create an account' : 'I already have an account'))
                            // _isLogin ? 'Create an account' : 'I already have an account. Login instead.'))
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
