import 'package:debt_collector/db/table_data_constants.dart';

class Bill {
  int id;
  String description;
  int billUserId;
  int clientId;
  double value;
  double interest;
  int creationTime;

  Bill(this.id, this.description, this.billUserId, this.clientId, this.value, this.interest, this.creationTime);

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map[TableDataConstants.billTableIdColumnName] = id;
    }
    map[TableDataConstants.billTableDescriptionColumnName] = description;
    map[TableDataConstants.billTableDebtUserIdColumnName] = billUserId;
    map[TableDataConstants.billTableDebtorIdColumnName] = clientId;
    map[TableDataConstants.billTableValueColumnName] = value;
    map[TableDataConstants.billTableInterestColumnName] = interest;
    map[TableDataConstants.billTableCreationTimeColumnName] = creationTime;
    return map;
  }

  Bill.fromMap(Map<String, dynamic> map) {
    this.id = map[TableDataConstants.billTableIdColumnName];
    this.description = map[TableDataConstants.billTableDescriptionColumnName];
    this.billUserId = map[TableDataConstants.billTableDebtUserIdColumnName];
    this.clientId = map[TableDataConstants.billTableDebtorIdColumnName];
    this.value = map[TableDataConstants.billTableValueColumnName];
    this.interest = map[TableDataConstants.billTableInterestColumnName];
    this.creationTime = map[TableDataConstants.billTableCreationTimeColumnName];
  }
}