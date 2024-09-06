package com.example.test1.dao;

import java.util.HashMap;

import com.example.test1.model.Test;

public interface TestService {
	
	HashMap<String,Object> searchItem(HashMap<String,Object> map);
	
	HashMap<String,Object> updatePrice(HashMap<String,Object> map);
	
	HashMap<String,Object> deleteItem(HashMap<String,Object> map);
	
	HashMap<String,Object> insertItem(HashMap<String,Object> map);
	
	HashMap<String,Object> duplicate(HashMap<String,Object> map);
	
}
