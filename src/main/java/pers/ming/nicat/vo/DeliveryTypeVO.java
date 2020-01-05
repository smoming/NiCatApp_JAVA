package pers.ming.nicat.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.DeliveryTypePO;

public class DeliveryTypeVO {
	@JsonProperty("ID")
	private String ID;
	@JsonProperty("Name")
	private String Name;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setNAME(String nAME) {
		Name = nAME;
	}

	public static DeliveryTypeVO toVO(DeliveryTypePO po) {
		DeliveryTypeVO vo = new DeliveryTypeVO();
		vo.setID(po.getID());
		vo.setNAME(po.getName());
		return vo;
	}

	public static DeliveryTypePO toPO(DeliveryTypeVO vo) {
		DeliveryTypePO po = new DeliveryTypePO();
		po.setID(vo.getID());
		po.setName(vo.getName());
		return po;
	}
}
