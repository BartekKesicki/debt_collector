import 'package:debt_collector/db/table_data_constants.dart';

class TableQueriesConstants {
  static final String CREATE_USER_TABLE_QUERY = "CREATE TABLE ${TableDataConstants.userTableName} (${TableDataConstants.userTableIdColumnName} INTEGER PRIMARY KEY, "
      "${TableDataConstants.userTableLoginColumnName} TEXT, ${TableDataConstants.userTablePasswordColumnName} TEXT);";
  static final String SELECT_USERS_QUERY = "SELECT * FROM ${TableDataConstants.userTableName};";
}