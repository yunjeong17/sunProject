package com.sun.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHmmss");
		String currentTime = sdf.format(new Date());
		
		int random = (int)(Math.random()*90000)+10000;
		String ext="";
		
		int dot = originName.lastIndexOf(".");
		ext = originName.substring(dot);
		
		String fileName = currentTime+random+ext;
		File renameFile = new File(originFile.getParent(),fileName);

		
		return renameFile;
	}

}
