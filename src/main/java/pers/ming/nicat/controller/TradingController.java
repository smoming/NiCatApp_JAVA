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

import pers.ming.nicat.dao.bean.TradingQueryModel;
import pers.ming.nicat.dao.impl.TradingDaoImpl;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.TradingVO;

@RestController
@CrossOrigin
@RequestMapping("api/ApiTradings")
public class TradingController {

	@Autowired
	private TradingDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<TradingVO>> list(
			@RequestParam("StartDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xStartDate,
			@RequestParam("EndDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xEndDate,
			@RequestParam("Buyer") @Nullable String Buyer, @RequestParam("CommodityID") @Nullable String CommodityID) {
		TradingQueryModel filter = new TradingQueryModel();
		filter.setTradeDate_S(xStartDate);
		filter.setTradeDate_E(xEndDate);
		filter.setBuyer(Buyer);
		filter.setCommodityID(CommodityID);
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST(filter).stream().map(po -> TradingVO.toVO(po))));
	}

	@GetMapping("GetUnShipped")
	public ResponseEntity<ArrayList<TradingVO>> unShipped(@RequestParam("Buyer") @Nullable String Buyer) {
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.UNSHIPPED(Buyer).stream().map(po -> TradingVO.toVO(po))));
	}

	@GetMapping("/{id}")
	public ResponseEntity<TradingVO> get(@PathVariable("id") String id) {
		return ResponseEntity.ok(TradingVO.toVO(dao.GET(id)));
	}

	@PostMapping
	public String add(@RequestBody TradingVO trading) {
		return dao.ADD(TradingVO.toPO(trading));
	}

	@PutMapping("/{TransNo}")
	public String update(@PathVariable("TransNo") String xTransNo, @RequestBody TradingVO trading) {
		return dao.UPDATE(TradingVO.toPO(trading));
	}

	@DeleteMapping("/{TransNo}")
	public String delete(@PathVariable("TransNo") String xTransNo) {
		return dao.DELETE(xTransNo);
	}
}
