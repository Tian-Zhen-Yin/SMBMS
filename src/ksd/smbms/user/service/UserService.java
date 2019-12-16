package ksd.smbms.user.service;

import java.util.List;

import ksd.smbms.user.pojo.User;



public interface UserService {
	public User login(String userCode,String userPassword);

	public List<User> findAll(String queryUserName,int queryUserRole,int currentPageNo, int pageSize);
	
	public int getUserCount(String queryUserName,int queryUserRole);

	public void addUser(User user);

	public void deleteUser(int uid);

	public String checkName(String userCode);
	
	public User findById(int uid);
	
	public int modifyUser(User user);

	public User getUserById(int uid);

	public int updatePwd(int id,String pwd);
}
