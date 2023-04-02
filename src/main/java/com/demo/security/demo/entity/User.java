package com.demo.security.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "user",schema = "demo_svc")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "demo_svc.user_seq_gen")
    @SequenceGenerator(name = "demo_svc.user_seq_gen", sequenceName = "demo_svc.user_seq", schema = "demo_svc",
            allocationSize = 1)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Transient
    private String role;
}
