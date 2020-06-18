package com.mvc.action.memberclient;

import javax.servlet.http.*;
import com.baemin.member.*;
import com.mvc.action.CommandAction;

public class ChangeAddrProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ChangeAddrProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        int no = Integer.parseInt((session.getAttribute("no") + "").trim());
        String addr = request.getParameter("addr");
        String addr2 = request.getParameter("addr2");
        Double memberX = Double.parseDouble(request.getParameter("memberX").trim());
        Double memberY = Double.parseDouble(request.getParameter("memberY").trim());

        MemberDAO dao = MemberDAO.getInstance();

        MemberDTO dto = new MemberDTO();

        dto.setAddr(addr);
        dto.setAddr2(addr2);
        dto.setMemberX(memberX);
        dto.setMemberY(memberY);
        dto.setNo(no);

        System.out.println();
        System.out.println();
        System.out.println(dto.toString());
        System.out.println();
        System.out.println();

        int result = dao.changeAddr(dto);

        if (result == 1) {
            session.setAttribute("memberX", memberX);
            session.setAttribute("memberY", memberY);
        }

        System.out.println("result" + result);

        request.setAttribute("result", result);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/memberClient/ChangeAddrPro.jsp";
    }

}
