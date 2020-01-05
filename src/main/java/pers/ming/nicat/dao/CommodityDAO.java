package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.po.CommodityPO;

public interface CommodityDAO extends RowMapper<CommodityPO> {

	ArrayList<CommodityPO> LIST();

	CommodityPO GET(String id);

	String ADD(CommodityPO item);

	String UPDATE(CommodityPO item);

	String DELETE(String id);
}
