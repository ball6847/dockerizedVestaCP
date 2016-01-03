# VestaCP on Docker

A dockerized version of VestaCP.

```
docker build -t vestacp .
```

```
docker run -d --restart=always \
  -p 2222:22 \
  -p 80:80 \
  -p 8083:8083 \
  -p 3306:3306 \
  -p 443:443 \
  -p 25:25 \
  -p 993:993 \
  -p 110:110 \
  -p 53:53 \
  -p 54:54 \
  vestacp
```