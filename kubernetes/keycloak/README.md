# Keycloak

```bash
kubectl create namespace keycloak
kubectl apply -k .
```


## LDAP

```bash
ldapsearch -D "CN=readonly,DC=kurz,DC=site" -w "xxx" -H ldap:// -b "ou=users,dc=kurz,dc=site" "(&(objectclass=organizationalPerson)(memberOf=cn=admin,ou=groups,dc=kurz,dc=site))"
ldapadd -D "cn=admin,cn=config" -w "xxxxx" -f file.ldif
```

### Password Hash

oad-ppolicy.ldif
```
dn: cn=module{0},cn=config
changetype: modify
add: olcModuleLoad
olcModuleLoad: ppolicy
```

overlay-ppolicy.ldif
```
dn: olcOverlay={2}ppolicy,olcDatabase={1}mdb,cn=config
objectClass: olcOverlayConfig
objectClass: olcPPolicyConfig
olcOverlay: {2}ppolicy
olcPPolicyHashCleartext: TRUE
```