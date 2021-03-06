package com.spring.FitInZip.back.member.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class MemberVO {

	private String id;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String post;
	private String addr;
	private String detailAddr;
	private String extraAddr;
	private String gender;
	private String birth;
	private String memOriName;
	private String memFileName;
	private String role;
	private String withdrawal;
	private Date joinDate;
	
	/*파일이름*/
	private String profileImgOriginName;
	private String profileImgFileName;
	
	
}
