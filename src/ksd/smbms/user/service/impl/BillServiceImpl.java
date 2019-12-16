package ksd.smbms.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksd.smbms.user.mapper.BillMapper;
import ksd.smbms.user.pojo.Bill;
import ksd.smbms.user.service.BillService;


@Service("billService")
public class BillServiceImpl implements BillService{

	@Resource
	private BillMapper billMapper;
	
	
	@Override
	public int getBillCount(String queryproductname, int queryproviderid, int ispayment) {
		// TODO Auto-generated method stub
		return billMapper.getBillCount(queryproductname,queryproviderid,ispayment);
	}


	@Override
	public List<Bill> getBillList(String queryproductname, int queryproviderid,
			int ispayment, int currentPageNo, int pageSize) {
		// TODO Auto-generated method stub
		return billMapper.getBillList(queryproductname,  queryproviderid,
				 ispayment,  currentPageNo,  pageSize);
	}


	@Override
	public Bill findById(String billid) {
		// TODO Auto-generated method stub
		return billMapper.findById(billid);
	}


	@Override
	public int modify(Bill bill) {
		// TODO Auto-generated method stub
		return billMapper.modify(bill);
	}


	@Override
	public int getBillCountByProviderId(String providerId) {
		// TODO Auto-generated method stub
		return billMapper.getBillCountByProviderId(providerId);
	}


	@Override
	public int deleteBillById(String delId) {
		// TODO Auto-generated method stub
		return billMapper.deleteBillById(delId);
	}


	@Override
	public int addBill(Bill bill) {
		// TODO Auto-generated method stub
		return billMapper.addBill(bill);
	}


	@Override
	public String checkBillName(String billCode) {
		// TODO Auto-generated method stub
		return billMapper.checkBillName(billCode);
	}
	
}
