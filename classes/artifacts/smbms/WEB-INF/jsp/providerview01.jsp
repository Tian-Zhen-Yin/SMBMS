<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 14:27
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
                        <div class="widget-title am-fl">供应商查看</div>
                        <div class="widget-function am-fr">
                            <a href="javascript:;" class="am-icon-cog"></a>
                        </div>
                    </div>
                    <div class="providerView">
                        <p><strong>供应商编码：</strong><span>${provider.proCode }</span></p>
                        <p><strong>供应商名称：</strong><span>${provider.proName }</span></p>
                        <p><strong>联系人：</strong><span>${provider.proContact }</span></p>
                        <p><strong>联系电话：</strong><span>${provider.proPhone }</span></p>
                        <p><strong>传真：</strong><span>${provider.proFax }</span></p>
                        <p><strong>描述：</strong><span>${provider.proDesc}</span></p>
                        <div class="providerAddBtn">
                            <input type="button" id="back" name="back" value="返回">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<%@include file="common/newfoot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/providerview.js"></script>
