<%--
  Created by IntelliJ IDEA.
  User: Super
  Date: 2019/3/19
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   <%--c标签引入--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <%--日期格式化引入--%>

<html>
<head>
    <title>商品列表页面 </title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.min.js"></script>
    <style>
        .container{
            width:610px;
            height:360px;
            margin: 0px auto;  /*让container类选择器的div保持水平居中*/
            text-align: center;   /*让文本居中*/
        }
        table{wdith:100%;}
    </style>
    <script>
        function pageNav(currPageNo){
            //将当前页码赋值给form表单的currPageNo  (<input type="hidden" name="currPageNo" value="1"/>)
            document.getElementById("myform").currPageNo.value = currPageNo;  /*myfrom对应下面的form标签里面的myform*/
            document.getElementById("myform").submit();  /*提交表单*/
        }
        //提交form表单
        function submitForm(){
            document.getElementById("myform").submit();  /*提交表单*/
        }
        $(function () {
           $("tr:even").css("background-color","yellow");
        });
    </script>
</head>
<body>
    <div class="container">

        <form id="myform" action="${pageContext.request.contextPath}/goods/list">
            <span>请选择商品分类</span>
            <%--submitForm()下拉框改变立马提交进行数据改变--%>
            <select name="sortId" onchange="submitForm()"> <%--sortId是GoodsController类里方法goodsList的ID值--%>
                <option value="0">全部</option>
                <c:forEach items="${sortList}" var="goods">  <%--${sortList}就是取到GoodsController里面的sortList的key值--%>
                    <c:choose>
                        <c:when test="${sortId eq goods.id}">
                            <option value="${goods.id}" selected="selected">${goods.name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${goods.id}">${goods.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
            <%--当前页码--%>
            <input type="hidden" name="currPageNo" value="1"/>
        </form>

        <table border="1">
            <tr>
                <th>商品编号</th>
                <th>商品名称</th>
                <th>商品分类</th>
                <th>产地</th>
                <th>生产日期</th>
                <th>单价(元)</th>
                <th>剩余数量</th>
                <th>购买</th>
            </tr>
            <c:forEach items="${goodsDetailList}" var="detail"> <%--goodsDetailList是GoodsController类里方法goodsList的goodsDetailList值--%>
                <tr>
                    <td>${detail.id}</td>
                    <td>${detail.name}</td>
                    <td>${detail.goodsSort.name}</td>
                    <td>${detail.address}</td>
                    <td>${detail.price}</td>
                    <td>
                            <fmt:formatDate value="${detail.createDate}" pattern="yyyy-MM-dd"/>  <%--日期格式化--%>
                    </td>
                    <td>${detail.remaining}</td>
                    <td><a href="${pageContext.request.contextPath}/goods/queryGoodsDetailById/${detail.id}">购买</a></td>
                </tr>
            </c:forEach>
        </table>

        <div class="pager">
            <a href="javascript:pageNav(${page.currPageNo})">首页</a>
            <a href="javascript:pageNav(${page.currPageNo - 1})">上一页</a>
            <a href="javascript:pageNav(${page.currPageNo + 1})">下一页</a>
            <a href="javascript:pageNav(${page.totalPageCount})">末页</a>
            <span>第${page.currPageNo}页/共${page.totalPageCount}页</span>
        </div>

    </div>
</body>
</html>
