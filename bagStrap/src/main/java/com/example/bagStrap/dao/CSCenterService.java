package com.example.bagStrap.dao;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface CSCenterService {
	HashMap<String, Object> searchCS (HashMap<String, Object> map);
}
