package com.ware.group.schedule;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ware.group.common.Util4calen;
import com.ware.group.etc.EtcService;
import com.ware.group.member.MemberVO;

@Controller
@RequestMapping("/schedule/*")
public class ScheController {

    @Autowired
    private ScheService scheSvc;

    static final Logger LOGGER = LoggerFactory.getLogger(ScheController.class);

    @GetMapping("/scheList")
    public ModelAndView scheList(HttpServletRequest request, MonthVO searchVO) {
        ModelAndView modelAndView = new ModelAndView("schedule/scheList");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            LOGGER.error("인증 값 null");
            return modelAndView;
        }

        Object principal = authentication.getPrincipal();
        String userId = null;

        if (principal instanceof MemberVO) {
            MemberVO member = (MemberVO) principal;
            userId = String.valueOf(member.getId());
        } else {
            LOGGER.error("MemberVO 보안 에러.");
            return modelAndView;
        }

        if (searchVO == null) {
            LOGGER.error("searchVO null");
        } else {
            if (searchVO.getYear() == null || "".equals(searchVO.getYear())) {
                Date today = Util4calen.getToday();
                searchVO.setYear(Util4calen.getYear(today).toString());
                searchVO.setMonth(Util4calen.getMonth(today).toString());
            }
        }

        Integer dayofweek = Util4calen.getDayOfWeek(Util4calen.str2Date(searchVO.getYear() + "-" + searchVO.getMonth() + "-01"));

        List<?> listview = scheSvc.selectCalendar(searchVO, userId);
        if (listview == null) {
        	LOGGER.error("리스트 뷰 null.");
        }

        modelAndView.addObject("listview", listview);
        modelAndView.addObject("searchVO", searchVO);
        modelAndView.addObject("dayofweek", dayofweek);

        return modelAndView;
    }

    @GetMapping("/scheForm")
    public ModelAndView scheForm(HttpServletRequest request, ScheVO scheInfo) {
        ModelAndView modelAndView = new ModelAndView("schedule/scheForm");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
        	LOGGER.error("인증 값 null");
            return modelAndView;
        }

        Object principal = authentication.getPrincipal();
        String userId = null;

        if (principal instanceof MemberVO) {
            MemberVO member = (MemberVO) principal;
            userId = String.valueOf(member.getId());

        } else {
            LOGGER.error("MemberVO 보안 에러");
            return modelAndView;
        }

        if (scheInfo.getId() != null) {
            scheInfo = scheSvc.selectScheOne(scheInfo);
        } else {
            scheInfo.setType(1);
            scheInfo.setIsopen(1);

            String calendardate = request.getParameter("calendardate");
            if (calendardate == null || "".equals(calendardate)) {
                calendardate = Util4calen.date2Str(Util4calen.getToday());
            }
            scheInfo.setStartdate(calendardate);
            scheInfo.setStarthour("09");
            scheInfo.setEnddate(calendardate);
            scheInfo.setEndhour("18");
        }

        modelAndView.addObject("scheInfo", scheInfo);

        return modelAndView;
    }

    @PostMapping("/scheSave")
    public ModelAndView scheSave(HttpServletRequest request, ScheVO scheInfo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            LOGGER.error("인증 값 Null.");
            return new ModelAndView("redirect:/schedule/scheList");
        }

        Object principal = authentication.getPrincipal();
        String userId = null;
        
        if (principal instanceof MemberVO) {
            MemberVO member = (MemberVO) principal;
            userId = String.valueOf(member.getId());
        } else {
            LOGGER.error("MemberVO 보안 에러.");
            return new ModelAndView("redirect:/schedule/scheList");
        }

        if (userId == null) {
            LOGGER.error("ID 에러.");
            return new ModelAndView("redirect:/schedule/scheList");
        }

        scheInfo.setUsernum(userId);
        scheSvc.insertSche(scheInfo);

        return new ModelAndView("redirect:/schedule/scheList");
    }

    @GetMapping("/scheRead4Ajax")
    public ModelAndView scheRead4Ajax(HttpServletRequest request, ScheVO scheVO, String calendar_date) {
        ModelAndView modelAndView = new ModelAndView("schedule/scheRead4Ajax");

        ScheVO scheInfo = scheSvc.selectScheOne4Read(scheVO);

        modelAndView.addObject("scheInfo", scheInfo);
        modelAndView.addObject("calendar_date", calendar_date);

        return modelAndView;
    }

    /**
     * 읽기.
     */
    @GetMapping("/scheRead")
    public ModelAndView scheRead(HttpServletRequest request, ScheVO scheVO) {
        ModelAndView modelAndView = new ModelAndView("schedule/scheRead");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            LOGGER.error("인증 값 null");
            return modelAndView;
        }

        ScheVO scheInfo = scheSvc.selectScheOne4Read(scheVO);

        modelAndView.addObject("scheInfo", scheInfo);

        return modelAndView;
    }

    @PostMapping("/scheDelete")
    public ModelAndView scheDelete(HttpServletRequest request, ScheVO scheVO) {

        scheSvc.deleteSche(scheVO);

        return new ModelAndView("redirect:/schedule/scheList");
    }
}
