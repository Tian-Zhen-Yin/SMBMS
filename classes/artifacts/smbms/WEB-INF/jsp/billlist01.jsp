<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/16/016
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/newhead.jsp" %>

<!-- 内容区域 -->

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
                        <div class="widget-title  am-cf">订单列表</div>
                    </div>

                    <div class="widget-body  am-fr">
                        <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                            <div class="am-form-group">
                                <div class="am-btn-toolbar" href="${pageContext.request.contextPath}/bill/toAdd">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button type="button" class="am-btn am-btn-default am-btn-success"><span
                                                class="am-icon-plus" onclick="javascript:add()"> </span> 新增订单
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form method="get" action="${pageContext.request.contextPath }/bill/billList">
                            <input name="method" value="query" class="input-text" type="hidden">
                            <input type="hidden" name="pageIndex" value="1"/>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                <div class="am-form-group tpl-table-list-select">
                                    <select data-am-selected="{btnSize: 'sm'}"  name="queryProviderId">
                                        <option value="0">--请选择供应商--</option>
                                        <c:if test="${providerList != null }">
                                            <c:forEach var="provider" items="${providerList}">
                                                <option
                                                        <c:if test="${provider.id == queryProviderId }">selected="selected"</c:if>
                                                        value="${provider.id}">${provider.proName}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                <div class="am-form-group tpl-table-list-select">
                                    <select data-am-selected="{btnSize: 'sm'}"  name="queryIsPayment">
                                        <option value="0">--是否付款--</option>
                                        <option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>未付款
                                        </option>
                                        <option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>已付款
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                    <input type="text" class="am-form-field" placeholder="商品名称："  name="queryProductName" value="${queryProductName }">
                                    <span class="am-input-group-btn">
                                 <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
                                         type="submit" >
                                 </button>
                                </span>
                                </div>
                            </div>

                        </form>

                        <div class="am-u-sm-12">
                            <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black "
                                   id="example-r">
                                <thead>
                                <tr>
                                    <th>订单编码</th>
                                    <th>商品名称</th>
                                    <th>供应商</th>
                                    <th>订单金额</th>
                                    <th>是否付款</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="bill" items="${billList }" varStatus="status">
                                    <tr>
                                        <td>
                                            <span>${bill.billCode}</span>
                                        </td>
                                        <td>
                                            <span>${bill.productName}</span>
                                        </td>
                                        <td>
                                            <span>${bill.providerName}</span>
                                        </td>
                                        <td>
                                            <span>${bill.totalPrice}</span>
                                        </td>
                                        <td>
					<span>
						<c:if test="${bill.isPayment == 1}">未付款</c:if>
						<c:if test="${bill.isPayment == 2}">已付款</c:if>
					</span>
                                        </td>
                                        <td>
					<span>
					<fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
                                        </td>
                                        <td>
                                            <span><a class="viewBill" href="javascript:;"
                                                     billid=${bill.id} billcc=${bill.billCode}>
                                                 <i class="am-icon-book"></i> 查看
                                            </a></span>
                                            <span> <a class="modifyBill"
                                                      billid=${bill.id} billcc=${bill.billCode }
                                                      billisp=${bill.isPayment }>  <i class="am-icon-pencil"></i> 编辑
                                                    </a>
                                            </span>
                                            <span><a class="deleteBill" billid=${bill.id} billcc=${bill.billCode}
                                                     billisp=${bill.isPayment}> <i
                                                    class="am-icon-trash"></i> 删除</a></span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!-- more data -->
                                </tbody>
                            </table>
                            <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
                            <c:import url="rollpage.jsp">
                                <c:param name="totalCount" value="${totalCount}"/>
                                <c:param name="currentPageNo" value="${currentPageNo}"/>
                                <c:param name="totalPageCount" value="${totalPageCount}"/>
                            </c:import>
                        </div>

                    </div>
                    <div class="zhezhao"></div>
                    <div class="remove" id="removeBi">
                        <div class="removerChid">
                            <h2>提示</h2>
                            <div class="removeMain">
                                <p>你确定要删除该订单吗？</p>
                                <a href="#" id="yes">确定</a>
                                <a href="#" id="no">取消</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="common/newfoot.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/billlist.js"></script>