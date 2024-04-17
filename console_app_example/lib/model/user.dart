import './name.dart';
import './user_pro.dart';

import 'id.dart';

class User with showLastName implements ID, Name {
  static const double staticAroundConst = 3.14;
  static const languageArray = ['ru', 'ua', 'en'];

  @override
  final int id;
  @override
  final String name;
  String? lastName;

  User(this.id, this.name);

  @override
  // TODO: implement getName
  get getName => 'current name from User: ${this.name}';

  @override
  showName() {
    print('override showName from User class');
  }

  @override
  String toString() {
    // return super.toString();
    return "id: ${this.id}, name: ${name},";
  }
}
