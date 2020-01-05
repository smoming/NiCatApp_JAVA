package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.NationDAO;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.NationPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class NationDaoImpl extends SqlCommandExecutor implements NationDAO {

	private final String SP_LIST = "SP_NATION_LIST()";
	private final String SP_GET = "SP_NATION_GET(?)";
	private final String SP_ADD = "SP_NATION_ADD(?,?)";
	private final String SP_UPDATE = "SP_NATION_UPDATE(?,?)";
	private final String SP_DELETE = "SP_NATION_DELETE(?)";

	@Override
	public ArrayList<NationPO> LIST() {
		try {
			rSet = executeQuery(SP_LIST, null);
			return ResultSetUtil.doRowMapper(rSet, this);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public NationPO GET(String id) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", id);
		try {
			rSet = executeQuery(SP_GET, in);
			return (NationPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(NationPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", item.getID());
		in.put("i_NAME", item.getName());
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(NationPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", item.getID());
		in.put("i_NAME", item.getName());
		return Save(SaveAction.Modified, SP_UPDATE, in);
	}

	@Override
	public String DELETE(String id) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", id);
		return Save(SaveAction.Deleted, SP_DELETE, in);
	}

	@Override
	public NationPO rowMapper(ResultSet rs) {
		NationPO po = new NationPO();
		try {
			po.setID(rs.getString("ID"));
			po.setName(rs.getString("NAME"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}
}
