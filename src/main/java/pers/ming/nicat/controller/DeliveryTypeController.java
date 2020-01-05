package pers.ming.nicat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pers.ming.nicat.dao.impl.DeliveryTypeDaoImpl;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.DeliveryTypeVO;

@RestController
@CrossOrigin
@RequestMapping("/api/ApiDeliveryTypes")
public class DeliveryTypeController {
	@Autowired
	private DeliveryTypeDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<DeliveryTypeVO>> list() {
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST().stream().map(po -> DeliveryTypeVO.toVO(po))));
	}

	@GetMapping("/{id}")
	public ResponseEntity<DeliveryTypeVO> get(@PathVariable("id") String id) {
		return ResponseEntity.ok(DeliveryTypeVO.toVO(dao.GET(id)));
	}

	@PostMapping
	public String add(@RequestBody DeliveryTypeVO deliveryType) {
		return dao.ADD(DeliveryTypeVO.toPO(deliveryType));
	}

	@PutMapping("/{id}")
	public String update(@PathVariable("id") String id, @RequestBody DeliveryTypeVO deliveryType) {
		return dao.UPDATE(DeliveryTypeVO.toPO(deliveryType));
	}

	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") String id) {
		return dao.DELETE(id);
	}
}
