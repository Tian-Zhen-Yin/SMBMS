<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/newhead.jsp" %>

<div class="tpl-content-wrapper">

    <div class="container-fluid am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                <div class="page-header-heading"><span class="am-icon-first-order page-header-heading-icon"></span>
                   用户管理
                </div>
            </div>
        </div>
    </div>

    <div class="row-content am-cf">

        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">信息修改</div>
                        <div class="widget-function am-fr">
                            <a href="javascript:;" class="am-icon-cog"></a>
                        </div>
                    </div>
                    <div class="widget-body am-fr">

                        <form class="am-form tpl-form-border-form tpl-form-border-br" id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/modify">
                            <input type="hidden" name="method" value="modifyexe">
                            <input type="hidden" name="id" value="${user.id }"/>
                            <div class="am-form-group" >
                                <label for="userName" class="am-u-sm-3 am-form-label">用户名称：</label>
                                <div class="am-u-sm-6  am-u-sm-pull-3">
                                    <input type="text" class="tpl-form-input" name="userName" id="userName" value="${user.userName }" readonly="readonly">
                                    <font color="red"></font>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="gender" class="am-u-sm-3 am-form-label">用户性别：</label>
                                <div class="am-u-sm-6 am-u-sm-centered ">
                                <select name="gender" id="gender" style="background-color: rgb(102, 102, 102)">
                                    <c:choose>
                                        <c:when test="${user.gender == 1 }">
                                            <option value="1" selected="selected">男</option>
                                            <option value="2">女</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">男</option>
                                            <option value="2" selected="selected">女</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="data" class="am-u-sm-3 am-form-label">出生日期：</label>
                                <div class="am-u-sm-6 am-u-sm-pull-3 ">
                                    <input type="text" id="birthday" name="birthday"
                                           value="<fmt:formatDate value='${user.birthday }' pattern='yyyy-MM-dd'/>"
                                           readonly="readonly"  class="am-form-field tpl-form-no-bg" data-am-datepicker="" >
                                    <font color="red"></font>
                                </div>

                            </div>

                            <div class="am-form-group">
                                <label  class="am-u-sm-3 am-form-label">用户电话：</label>
                                <div class="am-u-sm-6 am-u-sm-pull-3 ">
                                    <input type="text"name="phone" id="phone" value="${user.phone }">
                                    <font color="red"></font>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="address" class="am-u-sm-3 am-form-label">用户地址：</label>
                                <div class="am-u-sm-6 am-u-sm-pull-3 ">
                                    <input type="text" name="address" id="address" value="${user.address }">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label  for="userRole" class="am-u-sm-3 am-form-label">用户角色：</label>
                                <!-- 列出所有的角色分类 -->
                                <input type="hidden" value="${user.userRole }" id="rid" />
                                <div class="am-u-sm-6 am-u-sm-centered ">
                                <select name="userRole" id="userRole" style="background-color: rgb(102, 102, 102)"></select>
                                <font color="red"></font>
                                </div>
                            </div>

                            <div class="providerAddBtn">
                                <input type="button" name="save" id="save" value="保存" onclick="add()">
                                <input type="button" id="back" name="back" value="返回" >
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%@include file="common/newfoot.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/usermodify.js"></script>
