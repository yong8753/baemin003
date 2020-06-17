package com.mvc.action.baemin;

import javax.servlet.http.*;
import com.baemin.review.*;
import com.mvc.action.CommandAction;

public class ReviewWriteProAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        System.out.println("- - - - ReviewWriteProAction - - - - ");
        ///////////////// 이 아래에 내용 넣으세요 /////////////////////////

        HttpSession session = ((HttpServletRequest) request).getSession();

        String member_No_ = session.getAttribute("no") + "";
        int member_no = Integer.parseInt(member_No_.trim());

        String rank_ = request.getParameter("rank");
        int rank = Integer.parseInt(rank_.trim());

        String shop_No_ = request.getParameter("shop_No");
        int shop_no = Integer.parseInt(shop_No_.trim());

        String content = request.getParameter("content");

        System.out.println("content=" + content);
        System.out.println("rank=" + rank);
        System.out.println("shop_No=" + shop_no);

        ReviewDTO dto = new ReviewDTO();

        dto.setContent(content);
        dto.setMember_no(member_no);
        dto.setRank(rank);
        dto.setShop_no(shop_no);

        ReviewDAO dao = ReviewDAO.getInstance();

        int c = dao.writeReview(dto);

        System.out.println("결과 :" + c);

        request.setAttribute("shop_no", shop_no);

        // response.sendRedirect("ShopPage.jsp?shopNo=" + shop_no);

        ///////////////// 이 위에 내용 넣으세요 /////////////////////////
        return "/baemin/ReviewWritePro.jsp";
    }

}
