<%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/23
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<link rel="stylesheet" href="style/comm.css">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选座</title>
</head>
<body>
<div class="booking">
    <div class="register-first" id="register-first">
        <span>请 您 先 登 录</span>
        <a class="y" href="toLogin.do">确 定</a>
        <a class="y" href="javascript:$('#register-first').hide();" onclick="close();">取 消</a>
    </div>
    <div class="info">
        <span>选择座位</span>
    </div>
    <div class="chooseSeats">
        <div class="choose">
            <div class="note">
                <span>可选座位</span><span class="can"></span>
                <span>已售座位</span><span class="used"></span>
                <span>已选座位</span><span class="selected"></span>
                <p>荧幕方向</p>
            </div>
            <div class="seats">
                <p>
                    第1排
                    <span class="can" id="0100" title="1排0号"></span>
                    <span class="can" id="0101" title="1排1号"></span>
                    <span class="can" id="0102" title="1排2号"></span>
                    <span class="can" id="0103" title="1排3号"></span>
                    <span class="can" id="0104" title="1排4号"></span>
                    <span class="can" id="0105" title="1排5号"></span>
                    <span class="can" id="0106" title="1排6号"></span>
                    <span class="can" id="0107" title="1排7号"></span>
                    <span class="can" id="0108" title="1排8号"></span>
                    <span class="can" id="0109" title="1排9号"></span>
                </p>
                <p>
                    第2排
                    <span class="can" id="0200" title="2排0号"></span>
                    <span class="can" id="0201" title="2排1号"></span>
                    <span class="can" id="0202" title="2排2号"></span>
                    <span class="can" id="0203" title="2排3号"></span>
                    <span class="can" id="0204" title="2排4号"></span>
                    <span class="can" id="0205" title="2排5号"></span>
                    <span class="can" id="0206" title="2排6号"></span>
                    <span class="can" id="0207" title="2排7号"></span>
                    <span class="can" id="0208" title="2排8号"></span>
                    <span class="can" id="0209" title="2排9号"></span>
                </p>
                <p>
                    第3排
                    <span class="can" id="0300" title="3排0号"></span>
                    <span class="can" id="0301" title="3排1号"></span>
                    <span class="can" id="0302" title="3排2号"></span>
                    <span class="can" id="0303" title="3排3号"></span>
                    <span class="can" id="0304" title="3排4号"></span>
                    <span class="can" id="0305" title="3排5号"></span>
                    <span class="can" id="0306" title="3排6号"></span>
                    <span class="can" id="0307" title="3排7号"></span>
                    <span class="can" id="0308" title="3排8号"></span>
                    <span class="can" id="0309" title="3排9号"></span>
                </p>
                <p>
                    第4排
                    <span class="can" id="0400" title="4排0号"></span>
                    <span class="can" id="0401" title="4排1号"></span>
                    <span class="can" id="0402" title="4排2号"></span>
                    <span class="can" id="0403" title="4排3号"></span>
                    <span class="can" id="0404" title="4排4号"></span>
                    <span class="can" id="0405" title="4排5号"></span>
                    <span class="can" id="0406" title="4排6号"></span>
                    <span class="can" id="0407" title="4排7号"></span>
                    <span class="can" id="0408" title="4排8号"></span>
                    <span class="can" id="0409" title="4排9号"></span>
                </p>
            </div>
            <p class="notice">单击已选取座位可取消选择!&nbsp;一次最多订<b>2张</b>!</p>
        </div>
        <div class="descr">
            <div class="base">
                <p>影片:<span>111</span></p>
                <p>时长:<span>111</span> &nbsp;&nbsp;单价:<span>111(元)</span></p>
                <p>影院:<span>成都电影城</span></p>
                <p>
                    场次:
                    <span>< value="111" type="both"/></span>
                </p>
            </div>
            <div class="seat">
                座位：
            </div>
            <div class="saleout">
                <p>
                    <a id="saleout" href="javascript:;" onclick="buy();">立即购买</a>
                    <span></span>
                </p>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function(){
        //处理已经被购买的座位样式
        var used = '11';
        used = used.replace("[","").replace("]","");
        var usedArr = used.split(",");
        $(usedArr).each(function(i,id){
            id = $.trim(id);
            $("#"+id).addClass("used").removeClass("can");
        });

        //是否登录--能够购买
        if(""==$("#user-name").html()){
            $("#register-first").show();
            $("#saleout").attr("href","#");
        }
        //
        var count=0;
        $(".seats span").click(function(){
            if($(this).hasClass("can") && count<=2){
                if(count>=2){
                    alert("最多选2个位置");
                    return false;
                }
                $(this).attr("class","selected");
                var $span="<span id=select_"+$(this).attr("id")+"> "+$(this).attr("title")+"</span>";
                /* 去除提示选座信息 */
                $(".saleout p span").html("");
                $(".seat").append($span);
                count++;
            }else if($(this).hasClass("selected")){
                $(this).attr("class","can");
                $(".seat span[id=select_"+$(this).attr('id')+"]").remove();
                count--;
            }

        });
    });
    function buy(){
        if(""==$("#user-name").html()){
            $(".register-first").show();
            return false;
        }
        if(!$(".seat span").html()){
            $(".saleout p span").html("请选择座位");
            return false;
        }
        $("#buyForm").remove();
        var seatIdArr = [];
        var form = '<form id="buyForm" action="buy.do?uniqueID=1" method="POST">';
        $(".seats span.selected").each(function(){
            var thisId = $(this).attr("id");
            seatIdArr.push(thisId);
        });
        var thisInput = '<input type="text" value="'+seatIdArr+'" name="seatIds"/>';
        form += thisInput;
        form += "</form>";
        $("body").append(form);
        /* 获取总价 */
        var price='222';
        var count=$('.selected').length-1;
        var b1 = confirm('支付 '+price*count+' 元');
        if(b1==false){
            return false;
        }
        $("#buyForm").submit();
    }
</script>
</html>
