import 'package:debt_collector/db/table_data_constants.dart';

class TableQueriesConstants {
  static final String CREATE_USER_TABLE_QUERY = "CREATE TABLE ${TableDataConstants.userTableName} (${TableDataConstants.userTableIdColumnName} INTEGER PRIMARY KEY, "
      "${TableDataConstants.userTableLoginColumnName} TEXT, ${TableDataConstants.userTablePasswordColumnName} TEXT);";
  static final String SELECT_USERS_QUERY = "SELECT * FROM ${TableDataConstants.userTableName};";

  static final String CREATE_DEBT_TABLE_QUERY = "CREATE TABLE ${TableDataConstants.debtTableName} (${TableDataConstants.debtTableIdColumnName} INTEGER PRIMARY KEY, "
      "${TableDataConstants.debtTableDescriptionColumnName} TEXT, ${TableDataConstants.debtTableDebtUserIdColumnName} INTEGER, ${TableDataConstants.debtTableDebtorIdColumnName} INTEGER, "
      "${TableDataConstants.debtTableValueColumnName} REAL);";

  static final String CREATE_DEBTOR_TABLE_QUERY = "CREATE TABLE ${TableDataConstants.debtorTableName} (${TableDataConstants.debtorTableIdColumnName} INTEGER PRIMARY KEY, "
      "${TableDataConstants.debtorTableFullNameColumnName} TEXT, ${TableDataConstants.debtorTableCreationTimeColumnName} INTEGER);";
}