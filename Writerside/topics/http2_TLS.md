# TLS


### PEM

```Shell
mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1
```

### JKS
```Shell
keytool -keystore keystore.jks -alias sampleAlias -genkeypair -keyalg RSA -keysize 4096 -validity 3 -dname 'CN=localhost, OU=ktor, O=ktor, L=Unspecified, ST=Unspecified, C=US'
```