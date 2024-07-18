package com.project1.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String path) {
        boolean result = false;
        try {
            File file = new File(path);
            result=file.delete();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public static boolean saveFile(InputStream inputStream, String path){
        boolean result = false;
        try{
            byte filearr[]= new byte[inputStream.available()];
            inputStream.read(filearr);
            FileOutputStream outputStream =new FileOutputStream(path);
            outputStream.write(filearr);
            outputStream.flush();
            outputStream.close();
            result=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    
    }
}
