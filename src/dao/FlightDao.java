package dao;

import data.Flight;
import data.Order;
import data.RoteDate;
import data.User;

import java.util.List;

public interface FlightDao {
    String flightnumber(String tpoint, String lpoint, String ttime);

    List<Flight> getflight(String flightnumber);

    RoteDate getrotedate(String flag);

    Flight findflight(String flightnumber);

    int pay(String account, String password, String money, String user);

    int register(String userid, String username, String password);

    User getuser(String userid, String password);

    void addorder(Order order);
}
