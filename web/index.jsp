<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
  <title></title>
  <style type="text/css">
    *{
      margin: 0;
      padding: 0;
    }
    .feiji{
      height: 350px;
      width: 100%;
    }
    .content{
      height: 400px;
      width: 800px;
      margin: 0 auto;
      border-top: black;
      /* border:1px red solid; */
    }
    .head{
      height: 40px;
      width: 800px;
      background-color: #60b7e0;
      text-align:center ;
      margin-top: 20px;
    }
    .head span{
      font-size: 25px;
      font-family:宋体;
      font-weight: bold;
    }
    .reacher{
      height: 300px;
      width: 800px;
      /* border:1px black solid; */
    }
    .footer{
      height: 200px;
      width: 100%;
      text-align: center;
      margin-top: 50px;
      line-height: 26px;
    }
    .footer_t{
      width: 980px;
      text-align: center;
      margin: 0 auto;
    }
    .footer_b{
      width: 100%;
      text-align: center;
      padding: 10px 0px;
    }
  </style>
</head>
<body background="img/bg5.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%;">
<div class="feiji">
  <img src="img/haibao2.png" width="100%" height="350px">

</div>
<div class="content">
  <div class="head">
    <span>机票查询预订</span>
  </div>
  <div class="reacher">
    <form action="GetfilghtServlet" method="post">
      <table class="content" width="800" height="300" border="1" cellspacing="0" cellpadding="0" frame="void" rules="rows">
        <tr height="20px" style="border-top:solid 1.5px #006393">
          <th width="20%" align="center" bgcolor="#D9FFFF">城市：</th>
          <td colspan="2" align="right">
              <select name="input_province" id="input_province" class="form-control">
                <option value=""selected>--请选择--</option>
                <option value="北京">北京</option>
                <option value="上海">上海</option>
                <option value="成都">成都</option>
                <option value="南京">南京</option>
              </select>
          </td>
          <td colspan="1" align="center" width="10%">
            到
          </td>
          <td colspan="2" align="left">
            <select name="input_city" id="input_city" class="form-control">
              <option value=""selected>--请选择--</option>
              <option value="北京">北京</option>
              <option value="上海">上海</option>
              <option value="成都">成都</option>
              <option value="南京">南京</option>
            </select>          </td>
        </tr>

        <tr height="20px" style="border-top:solid 1.5px #006393">
          <th width="20%" align="center" bgcolor="#D9FFFF">日期：</th>
          <td colspan="2" align="right">
            往&nbsp;&nbsp;&nbsp;&nbsp;  <input type="date" name="Ttime1" size="25" maxlength="35" style="border: #a6babc 1px solid;height:25px">
          </td>
          <td colspan="1" align="center" width="10%">
            返
          </td>
          <td colspan="2" align="left">
            <input type="text" name="Ttime2" size="25" maxlength="35" style="border: #a6babc 1px solid;height:25px">
          </td>
        </tr>
        <tr height="20" style="border-top:solid 1.5px #006393">
          <th width="23%" align="center" bgcolor="#D9FEFF">舱位：</th>
          <th  align="center" colspan="2" >
            <input type="radio" name="radilbutton" value="经济舱" checked><font color="red">经济舱</font>
          </th>
          <th  align="center" colspan="3" >
            <input type="radio" name="radilbutton" value="公务舱"><font color="red">公务舱</font>
          </th>
        </tr>
        <tr height="60" style="border-top:solid 1.5px #006393">
          <th colspan="6" align="center">
            <input type="submit" name="submit" value="机票查询" style="width: 100px;height: 40px;background-color: #f08503;border-radius: 10px;">
          </th>
        </tr>
      </table>
    </form>
  </div>
</div>
<div class="footer">
  <div class="footer_t">
    <p><span>友情链接：qq:2094606203 </span>|<span>投诉意见：邮箱地址：2094606203@qq.com</span></p></div>
  <div class="footer_b">
    <p>Copyright 1998-2013 youabc.cn All Rights Reserved</p>
  </div>
</div>
</body>
</html>
