package ksd.smbms.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksd.smbms.user.mapper.UserMapper;
import ksd.smbms.user.pojo.User;
import ksd.smbms.user.service.UserService;



	@Service("userService")
	public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;

	@Override
	public User login(String userCode, String userPassword) {
		// TODO Auto-generated method stub
		return userMapper.login(userCode,userPassword);
	}

	@Override
	public int getUserCount(String userName, int userRole) {
		return  userMapper.getUserCount(userName, userRole);
	}
	@Override
	public List<User> findAll(String queryUserName, int queryUserRole,
			int currentPageNo, int pageSize) {
		// TODO Auto-generated method stub
		return userMapper.findAll(queryUserName, queryUserRole, currentPageNo, pageSize);
	}


	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}

	@Override
	public void deleteUser(int uid) {
		// TODO Auto-generated method stub
		userMapper.deleteUser(uid);
	}

	@Override
	public String checkName(String userCode) {
		// TODO Auto-generated method stub
		return userMapper.checkName(userCode);
	}

	@Override
	public User findById(int uid) {
		// TODO Auto-generated method stub
		return userMapper.findById(uid);
	}

	@Override
	public int modifyUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.modifyUser(user);
	}

	@Override
	public User getUserById(int uid) {
		// TODO Auto-generated method stub
		return userMapper.getUserById(uid);
	}

	@Override
	public int updatePwd(int id, String pwd) {
		// TODO Auto-generated method stub
		return userMapper.updatePwd(id,pwd);
	}

	
}
