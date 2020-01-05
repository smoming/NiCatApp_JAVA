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

import pers.ming.nicat.dao.impl.NationDaoImpl;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.vo.NationVO;

@RestController
@CrossOrigin
@RequestMapping("/api/ApiNation")
public class NationController {

	@Autowired
	private NationDaoImpl dao;

	@GetMapping
	public ResponseEntity<ArrayList<NationVO>> list() {
		return ResponseEntity.ok(ListUtil.ToArrayList(dao.LIST().stream().map(po -> NationVO.toVO(po))));
	}

	@GetMapping("/{id}")
	public ResponseEntity<NationVO> get(@PathVariable("id") String id) {
		return ResponseEntity.ok(NationVO.toVO(dao.GET(id)));
	}

	@PostMapping
	public String add(@RequestBody NationVO nation) {
		return dao.ADD(NationVO.toPO(nation));
	}

	@PutMapping("/{id}")
	public String update(@PathVariable("id") String id, @RequestBody NationVO nation) {
		return dao.UPDATE(NationVO.toPO(nation));
	}

	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") String id) {
		return dao.DELETE(id);
	}
}
