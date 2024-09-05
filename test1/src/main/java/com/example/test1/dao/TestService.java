package com.example.test1.dao;

import java.util.HashMap;

import com.example.test1.model.Test;

public interface TestService {
	
	Test searchItem(HashMap<String,Object> map);
	
	void updatePrice(HashMap<String,Object> map);
	
	void deleteItem(HashMap<String,Object> map);
	
}
