package myinfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import java.util.*;
import myinfo.model.Confirm;

@Controller
@RequestMapping("/myinfo")
public class Myinfocontroller {
	@Autowired
	Confirm cf;

	@RequestMapping("/Passcertification")
	public ModelAndView certification() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myinfo/Passcertification.jsp");
		return mav;
	}

	@RequestMapping("/PassConfirm")
	public ModelAndView PassConfirm(HttpSession session, String pass) {
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		List list = cf.PassConfirm(id, pass);

		if (list.isEmpty()) {
			mav.setViewName("/myinfo/Passcertification.jsp");
		} else {
			mav.setViewName("/myinfo/Myinformation.jsp");
			mav.addObject("confirm", list);
		}

		return mav;
	}

	@RequestMapping("/myinfodelete")
	public ModelAndView myinfodelete(HttpSession session) {
		String id = (String) session.getAttribute("id");

		ModelAndView mav = new ModelAndView();
		int de = cf.Myinfodelete(id);
		mav.setViewName("t:index");
		return mav;
	}

	@RequestMapping("/Passchange")
	public ModelAndView changepassword(String pass, HttpSession session) {

		String id = (String) session.getAttribute("id");
		int r = cf.chagepass(id, pass);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myinfo/Passcertification.jsp");

		return mav;
	}
}
