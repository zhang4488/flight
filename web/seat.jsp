<%@ page import="dao.FlightDao" %>
<%@ page import="dao.FlightDaolmpl" %>
<%@ page import="data.Seat" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/25
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        .big{
            margin: 0 auto;
            height: 850px;
            width:1050px;
            /* border: 1px red solid; */
        }
        .content{
            height: 670px;
            width:1050px;
            /* border: 1px black solid; */
        }
        .hang{
            height: 30px;
            width:1020px;
            margin-left: 30px;
        }
        .head1{
            float: left;
            height: 30px;
            width:150px;
            text-align: center;
        }
        .head2{
            float: left;
            height: 30px;
            width:150px;
            text-align: center;
            margin-left: 100px;
        }
        .none{display: none;padding-top: 15px;}
        .local{
            height: 100px;
            width:100px;
        }
        .choice{
            height: 100px;
            width:1050px;
            /* border: 1px solid blue; */
        }
        .pic1{
            height: 100px;
            width:100px;
            text-align: center;
            margin-left: 320px;
            float: left;
        }
        .choose1{
            height: 30px;
            width:80px;
            text-align: center;
            margin-top: 35px;
            float: left;
        }
        .choose2{
            height: 30px;
            width:80px;
            text-align: center;
            margin-top: 35px;
            float: left;
        }
        .pic2{
            height: 100px;
            width:100px;
            text-align: center;
            float: left;
            margin-left: 50px;
        }
        .one{
            height: 650px;
            width:150px;
            float: left;
            text-align: center;
        }
        .tow{
            height: 650px;
            width:150px;
            float: left;
            text-align: center;
        }
        .three{
            height: 650px;
            width:150px;
            float: left;
            text-align: center;
        }
        .four{
            height: 650px;
            width:150px;
            float: left;
            margin-left: 100px;
            text-align: center;
        }
        .five{
            height: 650px;
            width:150px;
            float: left;
            text-align: center;
        }
        .six{
            height: 650px;
            width:150px;
            float: left;
            text-align: center;
        }
        .yes{
            height: 50px;
            width:1008px;
            text-align: center;
        }
        .lie{
            height: 650px;
            width:30px;
            float: left;
            margin-top: 10px;
            text-align: center;
        }
        .head{
            height: 100px;
            /* border: 1px red solid; */
            line-height: 100px;
        }

    </style>
    <script type="text/javascript">
        var number=0;
        var local1=null;
        var local2=null;
        var local3=null;



        function myxz(id){
            number=number+1;
            if (number>3){
                number=number-1;
                alert("选座已超出乘机人数量")
            }else{
                console.log(id)
                document.getElementById(id).style.display = "none";
                id=parseInt(id)
                console.log(id)
                if (id<7){
                     id=id+"A"
                 }
                else if (6<id && id<13){
                     id=id-6
                     id=id+"B"
                 }

                else if (12<id && id<19){
                     id=id-12
                     id=id+"C"
                 }

                else if (18<id && id<25){
                    id=id-18
                    id=id+"D"
                }

                else if (24<id && id<31){
                    id=id-24
                    id=id+"E"
                }

                else if (30<id && id<37){
                    id=id-30
                    id=id+"F"
                }

                if (number==1){
                    local1=id;
                    document.getElementById("local1").value = local1;
                }
                if (number==2){
                    local2=id
                    document.getElementById("local2").value = local2;
                }
                if (number==3){
                    local3=id
                    document.getElementById("local3").value = local3;
                }
                console.log(local3)
                document.getElementById(id).style.display = "block";
            }

        }
        function mymz(id){
            number=number-1;
            if (number==0){
                document.getElementById("local1").value = null;
            }
            if (number==1){
                document.getElementById("local2").value = null;
            }
            if (number==2){
                document.getElementById("local3").value = null;
            }
            // idnumber = document.getElementsByTagName('div')[1].getAttribute('id');
            document.getElementById(id).style.display = "none";
            id=String(id)
            if (id.indexOf("A")!==-1){
                id=parseInt(id)
            }else if (id.indexOf("B")!==-1){
                id=parseInt(id)
                id=id+6
            }else if (id.indexOf("C")!==-1){
                id=parseInt(id)
                id=id+12
            }else if (id.indexOf("D")!==-1){
                id=parseInt(id)
                id=id+18
            }else if (id.indexOf("E")!==-1){
                id=parseInt(id)
                id=id+24
            }else if (id.indexOf("F")!==-1){
                id=parseInt(id)
                id=id+30
            }

            id=id+"kx";
            document.getElementById(id).style.display = "block";
        }


        function sss() {
            <%
                String flightnumber="HO1249";
                FlightDao flightDao = new FlightDaolmpl();
                ArrayList<Seat> seats = flightDao.getseat(flightnumber);
            %>
            <%
                for (Seat seat : seats) {%>
                    <%if (!seat.getS1().equals("0")){%>
                        var s1="<%=seat.getS1()%>"
                        if (s1.indexOf("A")!==-1){
                            s1=parseInt(s1)
                        }else if (s1.indexOf("B")!==-1){
                            s1=parseInt(s1)
                            s1=s1+6
                        }else if (s1.indexOf("C")!==-1){
                            s1=parseInt(s1)
                            s1=s1+12
                        }else if (s1.indexOf("D")!==-1){
                            s1=parseInt(s1)
                            s1=s1+18
                        }else if (s1.indexOf("E")!==-1){
                            s1=parseInt(s1)
                            s1=s1+24
                        }else if (s1.indexOf("F")!==-1){
                            s1=parseInt(s1)
                            s1=s1+30
                        }
                        s1=s1+"kx";
                        document.getElementById(s1).style.display = "none";
                        s1=parseInt(s1)
                        document.getElementById(s1).style.display = "block";

            <%}
        }%>

        }

    </script>
</head>
<body background="img/air.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%;"  onload="sss();">
<%

%>
<div class="big">
    <div class="choice">
        <div class="pic1"><img src="img/可选座位.png" class="local" /></div>
        <div class="choose1">可选座位</div>
        <div class="pic2"><img src="img/已选座位.png" class="local" /></div>
        <div class="choose2">已选座位</div>
    </div>
    <div class="hang">
        <div class="head1">1</div>
        <div class="head1">2</div>
        <div class="head1">3</div>
        <div class="head2">4</div>
        <div class="head1">5</div>
        <div class="head1">6</div>
    </div>
    <div class="content">
        <div class="lie">
            <div class="head">A</div>
            <div class="head">B</div>
            <div class="head">C</div>
            <div class="head">D</div>
            <div class="head">E</div>
            <div class="head">F</div>
        </div>
        <form action="ChickInServlet?orderid=1123&flightnumber=<%=flightnumber%>" method="post"  id="1cl">
            <input id="local1" type="hidden" name="local1">
            <input id="local2" type="hidden" name="local2">
            <input id="local3" type="hidden" name="local3">

            <div class="one">

            <div id="1kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local"/></div>
            <div id="1A" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="1" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="7kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="1B" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="7" class="none"><img src="img/feiji.png" class="local"/></div>


            <div id="13kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="1C" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="13" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="19kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="1D" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="19" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="25kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="1E" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="25" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="31kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="1F" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="31" class="none"><img src="img/feiji.png" class="local"/></div>
            </div>
        <div class="tow">
            <div id="2kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="2A" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="2" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="8kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="2B" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="8" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="14kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="2C" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="14" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="20kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="2D" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="20" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="26kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="2E" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="26" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="32kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="2F" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="32" class="none"><img src="img/feiji.png" class="local"/></div>

        </div>
        <div class="three">
            <div id="3kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="3A" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="3" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="9kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="3B" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="9" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="15kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="3C" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="15" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="21kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="3D" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="21" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="27x" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="3E" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="27" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="33kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="3F" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="33" class="none"><img src="img/feiji.png" class="local"/></div>

        </div>
        <div class="four">
            <div id="4kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="4A" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="4" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="10kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="4B" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="10" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="16kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="4C" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="16" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="22kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="4D" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="22" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="28kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="4E" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="28" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="34kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="4F" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="34" class="none"><img src="img/feiji.png" class="local"/></div>

        </div>
        <div class="five">
            <div id="5kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="5A" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="5" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="11kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="5B" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="11" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="17kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="5C" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="17" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="23kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="5D" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="23" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="29kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="5E" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="29" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="35kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="5F" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="35" class="none"><img src="img/feiji.png" class="local"/></div>

        </div>
        <div class="six">
            <div id="6kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="6A" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="6" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="12kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="6B" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="12" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="18kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="6C" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="18" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="24kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="6D" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="24" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="30kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="6E" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="30" class="none"><img src="img/feiji.png" class="local"/></div>

            <div id="36kx" onclick="myxz(this.id)"><img src="img/可选座位.png" class="local" /></div>
            <div id="6F" class="none" onclick="mymz(this.id)"><img src="img/已选座位.png" class="local" /></div>
            <div id="36" class="none"><img src="img/feiji.png" class="local"/></div>

        </div>
            <div class="yes">
                <input type="submit"  style="width: 500px;height: 60px;background-color: coral;border-radius: 10px;font-size: 25px;" value="确定">
            </div>
        </form>
    </div>
</div>
</body>
</html>
