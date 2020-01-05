package pers.ming.nicat.db;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import pers.ming.nicat.util.ObjectUtil;
import pers.ming.nicat.util.PropertiesUtil;

public class DBConnectionPool implements ConnectionPool {
	private final String dbConfigFileName = "DbConfig.properties";
	private int POOL_MAX_SIZE; // 連接池中最大Connection數目
	private List<Connection> pool;

	public synchronized Connection getConnection() throws SQLException {
		if (ObjectUtil.isNull(pool)) {
			pool = new ArrayList<Connection>();
		}
		Connection conn;
		if (pool.isEmpty()) {
			conn = createConnction();
		} else {
			int last_idx = pool.size() - 1;
			conn = pool.get(last_idx);
			pool.remove(conn);
		}
		System.out.println("pool size:" + pool.size());
		return conn;
	}

	public synchronized void releaseConnection(Connection conn) {
		if (pool.size() > POOL_MAX_SIZE) {
			DbUtil.releaseConnection(conn);
		} else {
			pool.add(conn);
		}
	}

	private Connection createConnction() throws SQLException {
		Properties props = getProperties();
		POOL_MAX_SIZE = Integer.parseInt(PropertiesUtil.getValue(props, "mysql.pool-max-size"));
		return DriverManager.getConnection(PropertiesUtil.getValue(props, "mysql.url"),
				PropertiesUtil.getValue(props, "mysql.username"), PropertiesUtil.getValue(props, "mysql.password"));
	}

	private Properties getProperties() {
		try {
			PropertiesUtil util = new PropertiesUtil();
			return util.getProperties(dbConfigFileName);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
