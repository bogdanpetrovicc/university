package com.bogdan.cs230project.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@Table(name = "job")
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_id")
    private Integer jobId;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @JoinColumn(name = "company_fk", referencedColumnName = "company_id")
    @ManyToOne()
    private Company company;
    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinTable(name = "user_job", joinColumns = @JoinColumn(name = "job_fk"), inverseJoinColumns = @JoinColumn(name = "user_fk"))
    private List<User> users = new ArrayList<>();

}
