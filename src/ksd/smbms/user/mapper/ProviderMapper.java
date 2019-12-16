package ksd.smbms.user.mapper;

import java.util.List;

import ksd.smbms.user.pojo.Provider;

import org.apache.ibatis.annotations.Param;

public interface ProviderMapper {
	
	public List<Provider> getProviderList(@Param("proName")String proName,
	          @Param("proCode")String proCode,
	          @Param("currentPageNo")int currentPageNo, 
			  @Param("pageSize")int pageSize);

	public Provider findById(int proid);

	public int modifyProvider(Provider provider);

	public Provider getProviderById(String proid);

	public int deleteProvider(int proid);

	public void addProvider(Provider provider);

	public int getProviderCount(@Param("proName")String proName,
	          @Param("proCode")String proCode);

	public List<Provider> findAll();

	public int findCount(int proid);

	public String checkProviderCode(String proCode);

	public String checkProviderName(String proName);


	
}
