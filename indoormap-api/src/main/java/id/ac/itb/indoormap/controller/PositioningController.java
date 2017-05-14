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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import id.ac.itb.indoormap.model.PosisiInput;
import id.ac.itb.indoormap.model.PosisiOutput;

@RestController
@RequestMapping
public class PositioningController {

	@Value("${indoormap.assets.maps}")
	private String mapsDirectory;
	
	@RequestMapping(value="/denah/{denah_file}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	byte[] getDenah(@PathVariable String denah_file){
		
	    File file = new File(mapsDirectory + denah_file);
	    InputStream fis;
		try {
			fis = new FileInputStream(file);
			return IOUtils.toByteArray(fis);
		} catch (FileNotFoundException e) {
			return null;
		} catch (IOException e) {
			return null;
		}
	}
	
	@RequestMapping(value="/posisi", method = RequestMethod.GET)
	PosisiOutput getPosisi (@RequestBody PosisiInput posisiInput){
		/**
		 * input: user_id, user_password, ibeacons
		 * output: lokasi_id, lokasi_denah_url, lokasi_denah_lebar, lokasi_nama, lokasi_deskripsi, ruangs, koordinat
		 */
		return null;
	}
	
	
}