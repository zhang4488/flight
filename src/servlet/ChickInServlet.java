package servlet;

import dao.FlightDao;
import dao.FlightDaolmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChickInServlet",urlPatterns = "/ChickInServlet")
public class ChickInServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String local1 = request.getParameter("local1");
        String local2 = request.getParameter("local2");
        String local3 = request.getParameter("local3");
        String orderid = request.getParameter("orderid");
        String flightnumber = request.getParameter("flightnumber");
        FlightDao flightDao = new FlightDaolmpl();
        int flag = flightDao.chickin(local1,local2,local3,orderid,flightnumber);
        if (flag==1){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
