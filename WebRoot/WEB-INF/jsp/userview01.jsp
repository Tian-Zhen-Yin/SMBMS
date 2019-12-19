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
                        <div class="widget-title am-fl">用户查看</div>
                        <div class="widget-function am-fr">
                            <a href="javascript:;" class="am-icon-cog"></a>
                        </div>
                    </div>
                    <div class="providerView">
                        <p><strong>用户编号：</strong><span>${user.userCode }</span></p>
                        <p><strong>用户名称：</strong><span>${user.userName }</span></p>
                        <p><strong>用户性别：</strong>
                            <span>
            		<c:if test="${user.gender == 1 }">男</c:if>
					<c:if test="${user.gender == 2 }">女</c:if>
				</span>
                        </p>
                        <p><strong>出生日期：</strong><span>${user.birthday }</span></p>
                        <p><strong>用户电话：</strong><span>${user.phone }</span></p>
                        <p><strong>用户地址：</strong><span>${user.address }</span></p>
                        <p><strong>用户角色：</strong><span>${user.roleName}</span></p>
                        <div class="providerAddBtn">
                            <input type="button" id="back" name="back" value="返回" >
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<%@include file="common/newfoot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/userview.js"></script>
