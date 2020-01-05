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

import pers.ming.nicat.dao.bean.ReceiptQueryModel;
import pers.ming.nicat.dao.impl.ReceiptDaoImpl;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.ReceiptVO;

@RestController
@CrossOrigin
@RequestMapping("api/ApiReceipt")
public class ReceiptController {

	@Autowired
	private ReceiptDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<ReceiptVO>> list(
			@RequestParam("StartDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xStartDate,
			@RequestParam("EndDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xEndDate) {
		ReceiptQueryModel filter = new ReceiptQueryModel();
		filter.setTradeDate_S(xStartDate);
		filter.setTradeDate_E(xEndDate);
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST(filter).stream().map(po -> ReceiptVO.toVO(po))));
	}

	@GetMapping("/{TransNo}")
	public ResponseEntity<ReceiptVO> get(@PathVariable("TransNo") String xTransNo) {
		return ResponseEntity.ok(ReceiptVO.toVO(dao.GET(xTransNo)));
	}

	@PostMapping
	public String add(@RequestBody String[] transnos) {
		return dao.ADD(transnos);
	}

	@PutMapping("/{TransNo}")
	public String update(@PathVariable("TransNo") String xTransNo, @RequestBody ReceiptVO receipt) {
		return dao.UPDATE(ReceiptVO.toPO(receipt));
	}

	@DeleteMapping("/{TransNo}")
	public String delete(@PathVariable("TransNo") String xTransNo) {
		return dao.DELETE(xTransNo);
	}
}
