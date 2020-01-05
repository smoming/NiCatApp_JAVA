package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.po.DeliveryTypePO;

public interface DeliveryTypeDAO extends RowMapper<DeliveryTypePO> {

	ArrayList<DeliveryTypePO> LIST();

	DeliveryTypePO GET(String id);

	String ADD(DeliveryTypePO item);

	String UPDATE(DeliveryTypePO item);

	String DELETE(String id);
}
