package ksd.smbms.user.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import ksd.smbms.user.pojo.Provider;
import ksd.smbms.user.pojo.Role;
import ksd.smbms.user.pojo.User;
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
@RequestMapping("/provider")
public class ProviderController {
	@Resource(name="providerService")
	private ProviderService providerService;
	
	
	/**
	 * 供应商界面
	 * @return
	 */
	@RequestMapping(value="/providerList")
	public String providerList(@RequestParam(value="queryProName",required=false,defaultValue="")String queryProName,  
			@RequestParam(value="queryProCode",required=false,defaultValue="")String queryProCode,
			@RequestParam(value="pageIndex",required=false,defaultValue="1")Integer currentPageNo,
			Model model){
		//查询用户列表
				List<Provider> providerList = null;
				//设置页面容量
				int pageSize = Constants.pageSize;
				//总数量（表）	
				int totalCount	= providerService.getProviderCount(queryProName,queryProCode);
				//总页数
				PageSupport pages=new PageSupport();
				pages.setCurrentPageNo(currentPageNo);
				pages.setPageSize(pageSize);
				pages.setTotalCount(totalCount);
				int totalPageCount = pages.getTotalPageCount();
				//控制首页和尾页
				if(currentPageNo < 1){
					currentPageNo = 1;
				}else if(currentPageNo > totalPageCount){
					currentPageNo = totalPageCount;
				}
				providerList = providerService.getProviderList(queryProName,queryProCode,(currentPageNo-1)*pageSize, pageSize);
				model.addAttribute("providerList", providerList);
				model.addAttribute("queryProName", queryProName);
				model.addAttribute("queryProCode", queryProCode);
				model.addAttribute("totalPageCount", totalPageCount);
				model.addAttribute("totalCount", totalCount);
				model.addAttribute("currentPageNo", currentPageNo);
				return "providerlist01";
	}

	/**
	 * 查看用户信息
	 */
	@RequestMapping("/findById")
	public String findById(int uid,Model model){
		Provider provider=providerService.findById(uid);
		model.addAttribute("provider", provider);
		return "providerview01";
	}
	/**
	 * 修改
	 */
	@RequestMapping("/toModify")
	public String toModify (String proid, Model model) {
		Provider provider = providerService.getProviderById(proid);
		model.addAttribute("provider", provider);
		return "providermodify01";
	}
	
	@RequestMapping("/modify")
	public String modify(Provider provider,HttpSession session) {
		provider.setModifyDate(new Date());
		int num  = providerService.modifyProvider(provider);
		if(num > 0){
			return "redirect:providerList";
		}
		return "providermodify01";
	}
	/**
	 * 删除用户
	 */
	/*@RequestMapping("/deleteProvider")
	@ResponseBody
	public String deleteProvider(int proid){
		providerService.deleteProvider(proid);
		String jsonString = JSON.toJSONString("true");
		return jsonString;
	}
	*/
	@RequestMapping("/deleteProvider")
	public @ResponseBody Object delete(int proid){
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(!StringUtils.isEmpty(proid)){
			int flag = providerService.findCount(proid);
			if(flag == 0){//没有订单，执行删除
				providerService.deleteProvider(proid);
				resultMap.put("delResult", "true");
			}else if(flag == -1){//删除失败
				resultMap.put("delResult", "false");
			}else if(flag > 0){//该供应商下有订单，不能删除，返回订单数
				resultMap.put("delResult", String.valueOf(flag));
			}
		}else{
			resultMap.put("delResult", "notexit");
		}
		return resultMap;
	}
	
	@RequestMapping(value="/toAdd")
	public String toAdd(){
		return "provideradd01";
	}
	/**
	 * 执行增加
	 */
	@RequestMapping(value="/addProvider")
	public String addProvider(Provider provider){
		Date da=new Date(new java.util.Date().getTime());
		provider.setCreationDate(da);
		providerService.addProvider(provider);
		return "redirect:providerList";
	}
	@RequestMapping("providerlist")
	@ResponseBody
	public String providerList() {
	 List<Provider> providerList = providerService.findAll();
		return JSONArray.toJSONString(providerList);
	}
	/**
	 * 验证供应商编号唯一性
	 */
	@RequestMapping(value="/checkProviderCode",
			method=RequestMethod.GET,
		produces="text/html;charset=utf-8")
	@ResponseBody
	public String checkName(@RequestParam("proCode") String proCode){
		String code =providerService.checkProviderCode(proCode);
		String jsonString = null;
		if (proCode==null||proCode=="") {
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
	/**
	 * 验证供应商名称唯一性
	 */
	@RequestMapping(value="/checkProviderName",
			method=RequestMethod.GET,
		produces="text/html;charset=utf-8")
	@ResponseBody
	public String checkproviderName(@RequestParam("proName") String proName){
		String code =providerService.checkProviderName(proName);
		String jsonString = null;
		if (proName==null||proName=="") {
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
