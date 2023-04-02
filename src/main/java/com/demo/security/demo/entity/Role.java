package com.demo.security.demo.entity;

import lombok.Data;

import javax.persistence.*;


@Entity
@Data
@Table(name = "role", schema = "demo_svc")
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "demo_svc.role_seq_gen")
    @SequenceGenerator(name = "demo_svc.role_seq_gen", sequenceName = "demo_svc.role_seq", schema = "demo_svc",
            allocationSize = 1)
    private long id;

    @Column(name = "role")
    private String role;

    @Column(name = "role_desc")
    private String roleDesc;
}
