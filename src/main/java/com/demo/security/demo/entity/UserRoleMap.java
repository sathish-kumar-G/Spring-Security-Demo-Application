package com.demo.security.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "user_role_map",schema = "demo_svc")
public class UserRoleMap {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "demo_svc.user_seq_gen")
    @SequenceGenerator(name = "demo_svc.user_seq_gen", sequenceName = "demo_svc.user_seq", schema = "demo_svc",
            allocationSize = 1)
    private long id;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User userId;

    @OneToOne
    @JoinColumn(name = "role_id")
    private Role roleId;
}
