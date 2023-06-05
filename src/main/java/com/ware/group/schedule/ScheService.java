package com.ware.group.schedule;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.ware.group.common.Field3VO;
import com.ware.group.common.SearchVO;
import com.ware.group.common.Util4calen;

@Service
public class ScheService {

    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;

    static final Logger LOGGER = LoggerFactory.getLogger(ScheService.class);
    
    public List<?> selectCalendar(MonthVO param, Long userId) {
    	List<?> list = sqlSession.selectList("selectCalendar", param);
        
    	Field3VO fld = new Field3VO();
    	fld.setField1(userId);
    	for (int i=0; i<list.size(); i++){
    		CalendarVO cvo = (CalendarVO) list.get(i);
    		fld.setField2(cvo.getCalendar_date());
    		cvo.setList( sqlSession.selectList("selectScheList4Calen", fld) );
    	}
        return list;
    }
     
    /** 
     * 리스트.
     */
    public Integer selectScheCount(SearchVO param) {
        return sqlSession.selectOne("selectScheCount", param);
    }
    
    public List<?> selectScheList(SearchVO param) {
        return sqlSession.selectList("selectScheList", param);
    }
    
    /**
     * 저장.
     */
    public void insertSche(ScheVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            if (param.getId() == null || "".equals(param.getId())) {
                sqlSession.insert("insertSche", param);
            } else {
                sqlSession.update("updateSche", param);
            }

            sqlSession.insert("deleteScheDetail", param.getId());

            ScheDetailVO param2 = new ScheDetailVO();
            param2.setId(param.getId());
            param2.setHour(param.getStarthour());
            param2.setMinute(param.getStartminute());

            Integer inx = 1;
            Date sdate = Util4calen.str2Date(param.getStartdate());
            if ("1".equals(param.getRepeattype())) { //반복없음
                Date edate = Util4calen.str2Date(param.getEnddate());
                while (!sdate.after(edate)) {
                    param2.setSeq(inx++);
                    param2.setDate(Util4calen.date2Str(sdate));
                    sqlSession.insert("insertScheDetail", param2);
                    sdate = Util4calen.dateAdd(sdate, 1);
                }
            } else if ("2".equals(param.getRepeattype())) { //주간반복
                Date edate = Util4calen.str2Date(param.getRepeatend());

                Integer dayofweek = Integer.parseInt(param.getRepeatoption());
                while (!sdate.after(edate)) {
                    if (Util4calen.getDayOfWeek(sdate) == dayofweek) break;
                    sdate = Util4calen.dateAdd(sdate, 1);
                }
                while (!sdate.after(edate)) {
                    param2.setSeq(inx++);
                    param2.setDate(Util4calen.date2Str(sdate));
                    sqlSession.insert("insertScheDetail", param2);
                    sdate = Util4calen.dateAdd(sdate, 7);
                }
            } else if ("3".equals(param.getRepeattype())) { //월간반복
                Date edate = Util4calen.str2Date(param.getRepeatend());

                Integer iYear = Util4calen.getYear(sdate);
                Integer iMonth = Util4calen.getMonth(sdate);
                String sday = param.getRepeatoption();

                Date ndate = Util4calen.str2Date(iYear + "-" + iMonth + "-" + sday);
                if (sdate.after(ndate))
                    sdate = Util4calen.str2Date(String.format("%s-%s-%s", iYear, ++iMonth, sday));
                else sdate = ndate;

                while (!sdate.after(edate)) {
                    param2.setSeq(inx++);
                    param2.setDate(Util4calen.date2Str(sdate));
                    sqlSession.insert("insertScheDetail", param2);
                    sdate = Util4calen.str2Date(String.format("%s-%s-%s", iYear, ++iMonth, sday));
                }
            }

            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("insertSche");
        }
    }

    /**
     * 읽기.
     */
    public ScheVO selectScheOne(ScheVO param) {
        return sqlSession.selectOne("selectScheOne", param);
    }
    
    public ScheVO selectScheOne4Read(ScheVO param) {
        return sqlSession.selectOne("selectScheOne4Read", param);
    }
    /**
     * 삭제.
     */
    public void deleteSche(ScheVO param) {
        sqlSession.update("deleteSche", param);
    }
}
