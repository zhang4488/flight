package dao;

import data.*;
import db.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FlightDaolmpl implements FlightDao {
    DBConnection db = new DBConnection();
    @Override
    public String flightnumber(String tpoint, String lpoint, String ttime, String level) {
        String flight=null;
        int levels = Integer.parseInt(level);
        //获取数据库连接
        try {
            //获取数据库连接
            Connection con = db.getConnection();

            //执行查询
            Statement st = con.createStatement();
            ResultSet rs  = st.executeQuery("select flag FROM roteanddate WHERE Takeoffpoint ='"+tpoint+"' and Landingpoint='"+lpoint+"' and riqi='"+ttime+"' and  level='"+levels+"'");
            if (rs.next()){
                flight = rs.getString("flag");
            }else {
                flight=null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flight;
    }

    @Override
    public List<Flight> getflight(String flightnumber) {
        List<Flight> flights = new ArrayList<Flight>();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from flight where flag='"+flightnumber+"'");

            while (rs.next()) {
                Flight flight = new Flight();
                flight.setFlag(rs.getString("flag"));
                flight.setCompany(rs.getString("company"));
                flight.setFlightnumber(rs.getString("flightnumber"));
                flight.setAircraftmodel(rs.getString("aircraftmodel"));
                flight.setDuration(rs.getString("duration"));
                flight.setDeparturetime(rs.getString("departuretime"));
                flight.setLandingtime(rs.getString("landingtime"));
                flight.setAirportofdeparture(rs.getString("airportofdeparture"));
                flight.setLandingAirport(rs.getString("landingAirport"));
                flight.setPrice(rs.getInt("price"));
                flight.setRemainingtickets(rs.getInt("remainingtickets"));
                flights.add(flight);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flights;
    }

    @Override
    public RoteDate getrotedate(String flag) {
        RoteDate roteDate = new RoteDate();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from roteanddate where flag='"+flag+"'");

            if (rs.next()) {
                roteDate.setTakeofpoint(rs.getString("Takeoffpoint"));
                roteDate.setLandingpoint(rs.getString("Landingpoint"));
                roteDate.setRiqi(rs.getString("riqi"));
                roteDate.setFlag(rs.getString("flag"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roteDate;
    }

    @Override
    public Flight findflight(String flightnumber) {
        Flight flight = new Flight();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from flight where flightnumber='"+flightnumber+"'");

            if (rs.next()) {
                flight.setFlag(rs.getString("flag"));
                flight.setCompany(rs.getString("company"));
                flight.setFlightnumber(rs.getString("flightnumber"));
                flight.setAircraftmodel(rs.getString("aircraftmodel"));
                flight.setDuration(rs.getString("duration"));
                flight.setDeparturetime(rs.getString("departuretime"));
                flight.setLandingtime(rs.getString("landingtime"));
                flight.setAirportofdeparture(rs.getString("airportofdeparture"));
                flight.setLandingAirport(rs.getString("landingAirport"));
                flight.setPrice(rs.getInt("price"));
                flight.setRemainingtickets(rs.getInt("remainingtickets"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flight;
    }

    @Override
    public int pay(String account, String password, String money, String user) {
        int moneys = Integer.parseInt(money);
        try {
            Connection con = db.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from user where userid=? && account=? && paypassword=?");
            pst.setString(1, user);
            pst.setString(2, account);
            pst.setString(3, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()){
                if (moneys>rs.getInt("money")){
                    return -1;
                }else {
                    PreparedStatement pst2 = con.prepareStatement("update user set money = money-'"+moneys+"' where userid=? && account=? && paypassword=?");
                    pst2.setString(1, user);
                    pst2.setString(2, account);
                    pst2.setString(3, password);
                    pst2.executeUpdate();
                    pst2.close();
                }
            }else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    @Override
    public int register(String userid, String username, String password) {
        try {
            Connection con = db.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into user (userid,password,username) values ('"+userid+"','"+password+"','"+username+"')");
            pst.executeUpdate();
            pst.close();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public User getuser(String userid, String password) {
        User user = new User();
        try {
            Connection con = db.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from user where userid=? && password=?");
            pst.setString(1, userid);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()){
                user.setUsername(rs.getString("username"));
                user.setUserid(rs.getString("userid"));
                user.setMoney(rs.getInt("money"));
            }else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void addorder(Order order) {
        String phone = order.getPhone1();
        String people1 = order.getPeople1();
        String people2 = order.getPeople2();
        String people3 = order.getPeople3();
        System.out.println(people1);
        try {
            Connection con = db.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into flightorder (userid,flag,flightnumber,status,people1,phone,people2,people3,flightprice) values (?,?,?,0,'"+people1+"',?,?,?,?)");
            pst.setString(1, order.getUserid());
            pst.setString(2, order.getFlag());
            pst.setString(3, order.getFlightnumber());
//            pst.setString(4, people1);
            pst.setString(4, phone);
            pst.setString(5, people2);
            pst.setString(6, people3);
            pst.setString(7, order.getFlightprice());

            pst.executeUpdate();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public ArrayList<Order> getorder(String userid) {
        ArrayList<Order> orders = new ArrayList<Order>();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from flightorder where userid='"+userid+"'");

            while (rs.next()) {
                Order order = new Order();
                order.setFlag(rs.getString("flag"));
                order.setFlightnumber(rs.getString("flightnumber"));
                order.setFlightnumber(rs.getString("flightnumber"));
                order.setStatus(rs.getInt("status"));
                order.setPeople1(rs.getString("people1"));
                order.setIc1(rs.getString("idcard1"));
                order.setPhone1(rs.getString("phone"));
                order.setLocal1(rs.getString("local"));
                order.setFlightprice(rs.getString("flightprice"));
                orders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  orders;
    }

    @Override
    public ArrayList<Seat> getseat(String flightnumber) {
        ArrayList<Seat> seats = new ArrayList<Seat>();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from seat where flightnumber='"+flightnumber+"'");

            while (rs.next()) {
                Seat seat = new Seat();
                seat.setS1(rs.getString("s1"));
                seats.add(seat);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  seats;
    }

    @Override
    public int chickin(String local1, String local2, String local3, String orderid, String flightnumber) {
        try {
            Connection con = db.getConnection();
            PreparedStatement pst = con.prepareStatement("update flightorder set local = ?,local2 =?, local3=? where orderid=?");
            pst.setString(1, local1);
            pst.setString(2, local2);
            pst.setString(3, local3);
            pst.setString(4, orderid);


            pst.executeUpdate();
            pst.close();

            PreparedStatement pst2 = con.prepareStatement("insert into seat (s1,flightnumber) values (?,?)");
            pst2.setString(1, local1);
            pst2.setString(2, flightnumber);
            pst2.executeUpdate();
            pst2.close();

            PreparedStatement pst3 = con.prepareStatement("insert into seat (s1,flightnumber) values (?,?)");
            pst3.setString(1, local2);
            pst3.setString(2, flightnumber);
            pst3.executeUpdate();
            pst3.close();

            PreparedStatement pst4 = con.prepareStatement("insert into seat (s1,flightnumber) values (?,?)");
            pst4.setString(1, local3);
            pst4.setString(2, flightnumber);
            pst4.executeUpdate();
            pst4.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }
}
