package pers.ming.nicat.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import pers.ming.nicat.enums.SaveAction;

public class SqlCommandExecutor extends DBConnectionPool {
	protected Connection conn = null;
	protected CallableStatement stmt = null;
	protected ResultSet rSet;

	private ResultSet doQuery(String sql, HashMap<String, Object> sqlInPara, HashMap<String, Integer> sqlOutPara)
			throws SQLException {
		conn = getConnection();
		stmt = conn.prepareCall("{call " + sql + "}");
		DbUtil.setInSqlParas(stmt, sqlInPara);
		DbUtil.setOutSqlParas(stmt, sqlOutPara);
		return stmt.executeQuery();
	}

	private Boolean doSave(String sql, HashMap<String, Object> sqlInPara, HashMap<String, Integer> sqlOutPara)
			throws SQLException {
		conn = getConnection();
		stmt = conn.prepareCall("{call " + sql + "}");
		DbUtil.setInSqlParas(stmt, sqlInPara);
		DbUtil.setOutSqlParas(stmt, sqlOutPara);
		return (stmt.executeUpdate() > 0);
	}

	protected ResultSet executeQuery(String sql, HashMap<String, Object> sqlInPara) throws SQLException {
		return executeQuery(sql, sqlInPara, null);
	}

	protected ResultSet executeQuery(String sql, HashMap<String, Object> sqlInPara, HashMap<String, Integer> sqlOutPara)
			throws SQLException {
		return doQuery(sql, sqlInPara, sqlOutPara);
	}

	protected Boolean executeUpdate(String sql, HashMap<String, Object> sqlInPara) throws SQLException {
		return executeUpdate(sql, sqlInPara, null);
	}

	protected Boolean executeUpdate(String sql, HashMap<String, Object> sqlInPara, HashMap<String, Integer> sqlOutPara)
			throws SQLException {
		return doSave(sql, sqlInPara, sqlOutPara);
	}

	protected String Save(SaveAction action, String sp, HashMap<String, Object> in) {
		try {
			executeUpdate(sp, in);
		} catch (SQLException e) {
			e.printStackTrace();
			return "Save Error: ".concat(e.getMessage());
		} finally {
			releaseResources();
		}

		return action.getDescription().concat("成功");
    }

	protected void releaseResources() {
		DbUtil.releaseResultSetAndCallableStatement(rSet, stmt);
		releaseConnection(conn);
	}

}
