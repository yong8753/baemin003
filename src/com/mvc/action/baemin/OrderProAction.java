package com.mvc.action.baemin;

import java.util.List;

import javax.servlet.http.*;

import com.baemin.member.*;
import com.baemin.orderlist.*;
import com.baemin.orderlist.cart.CartMgr;
import com.baemin.util.Ht2List;
import com.mvc.action.CommandAction;

public class OrderProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - OrderProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        // 주문한 데이터 받아서, orderlist 테이블에 넣는다.
        CartMgr cartmgr = (CartMgr) session.getAttribute("cart");

        List<Order_MenuDTO> list = Ht2List.ht2List(cartmgr.getCartList());

        String comment = request.getParameter("comment");

        System.out.println("list.size()");
        System.out.println(list.size());

        int memberNo = Integer.parseInt(session.getAttribute("no") + "");
        int shopNo = Integer.parseInt(session.getAttribute("cart_shop_no") + "");

        MemberDAO memberdao = MemberDAO.getInstance();
        MemberDTO memberdto = memberdao.getDTO(memberNo);

        System.out.println("memberdto.toString()");
        System.out.println(memberdto.toString());

        OrderListDAO dao = OrderListDAO.getInstance();
        OrderListDTO dto = new OrderListDTO();

        dto.setMenuList(list);
        dto.setName(memberdto.getName());
        dto.setAddr(memberdto.getAddr());
        dto.setAddr2(memberdto.getAddr2());
        dto.setComment(comment);
        dto.setMember_No(memberdto.getNo());
        dto.setShop_NO(shopNo);

        System.out.println("dto.toString()");
        System.out.println(dto.toString());
        System.out.println();
        System.out.println();
        System.out.println();

        int result = dao.insertOrder(dto);
        System.out.println();
        System.out.println("result=" + result);
        System.out.println();

        cartmgr.emptyCart();

        request.setAttribute("result", result);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/OrderPro.jsp";
    }

}
