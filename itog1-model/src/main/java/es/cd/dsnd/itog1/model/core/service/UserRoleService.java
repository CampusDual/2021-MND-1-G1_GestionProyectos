package es.cd.dsnd.itog1.model.core.service;


import java.sql.Timestamp;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import es.cd.dsnd.itog1.api.core.service.IUserRoleService;
import es.cd.dsnd.itog1.model.core.dao.UserRoleDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;


@Lazy
@Service("UserRoleService")
public class UserRoleService implements IUserRoleService {

	@Autowired
	private UserRoleDao userRoleDao;

	@Autowired
	private DefaultOntimizeDaoHelper daoHelper;

	public void loginQuery(Map<?, ?> key, List<?> attr) {
	}

	//Sample to permission
	//@Secured({ PermissionsProviderSecured.SECURED })
	public EntityResult userQuery(Map<?, ?> keyMap, List<?> attrList) {
		return this.daoHelper.query(userRoleDao, keyMap, attrList);
	}

	public EntityResult userInsert(Map<?, ?> attrMap) {
		return this.daoHelper.insert(userRoleDao, attrMap);
	}

	public EntityResult userUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
		return this.daoHelper.update(userRoleDao, attrMap, keyMap);
	}

	public EntityResult userDelete(Map<?, ?> keyMap) {
		Map<Object, Object> attrMap = new HashMap<>();
		attrMap.put("user_down_date", new Timestamp(Calendar.getInstance().getTimeInMillis()));
		return this.daoHelper.update(this.userRoleDao, attrMap, keyMap);
	}

}
