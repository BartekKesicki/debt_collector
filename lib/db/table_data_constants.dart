class TableDataConstants {

  // USER
  static final String userTableName = "Users";
  static final String userTableIdColumnName = "Id";
  static final String userTableLoginColumnName = "Login";
  static final String userTablePasswordColumnName = "Password";

  // DEBT
  static final String billTableName = "Bills";
  static final String billTableIdColumnName = "id";
  static final String billTableDescriptionColumnName = "description";
  static final String billTableDebtUserIdColumnName = "billUserId";
  static final String billTableDebtorIdColumnName = "clientId";
  static final String billTableValueColumnName = "value";
  static final String billTableInterestColumnName = "Interest";
  static final String billTableCreationTimeColumnName = "creationTime";

  // DEBTOR
  static final String clientTableName = "Clients";
  static final String clientTableIdColumnName = "Id";
  static final String clientTableFullNameColumnName = "FullName";
  static final String clientTableCreationTimeColumnName = "CreationTime";
}