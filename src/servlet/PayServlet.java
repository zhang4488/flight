package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "PayServlet",urlPatterns = "/PayServlet")
public class PayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String methodName = request.getParameter("method");

        try {
            // 利用反射获取方法
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            // 执行相应的方法
            method.setAccessible(true);
            method.invoke(this, request, response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    protected void gopay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String flag =  request.getParameter("flag");
        String flightnumber = request.getParameter("flightnumber");
        String money = request.getParameter("money");
//        request.setAttribute("flag",flag);
//        request.setAttribute("flightnumber",flightnumber);
        request.setAttribute("money",money);
        request.getRequestDispatcher("pay.jsp").forward(request,response);
    }
    protected void pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String flag =  request.getParameter("flag");
        String flightnumber = request.getParameter("flightnumber");
        String money = request.getParameter("money");
//        request.setAttribute("flag",flag);
//        request.setAttribute("flightnumber",flightnumber);
        request.setAttribute("money",money);
        request.getRequestDispatcher("pay.jsp").forward(request,response);
    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
