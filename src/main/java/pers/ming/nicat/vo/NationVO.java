package pers.ming.nicat.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.NationPO;

public class NationVO {

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

	public static NationVO toVO(NationPO po) {
		NationVO vo = new NationVO();
		vo.setID(po.getID());
		vo.setNAME(po.getName());
		return vo;
	}

	public static NationPO toPO(NationVO vo) {
		NationPO po = new NationPO();
		po.setID(vo.getID());
		po.setName(vo.getName());
		return po;
	}
}
