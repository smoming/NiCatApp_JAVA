package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.dao.bean.ShipperQueryModel;
import pers.ming.nicat.po.ShipperPO;

public interface ShipperDAO extends RowMapper<ShipperPO> {

	ArrayList<ShipperPO> LIST(ShipperQueryModel filter);

	ShipperPO GET(String id);

	String ADD(String[] transnos);

	String UPDATE(ShipperPO item);

	String DELETE(String transNo);
}
