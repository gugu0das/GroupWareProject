package com.ware.group.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class MemberVO {

	private String id;
	private Long memberNum;
	private Long jobId;
	private String password;
	private String name;
	private Date birthDate;
	private String email;
	private String phone;
	private String address;
	private Date regDate;
	private Date updateDate;
	private Date hireDate;
	private Date endDate;
	private boolean status;
	private Long deptNum;
	
}
