package ksd.smbms.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksd.smbms.user.mapper.ProviderMapper;
import ksd.smbms.user.pojo.Provider;
import ksd.smbms.user.service.ProviderService;


@Service("providerService")
public class ProviderServiceImpl implements ProviderService {
	
	@Resource
	private ProviderMapper providerMapper;

	/*@Override
	public List<Provider> getProviderList(String queryProName,
			String queryProCode,int currentPageNo, int pageSize) {
		// TODO Auto-generated method stub
		return providerMapper.getProviderList(queryProName, queryProCode,currentPageNo,pageSize);
	}
	*/
	@Override
	public List<Provider> getProviderList(String proName,String proCode,int currentPageNo, int pageSize) {
		return providerMapper.getProviderList(proName, proCode,currentPageNo,pageSize);
	}

	@Override
	public Provider findById(int uid) {
		// TODO Auto-generated method stub
		return providerMapper.findById(uid);
	}

	@Override
	public int modifyProvider(Provider provider) {
		// TODO Auto-generated method stub
		return providerMapper.modifyProvider(provider);
	}

	@Override
	public Provider getProviderById(String proid) {
		// TODO Auto-generated method stub
		return providerMapper.getProviderById(proid);
	}

	@Override
	public int deleteProvider(int proid) {
		// TODO Auto-generated method stub
		return providerMapper.deleteProvider(proid);
	}

	@Override
	public void addProvider(Provider provider) {
		// TODO Auto-generated method stub
		providerMapper.addProvider(provider);
	}

	@Override
	public int getProviderCount(String proName, String proCode) {
		// TODO Auto-generated method stub
		return providerMapper.getProviderCount(proName,proCode);
	}

	@Override
	public List<Provider> findAll() {
		// TODO Auto-generated method stub
		return providerMapper.findAll();
	}

	@Override
	public int findCount(int proid) {
		// TODO Auto-generated method stub
		return providerMapper.findCount(proid);
	}

	@Override
	public String checkProviderCode(String proCode) {
		// TODO Auto-generated method stub
		return providerMapper.checkProviderCode(proCode);
	}

	@Override
	public String checkProviderName(String proName) {
		// TODO Auto-generated method stub
		return providerMapper.checkProviderName(proName);
	}







	
	
	
	



}
