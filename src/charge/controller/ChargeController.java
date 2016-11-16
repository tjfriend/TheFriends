package charge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeService;
import charge.model.ChargeUseService;

@Controller
@RequestMapping("/charge")
public class ChargeController {

	@Autowired
	ChargeService charge;
	@Autowired
	ChargeUseService use;
	
	// �����ϱ�
	@RequestMapping("/cash")
	@ResponseBody
	public boolean charge(HttpSession id, String take, String point){
		int p = Integer.parseInt(point.substring(0, point.lastIndexOf("��")));
		int a = 0;
		if(take.equals("������")){
			a = charge.charge((String)id.getAttribute("id"), p);
		}else{
			a = use.gift((String)id.getAttribute("id"), take, p);
		}
		if(a==1){
			return true;
		}
		return false;
	}
	
	// ��������
	@RequestMapping("/chargeAll")
	public ModelAndView chargeAll(HttpSession id){
		ModelAndView ma = new ModelAndView("t:menu/charge/chargeAll");
		List li = charge.chargeAll((String)id.getAttribute("id"));
		if(li!=null){
			ma.addObject("li",li);
		}else{
			ma.addObject("null","null");
		}
		return ma;
	}
	
	
}
