<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 14:28
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
                    供应商管理
                </div>
            </div>
        </div>
    </div>

    <div class="row-content am-cf">

        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">供应商修改</div>
                        <div class="widget-function am-fr">
                            <a href="javascript:;" class="am-icon-cog"></a>
                        </div>
                    </div>
                    <div class="widget-body am-fr">

                        <form class="am-form tpl-form-border-form tpl-form-border-br" id="providerForm" name="providerForm" method="post" action="${pageContext.request.contextPath }/provider/modify">
                            <input type="hidden" name="id" value="${provider.id }"/>
                            <div class="am-form-group" >
                                <label for="proCode" class="am-u-sm-3 am-form-label">供应商编码：</label>
                                <div class="am-u-sm-6  am-u-sm-pull-3">
                                    <input type="text" class="tpl-form-input" name="proCode" id="proCode" value="${provider.proCode }" readonly="readonly">
                                </div>
                            </div>
                            <div class="am-form-group" >
                                <label for="proName" class="am-u-sm-3 am-form-label">供应商名称：</label>
                                <div class="am-u-sm-6 am-u-sm-pull-3 ">
                                    <input type="text" class="tpl-form-input" name="proName" id="proName" value="${provider.proName}">
                                </div>
                            </div>
                            <div class="am-form-group" >
                                <label for="proContact" class="am-u-sm-3 am-form-label">联系人：</label>
                                <div class="am-u-sm-6 am-u-sm-pull-3 ">
                                    <input type="text" class="tpl-form-input" name="proContact" id="proContact" value="${provider.proContact }">
                                    <font color="red"></font>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="proPhone" class="am-u-sm-3 am-form-label">联系电话：</label>
                                <div class="am-u-sm-6 am-u-sm-pull-3 ">
                                    <input type="text" name="proPhone" id="proPhone" value="${provider.proPhone }">
                                    <font color="red"></font>
                                </div>
                            </div>
                            <div>
                                <label for="proAddress" class="am-u-sm-3 am-form-label">联系地址：</label>
                                <div class="am-u-sm-6 am-u-sm-pull-3 ">
                                    <input type="text" name="proAddress" id="proAddress" value="${provider.proAddress}">
                                </div>
                            </div>
                            <div>
                                <label for="proFax" class="am-u-sm-3 am-form-label">传真：</label>
                                <div class="am-u-sm-6 am-u-sm-centered ">
                                    <input type="text" name="proFax" id="proFax" value="${provider.proFax }">
                                </div>
                            </div>
                            <div>
                                <label for="proDesc"  class="am-u-sm-3 am-form-label">描述：</label>
                                <div class="am-u-sm-6 am-u-sm-centered">
                                    <textarea class="" rows="3" name="proDesc" id="proDesc">${provider.proDesc}</textarea>
                                </div>
                              <%--  <div class="am-u-sm-9">
                                    <textarea type="text" rows="3" name="proDesc" id="proDesc" value="${provider.proDesc }"/>
                                </div>--%>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/providermodify.js"></script>
