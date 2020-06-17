package com.mvc.action.baemin;

import javax.servlet.http.*;
import com.mvc.action.CommandAction;

public class ShopListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ShopListAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        String category = request.getParameter("category");

        if (category == null) {
            category = "korean";
        }

        System.out.println("category=" + category + "----");

        request.setAttribute("category", category);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/ShopList.jsp";
    }

}
