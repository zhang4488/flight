package servlet;

import dao.FlightDao;
import dao.FlightDaolmpl;
import data.Flight;
import data.User;

import java.io.IOException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "GetfilghtServlet", urlPatterns = "/GetfilghtServlet")
public class GetfilghtServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); //设置编码，只针对POST提交有效
        String Tpoint = request.getParameter("input_province");
        String Lpoint = request.getParameter("input_city");
        String Ttime = request.getParameter("Ttime1");


        FlightDao flightDao = new FlightDaolmpl();
        String flag = flightDao.flightnumber(Tpoint,Lpoint,Ttime);
        List<Flight> flights  = flightDao.getflight(flag);
        request.setAttribute("flights",flights);
        request.setAttribute("flighttp",Tpoint);
        request.setAttribute("flightlp",Lpoint);
        request.setAttribute("flighttt",Ttime);
        request.setAttribute("flag",flag);
        request.getRequestDispatcher("tickets.jsp").forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
