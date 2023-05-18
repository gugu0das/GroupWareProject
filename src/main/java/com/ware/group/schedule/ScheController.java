package com.ware.group.schedule;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ware.group.common.Util4calen;
import com.ware.group.etc.EtcService;

@Controller
public class ScheController {

    @Autowired
    private ScheService scheSvc;

    @Autowired
    private EtcService etcSvc;

    static final Logger LOGGER = LoggerFactory.getLogger(ScheController.class);

    @RequestMapping(value = "/scheList")
    public ModelAndView scheList(HttpServletRequest request, MonthVO searchVO) {
        ModelAndView modelAndView = new ModelAndView("schedule/scheList");

        String usernum = request.getSession().getAttribute("usernum").toString();

        etcSvc.setCommonAttribute(usernum, modelAndView);

        if (searchVO.getYear() == null || "".equals(searchVO.getYear())) {
            Date today = Util4calen.getToday();
            searchVO.setYear(Util4calen.getYear(today).toString());
            searchVO.setMonth(Util4calen.getMonth(today).toString());
        }
        Integer dayofweek = Util4calen.getDayOfWeek(Util4calen.str2Date(searchVO.getYear() + "-" + searchVO.getMonth() + "-01"));

        List<?> listview = scheSvc.selectCalendar(searchVO, usernum);

        modelAndView.addObject("listview", listview);
        modelAndView.addObject("searchVO", searchVO);
        modelAndView.addObject("dayofweek", dayofweek);

        return modelAndView;
    }

    @RequestMapping(value = "/scheForm")
    public ModelAndView scheForm(HttpServletRequest request, ScheVO scheInfo) {
        ModelAndView modelAndView = new ModelAndView("schedule/scheForm");

        String usernum = request.getSession().getAttribute("usernum").toString();

        etcSvc.setCommonAttribute(usernum, modelAndView);

        if (scheInfo.getId() != null) {
            scheInfo = scheSvc.selectScheOne(scheInfo);
        } else {
            scheInfo.setType("1");
            scheInfo.setOpen("Y");

            String calendar_date = request.getParameter("calendar_date");
            if (calendar_date == null || "".equals(calendar_date)) {
                calendar_date = Util4calen.date2Str(Util4calen.getToday());
            }
            scheInfo.setStart_date(calendar_date);
            scheInfo.setStart_hour("09");
            scheInfo.setEnd_date(calendar_date);
            scheInfo.setEnd_hour("18");
        }
        
        modelAndView.addObject("scheInfo", scheInfo);

        List<?> typelist = etcSvc.selectClassCode("4");
        modelAndView.addObject("typelist", typelist);

        return modelAndView;
    }

    @RequestMapping(value = "/scheSave")
    public ModelAndView scheSave(HttpServletRequest request, ScheVO scheInfo) {
        String usernum = request.getSession().getAttribute("usernum").toString();
        scheInfo.setUsernum(usernum);

        scheSvc.insertSche(scheInfo);

        return new ModelAndView("redirect:/scheList");
    }

    @RequestMapping(value = "/scheRead4Ajax")
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
    @RequestMapping(value = "/scheRead")
    public ModelAndView scheRead(HttpServletRequest request, ScheVO scheVO) {
        ModelAndView modelAndView = new ModelAndView("schedule/scheRead");

        String usernum = request.getSession().getAttribute("usernum").toString();

        etcSvc.setCommonAttribute(usernum, modelAndView);

        ScheVO scheInfo = scheSvc.selectScheOne4Read(scheVO);

        modelAndView.addObject("scheInfo", scheInfo);

        return modelAndView;
    }

    @RequestMapping(value = "/scheDelete")
    public ModelAndView scheDelete(HttpServletRequest request, ScheVO scheVO) {

        scheSvc.deleteSche(scheVO);

        return new ModelAndView("redirect:/scheList");
    }

}
