<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/newhead.jsp"%>

<div class="tpl-content-wrapper">

    <div class="container-fluid am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                <div class="page-header-heading"><span class="am-icon-first-order page-header-heading-icon"></span> 订单管理</div>
            </div>
        </div>
    </div>

    <div class="row-content am-cf">

          <div class="row">

              <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                  <div class="widget am-cf">
                      <div class="widget-head am-cf">
                          <div class="widget-title am-fl">订单修改</div>
                          <div class="widget-function am-fr">
                              <a href="javascript:;" class="am-icon-cog"></a>
                          </div>
                      </div>
                      <div class="widget-body am-fr">

                          <form class="am-form tpl-form-border-form tpl-form-border-br" id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/bill/modify">
                              <input type="hidden" name="method" value="modifysave">
                              <input type="hidden" name="id" value="${bill.id }">
                              <div class="am-form-group" >
                                  <label for="billCode" class="am-u-sm-3 am-form-label">订单编码：</label>
                                  <div class="am-u-sm-6 am-u-sm-centered ">
                                      <input type="text" class="tpl-form-input" id="user-name" name="billCode" id="billCode" value="${bill.billCode }" readonly="readonly">
                                  </div>
                              </div>
                              <div class="am-form-group" >
                                  <label for="productName" class="am-u-sm-3 am-form-label">商品名称：</label>
                                  <div class="am-u-sm-6 am-u-sm-centered ">
                                      <input type="text" class="tpl-form-input" name="productName" id="productName" value="${bill.productName }">
                                  </div>
                              </div>
                              <div class="am-form-group" >
                                  <label for="productUnit" class="am-u-sm-3 am-form-label">商品单位：</label>
                                  <div class="am-u-sm-6 am-u-sm-centered ">
                                      <input type="text" class="tpl-form-input" name="productUnit" id="productUnit" value="${bill.productUnit }">
                                      <font color="red"></font>
                                  </div>
                              </div>

                              <div>
                                  <label for="productCount" class="am-u-sm-3 am-form-label">商品数量：</label>
                                  <div class="am-u-sm-6 am-u-sm-centered ">
                                    <input type="text" name="productCount" id="productCount" value="${bill.productCount }">
                                      <font color="red"></font>
                                  </div>

                              </div>
                              <div>
                                  <label for="totalPrice" class="am-u-sm-3 am-form-label">总金额：</label>
                                  <div class="am-u-sm-6 am-u-sm-centered ">
                                  <input type="text" name="totalPrice" id="totalPrice" value="${bill.totalPrice }">
                                  <font color="red"></font>
                                  </div>
                              </div>
                              <div class="am-form-group">
                                  <label for="providerId" class="am-u-sm-3 am-form-label">供应商：</label>
                                  <input type="hidden" value="${bill.providerId }" id="pid" />
                                  <div class="am-u-sm-6 am-u-sm-centered ">
                                      <select name="providerId" id="providerId" style="background-color: rgb(102, 102, 102)">
                                      </select>
                                      <font color="red"></font>
                                  </div>
                              </div>
                              <div class="am-form-group">
                                  <label  class="am-u-sm-3 am-form-label">是否付款：</label>
                                  <div class="am-u-sm-6 am-u-sm-centered ">
                                      <c:if test="${bill.isPayment == 1 }">
                                          <input type="radio" name="isPayment" value="1" checked="checked">未付款
                                          <input type="radio" name="isPayment" value="2" >已付款
                                      </c:if>
                                      <c:if test="${bill.isPayment == 2 }">
                                          <input type="radio" name="isPayment" value="1">未付款
                                          <input type="radio" name="isPayment" value="2" checked="checked">已付款
                                      </c:if>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/billmodify.js"></script>
