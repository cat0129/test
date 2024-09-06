package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Test;

@Mapper
public interface TestMapper {
	
	Test searchItem(HashMap<String,Object> map);
	
	void updatePrice(HashMap<String,Object> map);
	
	void deleteItem(HashMap<String,Object> map);
	
	void insertItem(HashMap<String,Object> map);
	
	int duplicate(HashMap<String,Object> map);
	
}
