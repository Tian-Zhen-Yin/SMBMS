package ksd.smbms.user.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import ksd.smbms.user.pojo.Bill;
import ksd.smbms.user.pojo.Provider;
import ksd.smbms.user.pojo.Role;
import ksd.smbms.user.pojo.User;
import ksd.smbms.user.service.BillService;
import ksd.smbms.user.service.ProviderService;
import ksd.smbms.user.tools.Constants;
import ksd.smbms.user.tools.PageSupport;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;


@Controller
@RequestMapping("/bill")
public class BillController {
	@Resource(name="billService")
	private BillService billService;
	@Resource(name="providerService")
	private ProviderService providerService;
	
	@RequestMapping("/billList")
	public String  billList(Model model
			,@RequestParam(value = "queryProductName",required= false) String productname
			,@RequestParam(value="queryProviderId",required= false)String providerId
			,@RequestParam(value="queryIsPayment",required= false)String isPayment
			,@RequestParam(value="pageIndex",required=false)Integer pageIndex
			){
		//,@RequestParam( value = "pageIndex",required= false) String pageIndex
		int providerid =0; //角色id
		int ispayment=0;
		List<Bill> billList = null;//查询订单的集合
		int pageSize = Constants.pageSize;//页面容量
		int currentpage=1;  //从第一页开始

		//如果产品名为空  就设置成空字符串
		if(productname == null){
			productname = "";
		}
		//如果用户角色不为空 或者不为空字符串
		if(isPayment != null && !isPayment.equals("")){ 
			//就把角色id赋值给当前角色id
			ispayment = Integer.parseInt(isPayment);
		}
		if(providerId != null && !providerId.equals("")){ 
			//就把角色id赋值给当前角色id
			providerid = Integer.parseInt(providerId);
		}
		if(pageIndex != null){
			try{ 
				//当前页码等于传过来的页码     
				currentpage = Integer.valueOf(pageIndex);
			}catch(NumberFormatException e){
				//否则就跳转到错误页面
				return  "redirect:/user/syserror.html";
			}
		}
		//获取查询到的所有记录数
		int totalCount 	= billService.getBillCount(productname, providerid, ispayment);
		PageSupport pages=new PageSupport();
		pages.setCurrentPageNo(currentpage);//当前页
		pages.setPageSize(pageSize); //页面容量
		pages.setTotalCount(totalCount);//总记录数
		int totalPageCount = pages.getTotalPageCount(); //总页数
		//控制首页和尾页
		if(currentpage < 1){   //如果当前页码小于1 就等于1
			currentpage = 1;
		}else if(currentpage > totalPageCount){ //如果当前页码大于总页数  就等于总页数
			currentpage = totalPageCount;
		}
		billList = billService.getBillList(productname,providerid,ispayment,((currentpage-1)*pageSize), pageSize);
		model.addAttribute("billList", billList);
		List<Provider> providerList=providerService.findAll();
		model.addAttribute("providerList",providerList);
		model.addAttribute("queryIsPayment",ispayment);
		model.addAttribute("queryProductName", productname);//用于数据回显    用户名
		model.addAttribute("queryProviderId", providerid); //用于数据回显    角色id
		model.addAttribute("totalPageCount", totalPageCount);// 总页数
		model.addAttribute("totalCount", totalCount); //查找到的总记录数
		model.addAttribute("currentPageNo", currentpage);//当前页码
		return "billlist";
	}
	 /*@ModelAttribute("providerList")
		public List<Provider> getProviderList(Model model) {
			List<Provider> providerList = providerService.findAll();
			return providerList;
		 }*/
	 /**
		 * 查看
		 */
		@RequestMapping("/findById")
		public String findById(String billid,Model model){
			Bill bill=billService.findById(billid);
			model.addAttribute("bill", bill);
			return "billview";
		}
		/**
		 * 修改
		 */
		@RequestMapping("/toModify")
		public String toModify (String billid, Model model) {
			Bill bill = billService.findById(billid);
			
			model.addAttribute("bill", bill);
			return "billmodify";
		}
		
		@RequestMapping("/modify")
		public String modify(Bill bill,HttpSession session) {
			bill.setModifyDate(new Date());
			int num  = billService.modify(bill);
			if(num > 0){
				return "redirect:billList";
			}
			return "billmodify";
		}
		/**
		 * 删除
		 */
		@RequestMapping("/deleteBill")
		@ResponseBody
		public String deleteBill(@RequestParam("billid")String id,Map<String,Object> resultMap){
			if(!StringUtils.isEmpty(id)){
				int num = billService.deleteBillById(id);
				if(num > 0){//删除成功
					resultMap.put("delResult", "true");
				}else{//删除失败
					resultMap.put("delResult", "false");
				}
			}else{
				resultMap.put("delResult", "notexit");
			}
			//把resultMap转换成json对象输出
			return JSON.toJSONString(resultMap);
		}
		@RequestMapping(value="/toAdd")
		public String toAdd(){
			return "billadd";
		}
		/**
		 * 执行增加
		 */
		@RequestMapping(value="/addBill")
		public String addProvider(Bill bill){
			Date da=new Date(new java.util.Date().getTime());
			bill.setCreationDate(da);
			billService.addBill(bill);
			return "redirect:billList";
		}
		/**
		 * 验证订单编号唯一性
		 */
		@RequestMapping(value="/checkBillName",
				method=RequestMethod.GET,
			produces="text/html;charset=utf-8")
		@ResponseBody
		public String checkName(@RequestParam("billCode") String billCode){
			String code =billService.checkBillName(billCode);
			String jsonString = null;
			if (billCode==null||billCode=="") {
				jsonString= JSON.toJSONString("false");
			}else{
				if(code != null){
					jsonString= JSON.toJSONString("exist");
				}else{
					jsonString = JSON.toJSONString("noExist");
				}
			}
			
			return jsonString;
		}
}
