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

import pers.ming.nicat.dao.bean.OrderQueryModel;
import pers.ming.nicat.dao.impl.OrderDaoImpl;
import pers.ming.nicat.po.OrderPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.OrderVO;

@RestController
@CrossOrigin
@RequestMapping("api/ApiOrders")
public class OrderController {

	@Autowired
	private OrderDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<OrderVO>> list(
			@RequestParam("StartDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xStartDate,
			@RequestParam("EndDate") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date xEndDate,
			@RequestParam("CommodityID") String xCommodityID, @RequestParam("ReceiptNo") String xReceiptNo) {
		OrderQueryModel filter = new OrderQueryModel();
		filter.setTradeDate_S(xStartDate);
		filter.setTradeDate_E(xEndDate);
		filter.setCommodityID(xCommodityID);
		filter.setReceiptNo(xReceiptNo);
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST(filter).stream().map(po -> OrderVO.toVO(po))));
	}

	@GetMapping("HavingReceipt")
	public ResponseEntity<ArrayList<OrderVO>> list(@RequestParam("ReceiptNo") String xReceiptNo) {
		OrderQueryModel filter = new OrderQueryModel();
		filter.setTradeDate_S(null);
		filter.setTradeDate_E(null);
		filter.setCommodityID(null);
		filter.setReceiptNo(xReceiptNo);
		ArrayList<OrderPO> result = dao.LIST(filter);
		if (result == null)
			return ResponseEntity.ok(new ArrayList<OrderVO>());

		return ResponseEntity.ok(ListUtil.ToArrayList(result.stream().map(po -> OrderVO.toVO(po))));
	}

	@GetMapping("GetUnPaid")
	public ResponseEntity<ArrayList<OrderVO>> unPaid() {
//		OrderQueryModel filter = new OrderQueryModel();
//		filter.setIsPaid(false);
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.UNPAID().stream().map(po -> OrderVO.toVO(po))));
	}

	@GetMapping("GetUnPurchase")
	public ResponseEntity<ArrayList<OrderVO>> unPurchase() {
//		OrderQueryModel filter = new OrderQueryModel();
//		filter.setIsPaid(true);
//		filter.setIsPurchased(false);
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.UNPURCHASE().stream().map(po -> OrderVO.toVO(po))));
	}

	@GetMapping("/{TransNo}")
	public ResponseEntity<OrderVO> get(@PathVariable("TransNo") String xTransNo) {
		return ResponseEntity.ok(OrderVO.toVO(dao.GET(xTransNo)));
	}

	@PostMapping
	public String add(@RequestBody OrderVO order) {
		return dao.ADD(OrderVO.toPO(order));
	}

	@PutMapping("/{TransNo}")
	public String update(@PathVariable("TransNo") String xTransNo, @RequestBody OrderVO order) {
		return dao.UPDATE(OrderVO.toPO(order));
	}

	@DeleteMapping("/{TransNo}")
	public String delete(@PathVariable("TransNo") String xTransNo) {
		return dao.DELETE(xTransNo);
	}
}
