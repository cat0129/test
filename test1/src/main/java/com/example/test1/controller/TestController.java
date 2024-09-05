package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.TestService;
import com.example.test1.model.Test;
import com.google.gson.Gson;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;
	
	@RequestMapping("/test.do") 
    public String main(Model model) throws Exception{

        return "/test-list";
    }
	
	@RequestMapping(value = "/test.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("searchItem", testService.searchItem(map));
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updatePrice(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		testService.updatePrice(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		testService.deleteItem(map);
		return new Gson().toJson(resultMap);
	}
	
}


