package com.libretaDigital.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {
	
	@RequestMapping(value = "/fileUpload", method= RequestMethod.GET)
	public ModelAndView FileUpload(){
		ModelAndView page =  new ModelAndView("fileUpload");
		page.addObject("tituloPagina", "Libreta Digital - Carga de Datos Masiva");
		page.addObject("codMenu", "D1");
		return page;
	}
	
	
	@RequestMapping(value = "api/upload", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)   
    public ResponseEntity<Void> handleFileUpload2(@RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                Long fileLength = file.getSize();
//                String contentType = file.getContentType();
                String originalFileName = file.getOriginalFilename();
                String originalFileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
//                String newFilename = UUID.randomUUID().toString() + originalFileExtension;
//                //transfer to upload folder
//                String storageDirectory = environment.getProperty("applicationStorage.uploadFolder", "/Users/weibo/uploads-def");
//                File newFile = new File(storageDirectory + "/" + newFilename);
//                file.transferTo(newFile);
//                return ResponseEntity.ok().build();
                System.out.println("------------------------------------------------");
                System.out.println("------------------------------------------------");
                System.out.println("------------------------------------------------");
                System.out.println("--- " + originalFileName + " ----");
                return ResponseEntity.ok().build();
            } catch (Exception e) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
        } else {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        }
    }
	
}
