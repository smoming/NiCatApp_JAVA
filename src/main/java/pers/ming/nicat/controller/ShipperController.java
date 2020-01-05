package pers.ming.nicat.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
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
	public ResponseEntity<ArrayList<ShipperVO>> list(@RequestParam @Nullable Date StartDate,
			@RequestParam @Nullable Date EndDate, @RequestParam @Nullable String Buyer) {
		ShipperQueryModel filter = new ShipperQueryModel();
		filter.setTradeDate_S(StartDate);
		filter.setTradeDate_E(EndDate);
		filter.setBuyer(Buyer);
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST(filter).stream().map(po -> ShipperVO.toVO(po))));
	}

	@GetMapping("/{id}")
	public ResponseEntity<ShipperVO> get(@PathVariable("id") String id) {
		return ResponseEntity.ok(ShipperVO.toVO(dao.GET(id)));
	}

	@PostMapping
	public String add(@RequestBody ShipperVO shipper) {
		return dao.ADD(ShipperVO.toPO(shipper));
	}

	@PutMapping
	public String update(@RequestBody ShipperVO shipper) {
		return dao.UPDATE(ShipperVO.toPO(shipper));
	}

	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") String id) {
		return dao.DELETE(id);
	}
}
