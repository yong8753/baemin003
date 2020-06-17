package com.mvc.action.baemin;

import javax.servlet.http.*;

import com.baemin.orderlist.cart.CartMgr;
import com.mvc.action.CommandAction;

public class UpdateCartProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - UpdateCartProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        int protocol = Integer.parseInt(request.getParameter("protocol").trim());

        CartMgr cart = (CartMgr) session.getAttribute("cart");

        int count = 0;
        int menu_No = 0;

        switch (protocol) {

            case 1:
                count = Integer.parseInt(request.getParameter("count").trim());
                menu_No = Integer.parseInt(request.getParameter("menu_No").trim());
                cart.updateCart(count, menu_No);
                session.setAttribute("cart", cart);
                break;

            case 2:
                menu_No = Integer.parseInt(request.getParameter("menu_No").trim());
                cart.deleteCart(menu_No);
                session.setAttribute("cart", cart);
                break;
        }

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/UpdateCartPro.jsp";
    }

}
