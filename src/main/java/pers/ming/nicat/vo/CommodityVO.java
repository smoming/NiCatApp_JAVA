package pers.ming.nicat.vo;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.CommodityPO;

public class CommodityVO {
	@JsonProperty("ID")
	private String ID;
	@JsonProperty("Name")
	private String Name;
	@JsonProperty("NationID")
	private String NationID;
	@JsonProperty("Style")
	private String Style;
	@JsonProperty("SupplierID")
	private String SupplierID;
	@JsonProperty("SupplierProductNo")
	private String Supplier_ProductNo;
	@JsonProperty("WholesalePrice")
	private BigDecimal WholeSale_Price;
	@JsonProperty("RetailPrice")
	private BigDecimal Retail_Price;
	@JsonProperty("Remark")
	private String Remark;

	public String getStyle() {
		return Style;
	}

	public void setStyle(String style) {
		Style = style;
	}

	public String getSupplierID() {
		return SupplierID;
	}

	public void setSupplierID(String supplierID) {
		SupplierID = supplierID;
	}

	public String getSupplier_ProductNo() {
		return Supplier_ProductNo;
	}

	public void setSupplier_ProductNo(String supplier_ProductNo) {
		Supplier_ProductNo = supplier_ProductNo;
	}

	public BigDecimal getWholeSale_Price() {
		return WholeSale_Price;
	}

	public void setWholeSale_Price(BigDecimal wholeSale_Price) {
		WholeSale_Price = wholeSale_Price;
	}

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

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public BigDecimal getRetail_Price() {
		return Retail_Price;
	}

	public void setRetail_Price(BigDecimal retail_Price) {
		Retail_Price = retail_Price;
	}

	public static CommodityVO toVO(CommodityPO po) {
		CommodityVO vo = new CommodityVO();
		vo.setID(po.getID());
		vo.setName(po.getName());
		vo.setNationID(po.getNationID());
		vo.setStyle(po.getStyle());
		vo.setSupplierID(po.getSupplierID());
		vo.setSupplier_ProductNo(po.getSupplier_ProductNo());
		vo.setWholeSale_Price(po.getWholeSale_Price());
		vo.setRetail_Price(po.getRetail_Price());
		vo.setRemark(po.getRemark());
		return vo;
	}

	public static CommodityPO toPO(CommodityVO vo) {
		CommodityPO po = new CommodityPO();
		po.setID(vo.getID());
		po.setName(vo.getName());
		po.setNationID(vo.getNationID());
		po.setStyle(vo.getStyle());
		po.setSupplierID(vo.getSupplierID());
		po.setSupplier_ProductNo(vo.getSupplier_ProductNo());
		po.setWholeSale_Price(vo.getWholeSale_Price());
		po.setRetail_Price(vo.getRetail_Price());
		po.setRemark(vo.getRemark());
		return po;
	}
}
