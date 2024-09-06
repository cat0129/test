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
	public HashMap<String,Object> searchItem(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		try {
			Test searchItem = testMapper.searchItem(map);
			resultMap.put("searchItem", searchItem);
			System.out.println(searchItem);
			if(searchItem==null) {
				resultMap.put("result", "nonExist");
			}	
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String,Object> updatePrice(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		try {
			testMapper.updatePrice(map);
			resultMap.put("result", "success");
			System.out.println(resultMap);
		}catch(Exception e) {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String,Object> deleteItem(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		try {
			testMapper.deleteItem(map);
			resultMap.put("result", "success");
		}catch(Exception e){
			resultMap.put("result", "fail");
		}
		return resultMap;	
	}

	@Override
	public HashMap<String, Object> insertItem(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		try {
			testMapper.insertItem(map);
			resultMap.put("result", "success");
		}catch(Exception e) {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	//중복체크
	@Override
	public HashMap<String, Object> duplicate(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		try {
			int cnt = testMapper.duplicate(map);
			System.out.println(cnt);
			if(cnt==0) {
			resultMap.put("result", "success");
			}else {
				resultMap.put("result", "alreadyExist");
			}
		}catch(Exception e) {
			resultMap.put("result", "fail");
		}
		return resultMap;
	
	}

}
