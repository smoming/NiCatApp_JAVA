package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.ShipperDAO;
import pers.ming.nicat.dao.bean.ShipperQueryModel;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.ShipperPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class ShipperDaoImpl extends SqlCommandExecutor implements ShipperDAO {

	private final String SP_LIST = "SP_SHIPPER_LIST(?,?,?)";
	private final String SP_GET = "SP_SHIPPER_GET(?)";
	private final String SP_ADD = "SP_SHIPPER_ADD(?)";
	private final String SP_UPDATE = "SP_SHIPPER_UPDATE(?,?,?,?,?,?,?)";
	private final String SP_DELETE = "SP_SHIPPER_DELETE(?)";

	@Override
	public ShipperPO rowMapper(ResultSet rs) {
		ShipperPO po = new ShipperPO();
		try {
			po.setTransNo(rs.getString("TRANSNO"));
			po.setTradeDate(rs.getDate("TRADEDATE"));
			po.setBuyer(rs.getString("BUYER"));
			po.setTradeAmount(rs.getBigDecimal("TRADEAMOUNT"));
			po.setFee(rs.getBigDecimal("FEE"));
			po.setDelivery(rs.getString("DELIVERY"));
			po.setRemark(rs.getString("REMARK"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<ShipperPO> LIST(ShipperQueryModel filter) {
		try {
			rSet = executeQuery(SP_LIST, toSQLParams(filter));
			return ResultSetUtil.doRowMapper(rSet, this);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	private HashMap<String, Object> toSQLParams(ShipperQueryModel filter) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TradeDate_S", filter.getTradeDate_S());
		in.put("i_TradeDate_E", filter.getTradeDate_E());
		in.put("i_Buyer", filter.getBuyer());
		return in;
	}

	@Override
	public ShipperPO GET(String transNo) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transNo);
		try {
			rSet = executeQuery(SP_GET, in);
			return (ShipperPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(String[] transnos) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TradingNos", String.join(",", transnos));
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(ShipperPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", item.getTransNo());
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_BUYER", item.getBuyer());
		in.put("i_TRADEAMOUNT", item.getTradeAmount());
		in.put("i_FEE", item.getFee());
		in.put("i_DELIVERY", item.getDelivery());
		in.put("i_REMARK", item.getRemark());
		return Save(SaveAction.Modified, SP_UPDATE, in);
	}

	@Override
	public String DELETE(String transNo) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transNo);
		return Save(SaveAction.Deleted, SP_DELETE, in);
	}

}
