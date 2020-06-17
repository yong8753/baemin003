package com.mvc.action.baemin;

import java.util.List;
import javax.servlet.http.*;
import com.baemin.shop.ShopDAO;
import com.baemin.shop.ShopDTO;
import com.baemin.util.ShopCatogory;
import com.mvc.action.CommandAction;

public class ShopListContentAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ShopListContentAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        double memberX = Double.parseDouble(session.getAttribute("memberX") + "");
        double memberY = Double.parseDouble(session.getAttribute("memberY") + "");

        // double memberX = 126.923408957527;
        // double memberY = 37.5508734651679;
        System.out.println("memberX=" + memberX);
        System.out.println("memberY=" + memberY);

        String category = request.getParameter("category");
        System.out.println("category=" + category);
        category = ShopCatogory.eng2kor(category);
        System.out.println("category=" + category);

        ShopDAO dao = ShopDAO.getInstance();

        List<ShopDTO> list = dao.getListByCategory(category, memberX, memberY);

        System.out.println("list.size()=" + list.size());

        request.setAttribute("list", list);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/ShopListContent.jsp";
    }

}
