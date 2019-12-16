package ksd.smbms.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ksd.smbms.user.pojo.User;



public interface UserMapper {
	public User login(String userCode,String userPassword);

	public List<User> findAll(@Param("userName")String userName,
			  @Param("userRole")int userRole,
			  @Param("currentPageNo")int currentPageNo, 
			  @Param("pageSize")int pageSize);
	
	public int getUserCount(@Param("userName")String userName,
			@Param("userRole")int userRole);

	public void addUser(User user);

	public void deleteUser(int uid);

	public String checkName(String userCode);

	public User findById(int uid);

	public int modifyUser(User user);

	public User getUserById(int uid);

	public int updatePwd(@Param("id")int id,
			 @Param("pwd")String pwd);
}
