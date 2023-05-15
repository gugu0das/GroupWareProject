package com.ware.group.member;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class MemberVO {

	@NotBlank
	private Long id;
	@NotBlank
	private Long employeeId;
	
	private String accountId;
	@NotBlank
	private Long jobId;
	@NotBlank
	private String password;
	
	private String name;
	@NotBlank
	private Date birthDate;
	
	private String email;
	
	private String phone;
	
	private String address;
	@NotBlank
	private Date regDate;
	
	
	private Date updateDate;
	private Date hireDate;
	private Date endDate;
	private boolean status;
	@NotBlank
	private Long deptNum;
	
	
	


}
