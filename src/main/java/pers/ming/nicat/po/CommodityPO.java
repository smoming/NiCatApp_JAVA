package pers.ming.nicat.po;

import java.math.BigDecimal;

public class CommodityPO {
	private String ID;
	private String Name;
	private String NationID;
	private String Style;
	private String SupplierID;
	private String Supplier_ProductNo;
	private BigDecimal WholeSale_Price;
	private BigDecimal Retail_Price;
	private String Remark;

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

	public String getStyle() {
		return Style;
	}

	public void setStyle(String style) {
		Style = style;
	}

	public String getSupplier_ProductNo() {
		return Supplier_ProductNo;
	}

	public void setSupplier_ProductNo(String supplier_ProductNo) {
		Supplier_ProductNo = supplier_ProductNo;
	}

	public String getSupplierID() {
		return SupplierID;
	}

	public void setSupplierID(String supplierID) {
		SupplierID = supplierID;
	}

	public BigDecimal getWholeSale_Price() {
		return WholeSale_Price;
	}

	public void setWholeSale_Price(BigDecimal wholeSale_Price) {
		WholeSale_Price = wholeSale_Price;
	}
}
