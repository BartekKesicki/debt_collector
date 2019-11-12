import 'package:debt_collector/db/table_data_constants.dart';

class Debtor {
  int id;
  String fullName;
  int creationTime;

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map[TableDataConstants.debtorTableIdColumnName] = id;
    }
    map[TableDataConstants.debtorTableFullNameColumnName] = fullName;
    map[TableDataConstants.debtorTableCreationTimeColumnName] = creationTime;
    return map;
  }

  Debtor.fromMap(Map<String, dynamic> map) {
    this.id = map[TableDataConstants.debtorTableIdColumnName];
    this.fullName = map[TableDataConstants.debtorTableFullNameColumnName];
    this.creationTime = map[TableDataConstants.debtorTableCreationTimeColumnName];
  }
}