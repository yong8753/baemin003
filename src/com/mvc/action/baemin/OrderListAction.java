package com.mvc.action.baemin;

import javax.servlet.http.*;

import com.baemin.orderlist.OrderListDAO;
import com.mvc.action.CommandAction;

public class OrderListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - OrderAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        String no_ = session.getAttribute("no") + "";
        int memberNo = Integer.parseInt(no_.trim());

        OrderListDAO dao = OrderListDAO.getInstance();
        request.setAttribute("list", dao.getListByMember_No(memberNo));

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/OrderList.jsp";
    }

}
