package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.po.SupplierPO;

public interface SupplierDAO extends RowMapper<SupplierPO> {

	ArrayList<SupplierPO> LIST();

	SupplierPO GET(String id);

	String ADD(SupplierPO item);

	String UPDATE(SupplierPO item);

	String DELETE(String id);
}
