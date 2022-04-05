package com.elcar.driver;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.elcar.dto.Driver;

@Controller
public class DriverController {

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext servletContext;

	@Autowired
	DriverService driverserv;

	// 드라이버 신청 등록하기
	@PostMapping(value = "/driver-regist")
	public String driverregist(@ModelAttribute Driver driver, Model model, @RequestParam("file") MultipartFile file) {
		System.out.println(file);
		try {
			model.addAttribute("id", session.getAttribute("id"));
			if (file.isEmpty()) {
				System.out.println("이미지를 등록해 주세요");
			} else {
				String path = servletContext.getRealPath("/upload/");
				File destFile = new File(path + file.getOriginalFilename());
				driver.setImg(file.getOriginalFilename());
				file.transferTo(destFile);
				driverserv.driverregist(driver);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "about/driver-regist";
	}
}