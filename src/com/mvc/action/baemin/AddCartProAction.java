package com.mvc.action.baemin;

import javax.servlet.http.*;

import com.baemin.orderlist.Order_MenuDTO;
import com.baemin.orderlist.cart.CartMgr;
import com.mvc.action.CommandAction;

public class AddCartProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - AddCartProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        Object cart_shop_no_ob = session.getAttribute("cart_shop_no");

        String menuEx = request.getParameter("menuEx");
        String getShopNo = request.getParameter("shop_No").trim();

        int menu_No = Integer.parseInt(request.getParameter("menu_No").trim());
        int count = Integer.parseInt(request.getParameter("count").trim());

        String price_ = request.getParameter("price").trim();
        price_ = price_.replace("원", "");

        int price = Integer.parseInt(price_);
        int shop_No = Integer.parseInt(getShopNo);
        String menu_Name = request.getParameter("menu_Name");

        System.out.println("cart_shop_no_ob=" + cart_shop_no_ob);
        System.out.println("getShopNo=" + getShopNo);

        Order_MenuDTO dto = new Order_MenuDTO();
        dto.setCount(count);
        dto.setMenu_No(menu_No);
        dto.setMenu_Name(menu_Name);
        dto.setPrice(price);
        dto.setMenuEx(menuEx);
        System.out.println("dto.toString()=" + dto.toString());

        CartMgr cart = null;

        if (cart_shop_no_ob == null) {
            System.out.println("기존장바구니없음");
            session.setAttribute("cart_shop_no", shop_No);
            cart = new CartMgr();
            session.setAttribute("cart", cart);
            cart.addCart(dto);

        } else if ((cart_shop_no_ob + "").trim().equals(getShopNo)) {
            System.out.println("기존장바구니 O 기존가게 O ");
            cart = (CartMgr) session.getAttribute("cart");
            cart.addCart(dto);

        } else {
            System.out.println("기존장바구니 O 기존가게 X ");
            session.setAttribute("cart_shop_no", Integer.parseInt(getShopNo.trim()));
            session.removeAttribute("cart");
            cart = new CartMgr();
            session.setAttribute("cart", cart);
            cart.addCart(dto);
        }

        System.out.println("cart.getCartList().size()");
        System.out.println(cart.getCartList().size());

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/AddCartPro.jsp";
    }

}
