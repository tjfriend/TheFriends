package member.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import member.model.*;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	LoginService ls;
	@Autowired
	JoinService js;
	@Autowired
	EmailAuthService eas;
	@Autowired
	AuthCheckService acs;
	
	@RequestMapping("/login")
	public ModelAndView login(String id, String password, String remember, HttpSession session, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView("t:index");
		List<HashMap> list = ls.Login(id, password);
		if(list.size()!=0){
			session.setAttribute("login", true);
			session.setAttribute("id", list.get(0).get("ID"));
			session.setAttribute("point", list.get(0).get("POINT"));
			if(remember != null){
				Cookie cookie = new Cookie("remember", id);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*30);
				resp.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("remember", id);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
		} else {
			mav.addObject("fail", "fail");
		}
		return mav;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session, @CookieValue(name="remember", required=false) String cooId){
		ModelAndView mav = new ModelAndView("t:index");
		session.removeAttribute("login");
		session.removeAttribute("id");
		session.removeAttribute("point");
		if(cooId != null){
			mav.addObject("remember", cooId);
		}
		return mav;
	}
	
	@RequestMapping("/join/{id}/{password}/{name}/{birth}/{phone}/{add01}/{add02}/{email}/{email2}/{nickname}/{key}/{recommender}")
	@ResponseBody
	public boolean join(@PathVariable(name="id")String id, @PathVariable(name="password")String password, @PathVariable(name="name")String name, 
											@PathVariable(name="birth")String birth, @PathVariable(name="phone")String phone, @PathVariable(name="add01")String add01,
											@PathVariable(name="add02")String add02, @PathVariable(name="email")String email, @PathVariable(name="email2")String email2,
											@PathVariable(name="recommender", required=false)String recommender, @PathVariable(name="nickname")String nickname, 
											@PathVariable(name="key")String key, HttpSession session){
		return js.join(id, password, name, birth, phone, add01, add02, email, email2, recommender, nickname, key, session);
	}
	
	@RequestMapping("/join/{id}/{password}/{name}/{birth}/{phone}/{add01}/{add02}/{email}/{email2}/{nickname}/{key}")
	@ResponseBody
	public boolean join2(@PathVariable(name="id")String id, @PathVariable(name="password")String password, @PathVariable(name="name")String name, 
											@PathVariable(name="birth")String birth, @PathVariable(name="phone")String phone, @PathVariable(name="add01")String add01,
											@PathVariable(name="add02")String add02, @PathVariable(name="email")String email, @PathVariable(name="email2")String email2,
											@PathVariable(name="nickname")String nickname, @PathVariable(name="key")String key, HttpSession session){
		return js.join(id, password, name, birth, phone, add01, add02, email, email2, "admin", nickname, key, session);
	}
	
	@RequestMapping("/idcheck/{id}")
	@ResponseBody
	public int idCheck(@PathVariable(name="id")String id){
		List list = js.idcheck(id);
		return list.size();
	}
	
	@RequestMapping("/emailAuth/{id}/{email}/{email2}/{name}/{birth}/{phone}/{nickname}")
	@ResponseBody
	public boolean emailAuth(@PathVariable(name="id")String id, @PathVariable(name="email")String email, @PathVariable(name="email2")String email2,
											@PathVariable(name="name")String name, @PathVariable(name="birth")String birth, @PathVariable(name="phone")String phone,
											@PathVariable(name="nickname")String nickname, HttpSession session){
		return eas.sendEmail(id, email, email2, name, birth, phone, nickname, session);
	}
	
	@RequestMapping("/authCheck/{id}/{key}")
	@ResponseBody
	public boolean authCheck(@PathVariable(name="id")String id, @PathVariable(name="key")String key){
		return acs.authCheck(id, key);
	}
}
