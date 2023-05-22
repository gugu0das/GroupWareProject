package com.ware.group.member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.ware.group.department.DepartmentVO;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class MemberVO implements UserDetails{

	
	private Long id;
	private Long employeeId;	
	@NotBlank
	private String accountId;
	@NotNull
	private Long jobId;
	@NotBlank
	private String password;
	private String passwordCheck;
	@NotBlank
	private String name;
	@NotNull
	private Date birthDate;
	@NotBlank
	@Email
	private String email;
	@NotBlank
	private String phone;
	@NotBlank
	private String address;
	
	private Date regDate;
	private Date updateDate;
	@NotNull
	private Date hireDate;
	private Date endDate;
	
	private boolean status;
	@NotNull
	private Long departmentId;
	
	private JobVO jobVO;
	private DepartmentVO departmentVO;
	
	private List<RoleVO> roleVOs;

	

	public Long getEmployeeId() {
		if(this.employeeId==null||this.employeeId==0) {
			return Long.parseLong(this.accountId);
		}
		return employeeId;
	}

	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleVO roleVO:this.roleVOs) {
			authorities.add(new SimpleGrantedAuthority(roleVO.getName()));
		}
		//Member권한 주기  [-> security config에서 권한 검증하기 위해
//		antmatchers
		return authorities;
	}

	
	
	
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		// 계정의 만료 여부
		// true : 만료 안됨
		// false : 만료 됨, 로그인 안됨
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		// 계정 잠김 여부
		// true : 잠기지 않음
		// false : 잠김, 로그인 안됨
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		// password 만료 여부
		// true : 만료 안됨
		// false : 만료 됨, 로그인 안됨
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		// 계정 사용 여부
		// true : 계정 활성화
		// false : 계정 비활성화, 로그인 안됨
		return this.status;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	


}
