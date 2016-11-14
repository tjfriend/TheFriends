package charge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeService;

@Controller
@RequestMapping("/charge")
public class ChargeController {

	@Autowired
	ChargeService charge;
	
	// �����ϱ�
	@RequestMapping("/cash")
	public ModelAndView charge(HttpSession id, int point){
		ModelAndView ma = new ModelAndView("/menu/charge/chargerst.jsp");
		int a = charge.charge((String)id.getAttribute("id"), point);
		if(a==1){
			ma.addObject("y","charge");
		}
		return ma;
	}
	
	// ��������
	@RequestMapping("/chargeAll")
	public ModelAndView chargeAll(HttpSession id){
		ModelAndView ma = new ModelAndView("/menu/charge/chargeAll.jsp");
		List li = charge.chargeAll((String)id.getAttribute("id"));
		if(li!=null){
			ma.addObject("li",li);
		}else{
			ma.addObject("null","null");
		}
		return ma;
	}
	
	
}
