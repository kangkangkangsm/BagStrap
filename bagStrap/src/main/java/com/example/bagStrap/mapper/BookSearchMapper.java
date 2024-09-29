package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;


@Mapper
public interface BookSearchMapper {
	void insertBooks(HashMap<String, Object> bookList);
	List<Item> selectCategory();
}
