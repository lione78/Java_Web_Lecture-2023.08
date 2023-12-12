package com.human.sample.controller;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/file")
public class FileController {
	// jar파일 생성시 다른 곳 일일이 바꿔줘야함
	// @Value이용시 application.properites에서만 변경하면 스프링에서 injection 해줌
	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	@GetMapping("/formUpload")
	public String formUpload() {
		return "file/form";
	}
	
	@PostMapping("/formUpload")
	// jsp의 name과 이름이 같으면 그냥 받을 수 있음
	public String formProc(String title, MultipartFile file, Model model) {
		model.addAttribute("title", title);
		String filename = file.getOriginalFilename();
		model.addAttribute("filename", filename);
		String path = uploadDir + "sample/" + filename;
		try {
			file.transferTo(new File(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "file/formRes";
	}
	
	@GetMapping("/download/{filename}")
	public ResponseEntity<Resource> fileDownload(@PathVariable String filename){
		String pathStr = uploadDir + "sample/" + filename;
		Path path = Paths.get(pathStr);
		try {
			// http에서 F12 network 확인시 파일 받는 것을 정의함.
			String contentType = Files.probeContentType(path);
			
			// header setting
			HttpHeaders header = new HttpHeaders();
			header.setContentDisposition(
					ContentDisposition.builder("attatchment")
					.filename(filename, StandardCharsets.UTF_8).build()
					);
			header.add(HttpHeaders.CONTENT_TYPE, contentType);
			Resource resource = new InputStreamResource(Files.newInputStream(path));  // 파일 resource 얻기
			return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/formUploadMultiple")
	public String formUploadMultiple() {
		return "file/formMultiple";
	}

	// MultipartHttpServletRequest는 param, session를 전부 받을 수 있음, servlet에서 다 받을 수 있음. 기본
	// HttpServletRequest 파일만 빼고 다 받을 수 있음
	@PostMapping("/formUploadMultiple")
	public String formUploadMultipleProc(MultipartHttpServletRequest req, Model model) {
		String title = req.getParameter("title");
		List<MultipartFile> multipartFileList = req.getFiles("files");
		List<String> fileList = new ArrayList<>();
		for (MultipartFile part: multipartFileList) {
			// 파일이 없을 경우 처리
			// if continue : for로 올라갔다 값이 없으면 빠져 나감
			if (part.getContentType().contains("octet-stream"))
				continue;
			String filename = part.getOriginalFilename();
			System.out.println("filename: " + filename);
			fileList.add(filename);
			String path = uploadDir + "sample/" + filename;
			try {
				part.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("title", title);
		model.addAttribute("fileList", fileList);
		return "file/formMultipleRes";
	}
	
	@GetMapping("/formAjax")
	public String formAjax() {
		return "file/formAjax";
	}
	
	@ResponseBody		// form이 없음, rendering 안하고 결과만 고대로 보내줌
	@PostMapping("/formAjax")
	public String formAjaxProc(String title, MultipartFile file) {
		String filename = file.getOriginalFilename();
		String path = uploadDir + "sample/" + filename;
		try {
			file.transferTo(new File(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject result = new JSONObject();
		result.put("title", title);
		result.put("filename", filename);
		// result : JSON "title" : title, "filename" : filename
		return result.toString();
	}
}
