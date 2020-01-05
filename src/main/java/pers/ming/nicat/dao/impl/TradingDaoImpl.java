package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.TradingDAO;
import pers.ming.nicat.dao.bean.TradingQueryModel;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.TradingPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class TradingDaoImpl extends SqlCommandExecutor implements TradingDAO {

	private final String SP_LIST = "SP_TRADING_LIST(?,?,?,?,?,?,?)";
	private final String SP_GET = "SP_TRADING_GET(?)";
	private final String SP_ADD = "SP_TRADING_ADD(?,?,?,?,?,?,?)";
	private final String SP_UPDATE = "SP_TRADING_UPDATE(?,?,?,?,?,?,?,?)";
	private final String SP_DELETE = "SP_TRADING_DELETE(?)";

	@Override
	public TradingPO rowMapper(ResultSet rs) {
		TradingPO po = new TradingPO();
		try {
			po.setTransNo(rs.getString("TRANSNO"));
			po.setTradeDate(rs.getDate("TRADEDATE"));
			po.setBuyer(rs.getString("BUYER"));
			po.setRemark(rs.getString("COMMODITYID"));
			po.setTradeQuantity(rs.getBigDecimal("TRADEQUANTITY"));
			po.setTradeAmount(rs.getBigDecimal("TRADEAMOUNT"));
			po.setSupperNo(rs.getString("SUIPPERNO"));
			po.setRemark(rs.getString("REMARK"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<TradingPO> LIST(TradingQueryModel filter) {
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

	private HashMap<String, Object> toSQLParams(TradingQueryModel filter) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TradeDate_S", filter.getTradeDate_S());
		in.put("i_TradeDate_E", filter.getTradeDate_E());
		in.put("i_Buyer", filter.getBuyer());
		in.put("i_CommodityID", filter.getCommodityID());
		in.put("i_TransNos", filter.getTransNos());
		in.put("i_IsShipped", filter.getIsShipped());
		in.put("i_ShipperNo", filter.getShipperNo());
		return in;
	}

	@Override
	public TradingPO GET(String transNo) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transNo);
		try {
			rSet = executeQuery(SP_GET, in);
			return (TradingPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(TradingPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
//		in.put("i_TRANSNO", item.getTransNo());
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_BUYER", item.getBuyer());
		in.put("i_COMMODITYID", item.getCommodityID());
		in.put("i_TRADEQUANTITY", item.getTradeQuantity());
		in.put("i_TRADEAMOUNT", item.getTradeAmount());
		in.put("i_SUIPPERNO", item.getSupperNo());
		in.put("i_REMARK", item.getRemark());
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(TradingPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", item.getTransNo());
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_BUYER", item.getBuyer());
		in.put("i_COMMODITYID", item.getCommodityID());
		in.put("i_TRADEQUANTITY", item.getTradeQuantity());
		in.put("i_TRADEAMOUNT", item.getTradeAmount());
		in.put("i_SUIPPERNO", item.getSupperNo());
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
