package ksd.smbms.user.mapper;

import java.util.List;

import ksd.smbms.user.pojo.Role;


public interface RoleMapper {
	public List<Role> findAllRole();

	public List<Role> getRoleList();
}
