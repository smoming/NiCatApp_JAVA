package pers.ming.nicat.db;

import java.sql.Connection;
import java.sql.SQLException;

public interface ConnectionPool {
	Connection getConnection() throws SQLException;

	void releaseConnection(Connection conn);
}
