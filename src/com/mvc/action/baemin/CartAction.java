package com.mvc.action.baemin;

import javax.servlet.http.*;

import com.baemin.orderlist.cart.CartMgr;
import com.mvc.action.CommandAction;

public class CartAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - CartAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        Object cart_shop_no_ob = session.getAttribute("cart_shop_no");
        System.out.println("cart_shop_no_ob=" + cart_shop_no_ob);
        String cart_shop_no_ = cart_shop_no_ob + "";
        cart_shop_no_ = cart_shop_no_.trim();
        System.out.println("cart_shop_no_=" + cart_shop_no_);
        int cart_shop_no = -1;

        if (cart_shop_no_ob == null) {
            CartMgr cart = new CartMgr();
            session.setAttribute("cart", cart);
            session.setAttribute("cart_shop_no", -1);
        } else {
            cart_shop_no = Integer.parseInt(cart_shop_no_);
        }

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/Cart.jsp";
    }

}
