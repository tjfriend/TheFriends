package myinfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;
import myinfo.model.Confirm;

@Controller
@RequestMapping("/myinfo")
public class Myinfocontroller {
	@Autowired
	Confirm cf;

	@RequestMapping("/Passcertification")
	public ModelAndView certification (){
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/myinfo/Passcertification.jsp");
		return mav;
	}
	@RequestMapping("/PassConfirm")
	public ModelAndView PassConfirm(HttpSession session,String pass){
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		List list = cf.PassConfirm(id, pass); 
			mav.addObject("confirm",list);
			if(list != null){
			mav.setViewName("/myinfo/Myinformation.jsp");
			}else{
			mav.setViewName("myinfo/Passcertification.jsp");
			}
			return mav;
			}
}
