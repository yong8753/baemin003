package com.mvc.action.notice;

import javax.servlet.http.*;
import com.baemin.notice.*;
import com.mvc.action.CommandAction;

public class NoticeViewAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - NoticeViewAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        int no = Integer.parseInt(request.getParameter("no"));
        NoticeDAO dao = NoticeDAO.getInstance();
        NoticeDTO dto = dao.viewNotice(no);
        System.out.println(dto.toString());

        request.setAttribute("dto", dto);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/notice/NoticeView.jsp";
    }

}
