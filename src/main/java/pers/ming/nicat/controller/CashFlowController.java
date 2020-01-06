package pers.ming.nicat.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import pers.ming.nicat.dao.impl.AccountDaoImpl;

@RestController
@CrossOrigin
@RequestMapping("/api/ApiCashFlow")
public class CashFlowController {

	@Autowired
	private AccountDaoImpl dao;

	@PostMapping("DoAccound")
	public ResponseEntity<String> DoAccount(
			@RequestParam("xExeDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date tradeDate) {
		return ResponseEntity.ok(dao.ACCOUNT(tradeDate));
	}

	@PostMapping("DoUnAccound")
	public ResponseEntity<String> DoUnAccount(
			@RequestParam("xExeDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date tradeDate) {
		return ResponseEntity.ok(dao.UNACCOUNT(tradeDate));
	}
}
