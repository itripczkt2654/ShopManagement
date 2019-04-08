<%--
  Created by IntelliJ IDEA.
  User: Super
  Date: 2019/3/20
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   <%--c标签引入--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <%--日期格式化引入--%>
<html>
<head>
    <title>购买商品页面</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.min.js"></script>
    <script>
            function calcPrice(){
                var price = parseFloat($("input[name='price']").val());  //单价
                var number = parseInt($("#num").val());  //购买数量
                $("input[name='totalPirce']").val(price * number);  //单价 * 数量 = 计算总金额
                $("input[name='remaining']").val($("input[name='remaining']").val() - number);  //计算商品剩余的数量
            }
    </script>
    <style>
        .containter{
            width:610px;
            height:360px;
            margin: 0px auto;  /*让containter类选择器的div保持水平居中*/
            text-align: center;   /*让文本居中*/
        }
        .c{
            text-align: center;   /*让文本居中*/
        }
        table{wdith:100%;}
    </style>
</head>
<body>

    <div class="containter">
        <form id="myform" action="${pageContext.request.contextPath}/goods/updateGoods">
            <table border="1">
                <tr>
                    <td colspan="2"><h1>购买商品</h1></td>
                </tr>

                <tr>
                    <td>商品编号</td>
                    <td>
                        <input type="text" name="id" value="${goodsDeatil.id}" readonly="readonly"/> <%--readonly="readonly"是设为只读--%>
                    </td>
                </tr>
                <tr>
                    <td>商品名字</td>
                    <td>${goodsDeatil.name}</td>
                </tr>
                <tr>
                    <td>商品分类</td>
                    <td>${goodsDeatil.goodsSort.name}</td>
                </tr>
                <tr>
                    <td>商品单价</td>
                    <td>
                        <input type="text" name="price" value="${goodsDeatil.price}" readonly="readonly"/> <%--readonly="readonly"是设为只读--%>
                    </td>
                </tr>
                <tr>
                    <td>剩余数量</td>
                    <td>
                        <input type="text" name="remaining" value="${goodsDeatil.remaining}" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>购买数量</td>
                    <td>
                        <input type="text" id="num" onblur="calcPrice()"/>
                    </td>
                </tr>
                <tr>
                    <td>总金额</td>
                    <td>
                        <input type="text" name="totalPirce"/>
                    </td>
                </tr>

                <tr class="c">
                    <td colspan="2">
                        <input type="submit" value="购买"/>
                        <input type="button" value="返回" onclick="javascript:location.href='${pageContext.request.contextPath}/goods/list'" />
                    </td>
                </tr>

            </table>
        </form>
    </div>

</body>
</html>
