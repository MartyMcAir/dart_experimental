import 'package:dart_application_1/model/user.dart';

mixin showLastName {
  showThisLastName(String lastName) {
    print('showThisLastName: $lastName');
  }
}

class UserPro with showLastName {
  String lastName;
  UserPro(this.lastName);

  @override
  String toString() {
    return 'lastName: $lastName';
  }
}
