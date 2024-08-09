package com.cathybk1;

import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

public class SongMap {

	public static void main(String[] args) {
		Map<String, String> map =new TreeMap<>();
		map.put("ColdPlay","Yellow");
		map.put("Adele","Skyfall");
		map.put("Lady Gaga","Shallow");
		for(Entry<String, String> entry: map.entrySet()) {
			System.out.println("Singer:"+entry.getKey()+",Song:"+entry.getValue());
		}
		System.out.println(map.keySet());
        System.out.println(map.values());
        

	}

}
