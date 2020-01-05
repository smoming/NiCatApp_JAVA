package pers.ming.nicat.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pers.ming.nicat.dao.RowMapper;

public class ResultSetUtil {
	public static <T> ArrayList<T> doRowMapper(ResultSet rSet, RowMapper<T> dao) {
		ArrayList<T> resultList = new ArrayList<T>();
		try {
			while (rSet.next()) {
				resultList.add(dao.rowMapper(rSet));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultList;
	}
}
