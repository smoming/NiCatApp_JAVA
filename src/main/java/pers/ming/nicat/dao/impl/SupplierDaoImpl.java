package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.SupplierDAO;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.SupplierPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class SupplierDaoImpl extends SqlCommandExecutor implements SupplierDAO {

	private final String SP_LIST = "SP_SUPPLIER_LIST()";
	private final String SP_GET = "SP_SUPPLIER_GET(?)";
	private final String SP_ADD = "SP_SUPPLIER_ADD(?,?,?)";
	private final String SP_UPDATE = "SP_SUPPLIER_UPDATE(?,?,?)";
	private final String SP_DELETE = "SP_SUPPLIER_DELETE(?)";

	@Override
	public SupplierPO rowMapper(ResultSet rs) {
		SupplierPO po = new SupplierPO();
		try {
			po.setID(rs.getString("ID"));
			po.setName(rs.getString("NAME"));
			po.setNationID(rs.getString("NATIONID"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<SupplierPO> LIST() {
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
	public SupplierPO GET(String id) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", id);
		try {
			rSet = executeQuery(SP_GET, in);
			return (SupplierPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(SupplierPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", item.getID());
		in.put("i_NAME", item.getName());
		in.put("i_NATIONID", item.getNationID());
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(SupplierPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", item.getID());
		in.put("i_NAME", item.getName());
		in.put("i_NATIONID", item.getNationID());
		return Save(SaveAction.Modified, SP_UPDATE, in);
	}

	@Override
	public String DELETE(String id) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", id);
		return Save(SaveAction.Deleted, SP_DELETE, in);
	}

}
