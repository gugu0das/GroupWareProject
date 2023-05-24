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
	public DepartmentVO getDepartmentDetail(DepartmentVO departmentVO)throws Exception{
		return departmentDAO.getDepartmentDetail(departmentVO);

	}

	public List<DepartmentVO> getDepartmentTreeList()throws Exception{
		List<DepartmentVO> level0 = departmentDAO.getDepartmentLevel0();
		for(DepartmentVO l1:level0) {
			//			System.out.println("l1 : " + l1.getName());
			l1.setDepartmentVOs(departmentDAO.getDepartmentLevel1(l1));
			for(DepartmentVO l2 :l1.getDepartmentVOs() ) {
				//				System.out.println("l2 : " + l2.getName());
				l2.setDepartmentVOs(departmentDAO.getDepartmentLevel2(l2));
				for(DepartmentVO l3:l2.getDepartmentVOs()) {
					//					System.out.println("l3 : " + l3.getName());
					l3.setDepartmentVOs(departmentDAO.getDepartmentLevel3(l3));
					for(DepartmentVO l4:l3.getDepartmentVOs()) {
						//						System.out.println("l4 : " + l4.getName());
						l4.setDepartmentVOs(departmentDAO.getDepartmentLevel4(l4));
					}
				}
			}
		}


		return level0;

	}
}
