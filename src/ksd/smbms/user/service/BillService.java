package ksd.smbms.user.service;

import java.util.List;

import ksd.smbms.user.pojo.Bill;

public interface BillService {

	int getBillCount(String queryproductname, int queryproviderid, int ispayment);

	List<Bill> getBillList(String queryproductname, int queryproviderid, int ispayment,
			int currentPageNo, int pageSize);

	Bill findById(String billid);
	
	int modify(Bill bill);

	int getBillCountByProviderId(String providerId);
	
	int deleteBillById(String delId);

	int addBill(Bill bill);

	String checkBillName(String billCode);
}
