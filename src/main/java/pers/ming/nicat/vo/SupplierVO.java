package pers.ming.nicat.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.SupplierPO;

public class SupplierVO {
	@JsonProperty("ID")
	private String ID;
	@JsonProperty("Name")
	private String Name;
	@JsonProperty("NationID")
	private String NationID;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getNationID() {
		return NationID;
	}

	public void setNationID(String nationID) {
		NationID = nationID;
	}

	public static SupplierVO toVO(SupplierPO po) {
		SupplierVO vo = new SupplierVO();
		vo.setID(po.getID());
		vo.setName(po.getName());
		vo.setNationID(po.getNationID());
		return vo;
	}

	public static SupplierPO toPO(SupplierVO vo) {
		SupplierPO po = new SupplierPO();
		po.setID(vo.getID());
		po.setName(vo.getName());
		po.setNationID(vo.getNationID());
		return po;
	}
}
