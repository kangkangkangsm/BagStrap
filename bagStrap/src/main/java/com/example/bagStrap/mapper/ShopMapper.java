package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;


@Mapper
public interface ShopMapper {
	List<Item> searchItem(HashMap<String, Object> map);
	List<Item> searchCodes(HashMap<String, Object> map);
}
