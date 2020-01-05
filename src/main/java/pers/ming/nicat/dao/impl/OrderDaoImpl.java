package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.OrderDAO;
import pers.ming.nicat.dao.bean.OrderQueryModel;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.OrderPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class OrderDaoImpl extends SqlCommandExecutor implements OrderDAO {

	private final String SP_LIST = "SP_ORDER_LIST(?,?,?,?,?,?)";
	private final String SP_GET = "SP_ORDER_GET(?)";
	private final String SP_ADD = "SP_ORDER_ADD(?,?,?,?,?,?,?)";
	private final String SP_UPDATE = "SP_ORDER_UPDATE(?,?,?,?,?,?,?,?)";
	private final String SP_DELETE = "SP_ORDER_DELETE(?)";
	private final String SP_UNPAID = "SP_ORDER_UNPAID()";
	private final String SP_UNPURCHASE = "SP_ORDER_UNPURCHASE()";

	@Override
	public OrderPO rowMapper(ResultSet rs) {
		OrderPO po = new OrderPO();
		try {
			po.setTransNo(rs.getString("TRANSNO"));
			po.setTradeDate(rs.getDate("TRADEDATE"));
			po.setCommodityID(rs.getString("COMMODITYID"));
			po.setTradeQuantity(rs.getBigDecimal("TRADEQUANTITY"));
			po.setTradeAmount(rs.getBigDecimal("TRADEAMOUNT"));
			po.setReceiptNo(rs.getString("RECEIPTNO"));
			po.setPurchaseNo(rs.getString("PURCHASENO"));
			po.setRemark(rs.getString("REMARK"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<OrderPO> LIST(OrderQueryModel filter) {
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

	private HashMap<String, Object> toSQLParams(OrderQueryModel filter) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TradeDate_S", filter.getTradeDate_S());
		in.put("i_TradeDate_E", filter.getTradeDate_E());
		in.put("i_CommodityID", filter.getCommodityID());
		in.put("i_TransNos", filter.getTransNos());
//		in.put("i_IsPaid", filter.getIsPaid());
//		in.put("i_IsPurchased", filter.getIsPurchased());
		in.put("i_ReceiptNo", filter.getReceiptNo());
		in.put("i_PurchaseNo", filter.getPurchaseNo());
		return in;
	}

	@Override
	public OrderPO GET(String transNo) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transNo);
		try {
			rSet = executeQuery(SP_GET, in);
			return (OrderPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(OrderPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
//		in.put("i_TRANSNO", item.getTransNo());
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_COMMODITYID", item.getCommodityID());
		in.put("i_TRADEQUANTITY", item.getTradeQuantity());
		in.put("i_TRADEAMOUNT", item.getTradeAmount());
		in.put("i_RECEIPTNO", item.getReceiptNo());
		in.put("i_PURCHASENO", item.getPurchaseNo());
		in.put("i_REMARK", item.getRemark());
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(OrderPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", item.getTransNo());
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_COMMODITYID", item.getCommodityID());
		in.put("i_TRADEQUANTITY", item.getTradeQuantity());
		in.put("i_TRADEAMOUNT", item.getTradeAmount());
		in.put("i_RECEIPTNO", item.getReceiptNo());
		in.put("i_PURCHASENO", item.getPurchaseNo());
		in.put("i_REMARK", item.getRemark());
		return Save(SaveAction.Modified, SP_UPDATE, in);
	}

	@Override
	public String DELETE(String transNo) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transNo);
		return Save(SaveAction.Deleted, SP_DELETE, in);
	}

	@Override
	public ArrayList<OrderPO> UNPAID() {
		try {
			rSet = executeQuery(SP_UNPAID, null);
			return ResultSetUtil.doRowMapper(rSet, this);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public ArrayList<OrderPO> UNPURCHASE() {
		try {
			rSet = executeQuery(SP_UNPURCHASE, null);
			return ResultSetUtil.doRowMapper(rSet, this);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

}
