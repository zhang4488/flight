package servlet;

import dao.FlightDao;
import dao.FlightDaolmpl;
import data.Flight;
import data.RoteDate;
import data.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GoDetailServlet", urlPatterns = "/GoDetailServlet")
public class GoDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = ((User) session.getAttribute("user"));
        if (user==null){
            request.setAttribute("logininfo","订票请先登录");
            request.getRequestDispatcher("tickets.jsp").forward(request,response);
        }else {
            request.setCharacterEncoding("UTF-8");
            String flag =  request.getParameter("flag");
            String flightnumber = request.getParameter("flightnumber");
            FlightDao flightDao = new FlightDaolmpl();
            Flight flight  = flightDao.findflight(flightnumber);
            RoteDate roteDate  = flightDao.getrotedate(flag);
            request.setAttribute("roteDate",roteDate);
            request.setAttribute("flight",flight);

            request.getRequestDispatcher("detail.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
