package pers.ming.nicat.db;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;

import pers.ming.nicat.util.ObjectUtil;

public class DbUtil {
	public static void releaseConnection(Connection conn) {
		if (ObjectUtil.isNotNull(conn)) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void releaseCallableStatement(CallableStatement stmt) {
		if (ObjectUtil.isNotNull(stmt)) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void releaseResultSet(ResultSet rSet) {
		if (ObjectUtil.isNotNull(rSet)) {
			try {
				rSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void releaseResultSetAndCallableStatement(ResultSet rSet, CallableStatement stmt) {
		releaseResultSet(rSet);
		releaseCallableStatement(stmt);
	}

	public static void setInSqlParas(CallableStatement cst, HashMap<String, Object> sqlPara) {
		if (sqlPara != null) {
			sqlPara.forEach((k, v) -> {
				if (v instanceof String) {
					try {
						cst.setString(k, ObjectUtil.converToString(v));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (v instanceof Integer) {
					try {
						cst.setInt(k, ObjectUtil.converToInt(v));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (v instanceof BigDecimal) {
					try {
						cst.setBigDecimal(k, ObjectUtil.converToBigDecimal(v));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (v instanceof Date) {
					try {
						cst.setDate(k, ObjectUtil.converToSqlDate(v));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (v instanceof Boolean) {
					try {
						cst.setString(k, (false == (Boolean) v) ? "N" : "Y");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (v == null) {
					try {
						cst.setString(k, "");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			});
		}
	}

	public static void setOutSqlParas(CallableStatement cst, HashMap<String, Integer> sqlPara) {
		if (sqlPara != null) {
			sqlPara.forEach((k, v) -> {
				try {
					cst.registerOutParameter(k, v);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			});
		}
	}

}
