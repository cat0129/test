package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.TestMapper;
import com.example.test1.model.Test;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestMapper testMapper;

	@Override
	public Test searchItem(HashMap<String, Object> map) {
		Test searchItem = testMapper.searchItem(map);
		return searchItem;
	}

	@Override
	public void updatePrice(HashMap<String, Object> map) {
		testMapper.updatePrice(map);

	}

	@Override
	public void deleteItem(HashMap<String, Object> map) {
		testMapper.deleteItem(map);
		
	}

}
