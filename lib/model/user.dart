import 'package:debt_collector/db/table_data_constants.dart';

class User {
  int id;
  String login;
  String password;

  User({this.id, this.login, this.password});

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map[TableDataConstants.userTableIdColumnName] = id;
    }
    map[TableDataConstants.userTableLoginColumnName] = login;
    map[TableDataConstants.userTablePasswordColumnName] = password;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this.id = map[TableDataConstants.userTableIdColumnName];
    this.login = map[TableDataConstants.userTableLoginColumnName];
    this.password = map[TableDataConstants.userTablePasswordColumnName];
  }
}