package dao;

import data.*;

import java.util.ArrayList;
import java.util.List;

public interface FlightDao {
    String flightnumber(String tpoint, String lpoint, String ttime, String level);

    List<Flight> getflight(String flightnumber);

    RoteDate getrotedate(String flag);

    Flight findflight(String flightnumber);

    int pay(String account, String password, String money, String user);

    int register(String userid, String username, String password);

    User getuser(String userid, String password);

    void addorder(Order order);

    ArrayList<Order> getorder(String userid);

    ArrayList<Seat> getseat(String flightnumber);

    int chickin(String local1, String local2, String local3, String orderid, String flightnumber);
}
