package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.CommodityDAO;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.CommodityPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class CommodityDaoImpl extends SqlCommandExecutor implements CommodityDAO {

	private final String SP_LIST = "SP_COMMODITY_LIST()";
	private final String SP_GET = "SP_COMMODITY_GET(?)";
	private final String SP_ADD = "SP_COMMODITY_ADD(?,?,?,?,?,?,?,?)";
	private final String SP_UPDATE = "SP_COMMODITY_UPDATE(?,?,?,?,?,?,?,?,?)";
	private final String SP_DELETE = "SP_COMMODITY_DELETE(?)";

	@Override
	public CommodityPO rowMapper(ResultSet rs) {
		CommodityPO po = new CommodityPO();
		try {
			po.setID(rs.getString("ID"));
			po.setName(rs.getString("NAME"));
			po.setStyle(rs.getString("STYLE"));
			po.setNationID(rs.getString("NATIONID"));
			po.setSupplierID(rs.getString("SUPPLIERID"));
			po.setSupplier_ProductNo(rs.getString("SUPPLIER_PRODUCTNO"));
			po.setWholeSale_Price(rs.getBigDecimal("WHOLESALE_PRICE"));
			po.setRetail_Price(rs.getBigDecimal("RETAIL_PRICE"));
			po.setRemark(rs.getString("REMARK"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<CommodityPO> LIST() {
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
	public CommodityPO GET(String id) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", id);
		try {
			rSet = executeQuery(SP_GET, in);
			return (CommodityPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(CommodityPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
//		in.put("i_ID", item.getID());
		in.put("i_NAME", item.getName());
		in.put("i_STYLE", item.getStyle());
		in.put("i_NATIONID", item.getNationID());
		in.put("i_SUPPLIERID", item.getSupplierID());
		in.put("i_SUPPLIER_PRODUCTNO", item.getSupplier_ProductNo());
		in.put("i_WHOLESALE_PRICE", item.getWholeSale_Price());
		in.put("i_RETAIL_PRICE", item.getRetail_Price());
		in.put("i_REMARK", item.getRemark());
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(CommodityPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", item.getID());
		in.put("i_NAME", item.getName());
		in.put("i_STYLE", item.getStyle());
		in.put("i_NATIONID", item.getNationID());
		in.put("i_SUPPLIERID", item.getSupplierID());
		in.put("i_SUPPLIER_PRODUCTNO", item.getSupplier_ProductNo());
		in.put("i_WHOLESALE_PRICE", item.getWholeSale_Price());
		in.put("i_RETAIL_PRICE", item.getRetail_Price());
		in.put("i_REMARK", item.getRemark());
		return Save(SaveAction.Modified, SP_UPDATE, in);
	}

	@Override
	public String DELETE(String id) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_ID", id);
		return Save(SaveAction.Deleted, SP_DELETE, in);
	}

}
