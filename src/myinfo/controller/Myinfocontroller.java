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
			mav.addObject("info", list.get(0));
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
	
	// 정보수정
	@RequestMapping("/changeoff")
	public ModelAndView openoff(HttpSession session,String birth,String email,String email2, String add01,String add02,String Eamiloff,String addressoff,String birthoff){
		String id = (String) session.getAttribute("id");
		System.out.println("컨트 id: "+id+"//birth//"+birth+"//ema//"+email+"//ema2//"+email2+"//add//"
		+add01+"..qwr,,"+add02+"//eaof//"+Eamiloff+"//adof//"+addressoff+"//birof//"+birthoff);
		int r = cf.changemyinfo(id, birth, email, email2, add01,add02, Eamiloff, addressoff, birthoff);
		System.out.println("컨트 r : "+r);
		ModelAndView mav = new ModelAndView();
		mav.addObject("myinfo",r);
		mav.setViewName("/myinfo/Myinformation.jsp");
//		mav.setViewName("/myinfo/Passcertification.jsp");
		System.out.println("mav : " +mav);
		return mav;
		
	}
}
