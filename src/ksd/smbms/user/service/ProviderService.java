package ksd.smbms.user.service;

import java.util.List;

import ksd.smbms.user.pojo.Provider;
import ksd.smbms.user.pojo.User;

public interface ProviderService {

	public List<Provider> getProviderList(String queryProName,
			String queryProCode,int currentPageNo, int pageSize);
	
	public Provider findById(int proid);
	
	public int modifyProvider(Provider provider);

	public Provider getProviderById(String id);
	
	public int deleteProvider(int proid);
	
	public void addProvider(Provider provider);

	public int getProviderCount(String queryProName, String queryProCode);
	
	public List<Provider> findAll();

	public int findCount(int proid);

	public String checkProviderCode(String proCode);

	public String checkProviderName(String proName);
	
}
