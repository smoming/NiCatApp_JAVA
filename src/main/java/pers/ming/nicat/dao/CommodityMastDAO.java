package pers.ming.nicat.dao;

import java.util.ArrayList;
import java.util.Date;

import pers.ming.nicat.po.CommodityMastPO;

public interface CommodityMastDAO extends RowMapper<CommodityMastPO> {

	ArrayList<CommodityMastPO> LIST();

	CommodityMastPO GET(String id);

	String ADD(CommodityMastPO item);

	String UPDATE(CommodityMastPO item);

	String DELETE(Date tradeDate);
}
