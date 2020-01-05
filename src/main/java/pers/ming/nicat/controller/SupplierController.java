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

import pers.ming.nicat.dao.impl.SupplierDaoImpl;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.SupplierVO;

@RestController
@CrossOrigin
@RequestMapping("api/ApiSuppliers")
public class SupplierController {

	@Autowired
	private SupplierDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<SupplierVO>> list() {
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST().stream().map(po -> SupplierVO.toVO(po))));
	}

	@GetMapping("/{id}")
	public ResponseEntity<SupplierVO> get(@PathVariable("id") String id) {
		return ResponseEntity.ok(SupplierVO.toVO(dao.GET(id)));
	}

	@PostMapping
	public String add(@RequestBody SupplierVO supplier) {
		return dao.ADD(SupplierVO.toPO(supplier));
	}

	@PutMapping("/{id}")
	public String update(@PathVariable("id") String id, @RequestBody SupplierVO supplier) {
		return dao.UPDATE(SupplierVO.toPO(supplier));
	}

	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") String id) {
		return dao.DELETE(id);
	}
}
