package com.ware.group.department;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentDAO departmentDAO;


	public List<DepartmentVO> getDepartmentList()throws Exception{
		return departmentDAO.getDepartmentList();

	}
	public int setDepartmentAdd(DepartmentVO departmentVO)throws Exception{
		return departmentDAO.setDepartmentAdd(departmentVO);

	}
	public int setDepartmentDelete(DepartmentVO departmentVO)throws Exception{

		int result =departmentDAO.setDepartmentDelete(departmentVO);
		if(result>0) {
			List<DepartmentVO> ar= departmentDAO.getDepartmentChildId(departmentVO);
			for(DepartmentVO vo : ar) {
				result = this.setDepartmentDelete(vo);//null이면 0이뜨기때문에 강제종료
			}
		}

		return result;
	}
	public int setDepartmentUpdate(DepartmentVO departmentVO)throws Exception{
		int result = departmentDAO.setDepartmentUpdate(departmentVO);
		return result;
	}
	
	public DepartmentVO getDepartmentDetail(DepartmentVO departmentVO)throws Exception{
		return departmentDAO.getDepartmentDetail(departmentVO);

	}

	public List<DepartmentVO> getDepartmentTreeList(DepartmentVO departmentVO)throws Exception{
		if(departmentVO.getLevel()==null) {
			departmentVO.setLevel(0L);
		}
		departmentVO.setDepartmentVOs(departmentDAO.getDeparmentTree(departmentVO));
		for(DepartmentVO tree:departmentVO.getDepartmentVOs()) {
			if(tree!=null) {
				tree.setLevel(tree.getLevel()+1);
				this.getDepartmentTreeList(tree);
			}
		}
		
		return departmentVO.getDepartmentVOs();

	}
	
}
