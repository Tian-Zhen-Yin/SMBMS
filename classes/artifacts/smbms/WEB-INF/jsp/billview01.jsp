<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 0:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/newhead.jsp"%>
<div class="tpl-content-wrapper">

    <div class="container-fluid am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                <div class="page-header-heading"><span class="am-icon-first-order page-header-heading-icon"></span> 订单管理 </div>
            </div>
        </div>
    </div>

    <div class="row-content am-cf">

        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">订单查看</div>
                        <div class="widget-function am-fr">
                            <a href="javascript:;" class="am-icon-cog"></a>
                        </div>
                    </div>
                    <div class="widget-body am-fr">
                        <p><strong>订单编号：</strong><span>${bill.billCode }</span></p>
                        <p><strong>商品名称：</strong><span>${bill.productName }</span></p>
                        <p><strong>商品单位：</strong><span>${bill.productUnit }</span></p>
                        <p><strong>商品数量：</strong><span>${bill.productCount }</span></p>
                        <p><strong>总金额：</strong><span>${bill.totalPrice }</span></p>
                        <p><strong>供应商：</strong><span>${bill.providerName }</span></p>
                        <p><strong>是否付款：</strong>
                            <span>
         		<c:if test="${bill.isPayment == 1}">未付款</c:if>
				<c:if test="${bill.isPayment == 2}">已付款</c:if>
			</span>
                        </p>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/billview.js"></script>