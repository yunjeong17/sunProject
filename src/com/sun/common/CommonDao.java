package com.sun.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class CommonDao {
	
	// query 파일 끌고오는거 귀찮으니까 한번에.... 처리합시다... ㅎㅎ
	public Properties propLoad(String name, String fileName) {
		Properties prop = new Properties();

		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prop;
	}
}
