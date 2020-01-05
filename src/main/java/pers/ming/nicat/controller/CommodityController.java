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

import pers.ming.nicat.dao.impl.CommodityDaoImpl;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.CommodityVO;

@RestController
@CrossOrigin
@RequestMapping("api/ApiCommodities")
public class CommodityController {

	@Autowired
	private CommodityDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<CommodityVO>> list() {
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST().stream().map(po -> CommodityVO.toVO(po))));
	}

	@GetMapping("/{id}")
	public ResponseEntity<CommodityVO> get(@PathVariable("id") String id) {
		return ResponseEntity.ok(CommodityVO.toVO(dao.GET(id)));
	}

	@PostMapping
	public String add(@RequestBody CommodityVO commodity) {
		return dao.ADD(CommodityVO.toPO(commodity));
	}

	@PutMapping("/{id}")
	public String update(@PathVariable("id") String id, @RequestBody CommodityVO commodity) {
		return dao.UPDATE(CommodityVO.toPO(commodity));
	}

	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") String id) {
		return dao.DELETE(id);
	}
}
