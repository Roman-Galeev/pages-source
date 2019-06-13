---
title: "Cloud Zero Trust architecture"
tags: ["security"]
date: 2019-06-13T07:12:26+0000
---

## Unknown unknowns

Donald Rumsfeld:
Reports that say that something hasn't happened are always interesting to me, because as we know, there are known knowns; there are things we know we know. We also know there are known unknowns; that is to say we know there are some things we do not know. But there are also unknown unknowns—the ones we don't know we don't know. And if one looks throughout the history of our country and other free countries, it is the latter category that tend to be the difficult ones.

## Zero trust model:
Zero trust model assumes anything can be compromised and used by an attacker having full access to the resource. A defensible security architecture provides layers of awareness giving time to remediate known and unknown attacks. Following is a brief description of each layer together with approaches for security. The overarching goal of the model is to provide secure, reliable and defensive environment for cloud-native services to be able to mitigate unknown unknowns.

## Why to zero trust:

* lateral movements are much harder
* stolen credentials are less valuable
* known exploits are harder to exploit
* non-targeted attacks are automatically cordoned

## Arthitecture

### External services

* Clusters on premises depends on other services provided by other parties: IAM (Okta/AD), DNS, NTP, VMware
* Monitoring and alerting for the accounts/services in use

### Cluster nodes

* Hardening: CIS Benchmark
* Vulnerability management
* Monitoring and alerting

### Internode network

* TLS Certificates
* Ingress/egress policies
* Network segregation and isolation

### Container images

* Container image trust
* Internal compliance checks
* Vulnerability management
* Verifiable pipelines

### Deployments

* K8s events monitoring, Sysdig Falco
* Admission controllers: TUF, PSP, OPA, Kubesec

### In-cluster networks

* Identity management: SPIFFE/Spire
* Network segregation and isolation
* Monitoring and alerting, egress/ingress policies
* Service mesh

### Application Developers

* Signed commits
* Secrets management
* Trainings and awareness programs

