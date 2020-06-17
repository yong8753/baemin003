package com.mvc.action.baemin;

import java.util.*;
import javax.servlet.http.*;
import com.baemin.menu.*;
import com.baemin.review.*;
import com.baemin.shop.*;
import com.mvc.action.CommandAction;

public class ShopPageAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ShopPageAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        int no = 0;
        String no_ = request.getParameter("shopNo");
        // response.sendRedirect("../index.html");
        System.out.println("no_ " + no_);

        no = Integer.parseInt((no_ + "").trim());
        System.out.println("no " + no);

        ShopDAO shopdao = ShopDAO.getInstance();
        ShopDTO shopdto = shopdao.getShopInfo(no);
        request.setAttribute("shopdto", shopdto);

        MenuDAO menudao = MenuDAO.getInstance();
        List<MenuDTO> menu_list = menudao.getListByShopActive(no);
        System.out.println("menu_list.size=" + menu_list.size());
        request.setAttribute("menuList", menu_list);

        ReviewDAO reviewdao = ReviewDAO.getInstance();
        List<ReviewDTO> review_list = reviewdao.getListByShop(no, 10);
        request.setAttribute("review_list", review_list);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/ShopPage.jsp";
    }

}
