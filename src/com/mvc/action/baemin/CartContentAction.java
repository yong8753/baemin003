package com.mvc.action.baemin;

import java.util.Hashtable;
import java.util.List;
import javax.servlet.http.*;
import com.baemin.orderlist.Order_MenuDTO;
import com.baemin.orderlist.cart.CartMgr;
import com.baemin.util.Ht2List;
import com.mvc.action.CommandAction;

public class CartContentAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - CartContentAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        Object cart_shop_no_ob = session.getAttribute("cart_shop_no");
        System.out.println("cart_shop_no_ob=" + cart_shop_no_ob);
        String cart_shop_no_ = cart_shop_no_ob + "";
        cart_shop_no_ = cart_shop_no_.trim();
        System.out.println("cart_shop_no_=" + cart_shop_no_);

        int cart_shop_no = Integer.parseInt(cart_shop_no_);

        request.setAttribute("cart_shop_no", cart_shop_no);

        CartMgr cart = (CartMgr) session.getAttribute("cart");

        Hashtable<Integer, Order_MenuDTO> ht = cart.getCartList();

        List<Order_MenuDTO> list = Ht2List.ht2List(ht);
        request.setAttribute("list", list);
        System.out.println("list.size()");
        System.out.println(list.size());

        // int list_length = list.size();

        int totalPrice = 0;

        for (int i = 0; i < list.size(); i++) {
            int a = list.get(i).getCount();
            int b = list.get(i).getPrice();
            totalPrice += a * b;
        }

        request.setAttribute("totalPrice", totalPrice);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/CartContent.jsp";
    }

}
