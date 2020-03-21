import 'package:debt_collector/db/table_data_constants.dart';

class TableQueriesConstants {
  static final String CREATE_USER_TABLE_QUERY = "CREATE TABLE ${TableDataConstants.userTableName} (${TableDataConstants.userTableIdColumnName} INTEGER PRIMARY KEY, "
      "${TableDataConstants.userTableLoginColumnName} TEXT, ${TableDataConstants.userTablePasswordColumnName} TEXT);";
  static final String SELECT_USERS_QUERY = "SELECT * FROM ${TableDataConstants.userTableName};";

  static final String CREATE_BILL_TABLE_QUERY = "CREATE TABLE ${TableDataConstants.billTableName} (${TableDataConstants.billTableIdColumnName} INTEGER PRIMARY KEY, "
      "${TableDataConstants.billTableDescriptionColumnName} TEXT, ${TableDataConstants.billTableDebtUserIdColumnName} INTEGER, ${TableDataConstants.billTableDebtorIdColumnName} INTEGER, "
      "${TableDataConstants.billTableValueColumnName} REAL);";

  static final String CREATE_CLIENT_TABLE_QUERY = "CREATE TABLE ${TableDataConstants.clientTableName} (${TableDataConstants.clientTableIdColumnName} INTEGER PRIMARY KEY, "
      "${TableDataConstants.clientTableFullNameColumnName} TEXT, ${TableDataConstants.clientTableCreationTimeColumnName} INTEGER);";
}