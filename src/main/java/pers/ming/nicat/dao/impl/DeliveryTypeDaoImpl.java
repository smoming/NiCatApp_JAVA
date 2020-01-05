package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.DeliveryTypeDAO;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.DeliveryTypePO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class DeliveryTypeDaoImpl extends SqlCommandExecutor implements DeliveryTypeDAO {
	private final String SP_LIST = "SP_DELIVERYTYPE_LIST()";
	private final String SP_GET = "SP_DELIVERYTYPE_GET(?)";
	private final String SP_ADD = "SP_DELIVERYTYPE_ADD(?,?)";
	private final String SP_UPDATE = "SP_DELIVERYTYPE_UPDATE(?,?)";
	private final String SP_DELETE = "SP_DELIVERYTYPE_DELETE(?)";

	@Override
	public ArrayList<DeliveryTypePO> LIST() {
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
	public DeliveryTypePO GET(String id) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", id);
		try {
			rSet = executeQuery(SP_GET, in);
			return (DeliveryTypePO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(DeliveryTypePO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", item.getID());
		in.put("i_NAME", item.getName());
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(DeliveryTypePO item) {
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
	public DeliveryTypePO rowMapper(ResultSet rs) {
		DeliveryTypePO po = new DeliveryTypePO();
		try {
			po.setID(rs.getString("ID"));
			po.setName(rs.getString("NAME"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}
}
