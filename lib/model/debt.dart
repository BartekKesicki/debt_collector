import 'package:debt_collector/db/table_data_constants.dart';

class Debt {
  int id;
  String description;
  int debtUserId;
  int debtorId;
  double value;

  Debt(this.id, this.description, this.debtUserId, this.debtorId, this.value);

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map[TableDataConstants.debtTableIdColumnName] = id;
    }
    map[TableDataConstants.debtTableDescriptionColumnName] = description;
    map[TableDataConstants.debtTableDebtUserIdColumnName] = debtUserId;
    map[TableDataConstants.debtTableDebtorIdColumnName] = debtorId;
    map[TableDataConstants.debtTableValueColumnName] = value;
    return map;
  }

  Debt.fromMap(Map<String, dynamic> map) {
    this.id = map[TableDataConstants.debtTableIdColumnName];
    this.description = map[TableDataConstants.debtTableDescriptionColumnName];
    this.debtUserId = map[TableDataConstants.debtTableDebtUserIdColumnName];
    this.debtorId = map[TableDataConstants.debtTableDebtorIdColumnName];
    this.value = map[TableDataConstants.debtTableValueColumnName];
  }
}