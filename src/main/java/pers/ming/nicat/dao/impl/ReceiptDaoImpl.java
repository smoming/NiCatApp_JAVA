package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.ReceiptDAO;
import pers.ming.nicat.dao.bean.ReceiptQueryModel;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.ReceiptPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class ReceiptDaoImpl extends SqlCommandExecutor implements ReceiptDAO {

	private final String SP_LIST = "SP_RECEIPT_LIST(?,?)";
	private final String SP_GET = "SP_RECEIPT_GET(?)";
	private final String SP_ADD = "SP_RECEIPT_ADD(?)";
	private final String SP_UPDATE = "SP_RECEIPT_UPDATE(?,?,?,?)";
	private final String SP_DELETE = "SP_RECEIPT_DELETE(?)";

	@Override
	public ReceiptPO rowMapper(ResultSet rs) {
		ReceiptPO po = new ReceiptPO();
		try {
			po.setTransNo(rs.getString("TRANSNO"));
			po.setTradeDate(rs.getDate("TRADEDATE"));
			po.setTradeAmount(rs.getBigDecimal("TRADEAMOUNT"));
			po.setRemark(rs.getString("REMARK"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<ReceiptPO> LIST(ReceiptQueryModel filter) {
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

	private HashMap<String, Object> toSQLParams(ReceiptQueryModel filter) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TradeDate_S", filter.getTradeDate_S());
		in.put("i_TradeDate_E", filter.getTradeDate_E());
		return in;
	}

	@Override
	public ReceiptPO GET(String transno) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transno);
		try {
			rSet = executeQuery(SP_GET, in);
			return (ReceiptPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(String[] OrderNos) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_OrderNos", String.join(",", OrderNos));
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(ReceiptPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", item.getTransNo());
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_TRADEAMOUNT", item.getTradeAmount());
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
