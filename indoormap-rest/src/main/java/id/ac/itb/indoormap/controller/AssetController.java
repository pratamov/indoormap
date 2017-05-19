package id.ac.itb.indoormap.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/assets")
public class AssetController {

	@Value("${indoormap.assets.maps}")
	private String mapsDirectory;
	
	@RequestMapping(value="/{denah_file:.+}", method = RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
	byte[] getDenah(@PathVariable String denah_file){
		
	    File file = new File(mapsDirectory + denah_file);
	    InputStream fis;
		try {
			fis = new FileInputStream(file);
			return IOUtils.toByteArray(fis);
		} catch (FileNotFoundException e) {
			System.out.println(file.getAbsolutePath() + " : " + e.getMessage());
			return null;
		} catch (IOException e) {
			System.out.println(file.getAbsolutePath() + " : " + e.getMessage());
			return null;
		}
	}
	
	
}
