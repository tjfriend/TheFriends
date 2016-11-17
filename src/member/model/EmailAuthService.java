package member.model;

import java.util.*;

import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;

@Component
public class EmailAuthService {
	@Autowired
	JavaMailSender jms;
	
	public boolean sendEmail(String id, String email, String email2, String name, String birth, String phone, String nickname, HttpSession session){
		try{
			MimeMessage message = jms.createMimeMessage();
			String ranKey = UUID.randomUUID().toString().substring(0, 8);
			message.setRecipient(RecipientType.TO, new InternetAddress(email+"@"+email2));
			message.setSubject("The Friends 이메일 인증메일입니다.");
			String text = "<h3>이메일 인증 메일</h3>";
			text += "이메일 인증을 하려면 아래 링크를 연결해주세요.<br/>";
			text += "<input type='text' value="+ranKey+" readonly='readonly'/><br/>";
			text += "<i><a href='http://127.0.0.1/joinAuth/"+id+"/"+email+"/"+email2+"/"+name+"/"+birth+"/"+phone+"/"+nickname+"/"+ranKey+"'>인증하러가기</a></i>";
			message.setText(text, "utf-8", "html");
			jms.send(message);
			
			session.setAttribute("ranKey", ranKey);
			
			return true;
		} catch(Exception e){
			System.out.println(e);
			return false;
		}
	}
}
