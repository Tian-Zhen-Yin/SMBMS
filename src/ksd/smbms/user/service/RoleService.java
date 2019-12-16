package ksd.smbms.user.service;

import java.util.List;

import ksd.smbms.user.pojo.Role;


public interface RoleService {
	public List<Role> findAllRole();

	public List<Role> getRoleList();
}
