import 'package:debt_collector/db/table_data_constants.dart';

class Client {
  int id;
  String fullName;
  int creationTime;

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map[TableDataConstants.clientTableIdColumnName] = id;
    }
    map[TableDataConstants.clientTableFullNameColumnName] = fullName;
    map[TableDataConstants.clientTableCreationTimeColumnName] = creationTime;
    return map;
  }

  Client.fromMap(Map<String, dynamic> map) {
    this.id = map[TableDataConstants.clientTableIdColumnName];
    this.fullName = map[TableDataConstants.clientTableFullNameColumnName];
    this.creationTime = map[TableDataConstants.clientTableCreationTimeColumnName];
  }
}