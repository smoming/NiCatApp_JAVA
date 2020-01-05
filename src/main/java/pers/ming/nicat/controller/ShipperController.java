package pers.ming.nicat.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import pers.ming.nicat.dao.bean.ShipperQueryModel;
import pers.ming.nicat.dao.impl.ShipperDaoImpl;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.ShipperVO;

@RestController
@CrossOrigin
@RequestMapping("api/ApiShippers")
public class ShipperController {

	@Autowired
	private ShipperDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<ShipperVO>> list(
			@RequestParam("StartDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xStartDate,
			@RequestParam("EndDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xEndDate,
			@RequestParam("Buyer") @Nullable String Buyer) {
		ShipperQueryModel filter = new ShipperQueryModel();
		filter.setTradeDate_S(xStartDate);
		filter.setTradeDate_E(xEndDate);
		filter.setBuyer(Buyer);
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST(filter).stream().map(po -> ShipperVO.toVO(po))));
	}

	@GetMapping("/{id}")
	public ResponseEntity<ShipperVO> get(@PathVariable("id") String id) {
		return ResponseEntity.ok(ShipperVO.toVO(dao.GET(id)));
	}

	@PostMapping
	public String add(@RequestBody String[] transnos) {
		return dao.ADD(transnos);
	}

	@PutMapping("/{TransNo}")
	public String update(@PathVariable("TransNo") String xTransNo, @RequestBody ShipperVO trading) {
		return dao.UPDATE(ShipperVO.toPO(trading));
	}

	@DeleteMapping("/{TransNo}")
	public String delete(@PathVariable("TransNo") String xTransNo) {
		return dao.DELETE(xTransNo);
	}
}
