package ksd.smbms.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksd.smbms.user.mapper.RoleMapper;
import ksd.smbms.user.mapper.UserMapper;
import ksd.smbms.user.pojo.Role;
import ksd.smbms.user.service.RoleService;
@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> findAllRole() {
		// TODO Auto-generated method stub
		return roleMapper.findAllRole();
	}

	@Override
	public List<Role> getRoleList() {
		// TODO Auto-generated method stub
		return roleMapper.getRoleList();
	}

}
