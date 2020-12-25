package servlet;

import dao.FlightDao;
import dao.FlightDaolmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet",urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String userid = request.getParameter("userid");
        String password = request.getParameter("password");
        FlightDao flightDao = new FlightDaolmpl();
        int flag = flightDao.register(userid,username,password);
        if (flag==1){
            request.setAttribute("back","注册成功");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }else {
            request.setAttribute("back","注册失败");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
