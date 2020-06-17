package com.mvc.action.notice;

import java.util.List;

import javax.servlet.http.*;

import com.baemin.notice.*;
import com.mvc.action.CommandAction;

public class NoticeListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - NoticeListAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        NoticeDAO dao = NoticeDAO.getInstance();
        List<NoticeDTO> list = dao.getList();
        request.setAttribute("list", list);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/notice/NoticeList.jsp";
    }

}
