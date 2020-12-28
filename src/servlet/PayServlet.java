package servlet;

import dao.FlightDao;
import dao.FlightDaolmpl;
import data.Order;
import data.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

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

        String people1 =  request.getParameter("cjr1");
        String ic1 =  request.getParameter("ic1");
        String phone1 =  request.getParameter("tel1");
        String people2 =  request.getParameter("cjr2");
        String ic2 =  request.getParameter("ic2");
        String phone2 =  request.getParameter("tel2");
        String people3 =  request.getParameter("cjr3");
        String ic3 =  request.getParameter("ic3");
        String phone3 =  request.getParameter("tel3");


        String flag =  request.getParameter("flag");
        String flightnumber = request.getParameter("flightnumber");
        String money = request.getParameter("money");
        HttpSession session = request.getSession();
        User user = ((User) session.getAttribute("user"));
        String usersid = user.getUserid();

        Order order = new Order();
        order.setPeople1(people1);
        order.setPeople2(people2);
        order.setPeople3(people3);
        order.setIc1(ic1);
        order.setIc2(ic2);
        order.setIc3(ic3);
        order.setPhone1(phone1);
        order.setPhone2(phone2);
        order.setPhone3(phone3);
        order.setFlightnumber(flightnumber);
        order.setUserid(usersid);
        order.setFlag(flag);
        order.setFlightprice(money);

        request.setAttribute("orderinfo",order);
        request.getRequestDispatcher("pay.jsp").forward(request,response);
    }
    protected void pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String flag =  request.getParameter("flag");
        String flightnumber = request.getParameter("flightnumber");
        String money = request.getParameter("flightprice");
        String user =  request.getParameter("user");


        String people3 =  request.getParameter("people3");


        String people2 =  request.getParameter("people2");
//        String people3 =  (new String (request.getParameter("people3").getBytes("iso-8859-1","utf-8"));
        String people1 = (new String(request.getParameter("people1").getBytes("iso-8859-1"), "utf-8"));

        String phone1 =  request.getParameter("phone");
        Order order = new Order();
        order.setFlag(flag);
        order.setUserid(user);
        order.setFlightnumber(flightnumber);
        order.setFlightprice(money);
        order.setPhone1(phone1);
        order.setPeople1(people1);
        order.setPeople2(people2);
        order.setPeople3(people3);
        System.out.println(order.getPeople1());




        String account = request.getParameter("account");
        String password = request.getParameter("password");
        FlightDao flightDao = new FlightDaolmpl();
        int payflag = flightDao.pay(account,password,order.getFlightprice(),order.getUserid());

        if (payflag==1){
            flightDao.addorder(order);
            request.setAttribute("info","支付成功！");
            request.getRequestDispatcher("order.jsp").forward(request,response);
        }else if (payflag==-1){
            request.setAttribute("erron","余额不足，支付失败");
            request.getRequestDispatcher("pay.jsp").forward(request,response);
        }else if (payflag==0){
            request.setAttribute("erron","银行卡账号或密码错误！");
            request.getRequestDispatcher("pay.jsp").forward(request,response);
        }
    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
