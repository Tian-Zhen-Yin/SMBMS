package ksd.smbms.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ksd.smbms.user.pojo.Bill;

public interface BillMapper {

	int getBillCount(@Param("productName")String productName, @Param("providerId")int providerId, @Param("isPayment")int isPayment);

	List<Bill> getBillList(@Param("productName")String productName, @Param("providerId")int providerId, @Param("isPayment")int isPayment,
			@Param("currentPageNo")int currentPageNo, 
			  @Param("pageSize")int pageSize);

	Bill findById(String billid);

	int modify(Bill bill);

	int getBillCountByProviderId(String providerId);

	int deleteBillById(String delId);

	int addBill(Bill bill);

	String checkBillName(String billCode);

}
