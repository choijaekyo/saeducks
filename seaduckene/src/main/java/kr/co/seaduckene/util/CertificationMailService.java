package kr.co.seaduckene.util;

import java.util.Random;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class CertificationMailService {
	
	@Autowired
	private JavaMailSender mailSender;
	private int authNum;
	private String tmpPw;
	
	// 메일 인증번호 만들기
	public void makeAuthNum() {
		Random random = new Random();
		authNum = random.nextInt(88888888)+11111111;
		System.out.println(authNum);
	}
	
	public String joinEmail(String email) {
		makeAuthNum(); 
		System.out.println("joinEmail: " + authNum);
		String setFrom = "s949794@naver.com"; // email-config에 설정한 발신용 이메일 주소
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해 주셔서 감사합니다." + 
						"<br><br>" +
						"인증 번호는 <strong> " + authNum + " </strong>입니다. <br>" + 
						"위 인증 번호를 인증번호 확인란에 기입해 주세요.";
		
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNum);
	}
	
	// 임시 비밀번호 만들기
	public void makeTmpPw() {
		UUID uuid = UUID.randomUUID();
		tmpPw = uuid.toString().substring(0,8);
		System.out.println(tmpPw);
	}

	public String sendTmpPw(String email) {
		makeTmpPw();
		System.out.println("임시비밀번호: " + tmpPw);
		String setFrom = "s949794@naver.com"; // email-config에 설정한 발신용 이메일 주소
		String toMail = email;
		String title = "임시 비밀번호 입니다.";
		String content = "<br><br>" +
						"임시 비밀번호는 <strong> " + tmpPw + " </strong>입니다. <br>" + 
						"위 비밀번호로 로그인 후 MyPage에서 꼭 비밀번호를 변경해 주세요.";
		
		mailSend(setFrom, toMail, title, content);
		
		return tmpPw;
	}

	private void mailSend(String setFrom, String toMail, String title, String content) {
			System.out.println("mailSend");
		try {
			MimeMessage message = mailSender.createMimeMessage();
			// 기타 설정을 담당할 MimeMessageHelper 객체를 생성
			// 생성자의 매개값으로 MimeMessage객체, boolean, 문자 인코딩 설정
			// true 매개값을 전달하면 MultPart 형식의 메세지 전달이 가능(첨부파일)
			// 값을 전달하지 않으면 단순 텍스트만 사용
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true -> html형식으로 전송, 매개값 안주면 단순 텍스트로 전달됨
			helper.setText(content,true);
			
			// 메일 전송
			mailSender.send(message);
			
			System.out.println("메일전송완료");
			
		} catch (MessagingException e) {
			System.out.println("널이뜬다~~~~");
			e.printStackTrace();
		}
	}
}
