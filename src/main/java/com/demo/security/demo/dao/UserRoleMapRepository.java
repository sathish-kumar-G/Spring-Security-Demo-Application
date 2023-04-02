package com.demo.security.demo.dao;

import com.demo.security.demo.entity.UserRoleMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleMapRepository extends JpaRepository<UserRoleMap,Long> {
}
