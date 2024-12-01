package com.helperclasses;

import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	private MultipartFile file;

	
	public FileUpload(MultipartFile file) {
		super();
		this.file = file;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
		
	public boolean saveFile(String path) {
		try {
			byte data[] = file.getBytes();
			/* System.out.println(path); */
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
		
	
}
