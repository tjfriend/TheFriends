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
			message.setSubject("The Friends �̸��� ���������Դϴ�.");
			String text = "<h3>�̸��� ���� ����</h3>";
			text += "�̸��� ������ �Ϸ��� �Ʒ� ��ũ�� �������ּ���.<br/>";
			text += "<input type='text' value="+ranKey+" readonly='readonly'/><br/>";
			text += "<i><a href='http://59.13.208.135/joinAuth/"+id+"/"+email+"/"+email2+"/"+name+"/"+birth+"/"+phone+"/"+nickname+"/"+ranKey+"'>�����Ϸ�����</a></i>";
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
