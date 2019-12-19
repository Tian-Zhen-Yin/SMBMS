<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/newhead.jsp" %>
<div class="tpl-content-wrapper">
    <div class="container-fluid am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                <div class="page-header-heading"><span class="am-icon-first-order page-header-heading-icon"></span> 供应商管理</div>
            </div>
        </div>
    </div>

    <div class="row-content am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title  am-cf">供应商列表</div>
                    </div>

                    <div class="widget-body  am-fr">
                        <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                            <div class="am-form-group">
                                <div class="am-btn-toolbar" href="${pageContext.request.contextPath}/bill/toAdd">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button type="button" class="am-btn am-btn-default am-btn-success"><span
                                                class="am-icon-plus" onclick="javascript:add()"> </span> 添加供应商
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form method="get" action="${pageContext.request.contextPath }/provider/providerList">
                            <input name="method" value="query" class="input-text" type="hidden">
                            <input type="hidden" name="pageIndex" value="1"/>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-push-3 ">
                                <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                    <input type="text" class="am-form-field" placeholder="供应商编码"  name="queryProCode" value="${queryProCode }">
                                </div>
                            </div>

                            <div class="am-u-sm-12 am-u-md-12 am-u-lg-3 ">
                                <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                    <input type="text" class="am-form-field" placeholder="供应商名称"  name="queryProName" value="${queryProName }">
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
                                    <th width="10%">供应商编码</th>
                                    <th width="30%">供应商名称</th>
                                    <th width="10%">联系人</th>
                                    <th width="10%">联系电话</th>
                                    <th width="10%">传真</th>
                                    <th width="10%">创建时间</th>
                                    <th width="20%">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="provider" items="${providerList }" varStatus="status">
                                <tr>
                                    <td>
                                        <span>${provider.proCode }</span>
                                    </td>
                                    <td>
                                        <span>${provider.proName }</span>
                                    </td>
                                    <td>
                                        <span>${provider.proContact}</span>
                                    </td>
                                    <td>
                                        <span>${provider.proPhone}</span>
                                    </td>
                                    <td>
                                        <span>${provider.proFax}</span>
                                    </td>
                                    <td>
					<span>
					<fmt:formatDate value="${provider.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
                                    </td>
                                    <td>
                                         <span><a class="viewProvider" href="javascript:;"
                                                  proid=${provider.id } proname=${provider.proName }></i> 查看
                                            </a></span>
                                        <span> <a class="modifyProvider"  href="javascript:;"
                                                  proid=${provider.id } proname=${provider.proName }>  <i class="am-icon-pencil"></i> 编辑
                                                    </a>
                                            </span>
                                        <span><a class="deleteProvider"  href="javascript:;" proid=${provider.id } proname=${provider.proName }> <i
                                                class="am-icon-trash"></i> 删除</a></span>
                                    </td>
                                </tr>
                                </c:forEach>
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
                    <div class="remove" id="removeProv">
                        <div class="removerChid">
                            <h2>提示</h2>
                            <div class="removeMain" >
                                <p>你确定要删除该供应商吗？</p>
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
<script>
    function add(){
        window.location.href="${pageContext.request.contextPath}/provider/toAdd";
    }

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/providerlist.js"></script>
