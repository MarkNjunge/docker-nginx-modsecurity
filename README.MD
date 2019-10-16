# Docker + NGINX + ModSecurity + OWASP CRS

NGINX set up with ModSecurity enabled and configured with Open Web Application Security Project Core Rule Set (OWASP CRS). All running on docker.

```
docker run --name nginx-modsec -d -p 80:80 marknjunge/nginx-modsec
```

## Installation

```bash
git clone https://marknjunge.com/nginx-modsec.git

cd nginx-modsec

docker build -t marknjunge/nginx-modsec
or
./build.sh
```

**Note:** Building takes a while (even up to 15 minutes) because of compiling ModSecurity. Unless you have reason not to, it's better to use my image `marknjunge/nginx-modsec` as a base and copy your own config files.

## Usage

```
docker run --name nginx-modsec -d -p 80:80 marknjunge/nginx-modsec
```

## NGINX Configuration

To modify NGINX Configuration, edit [./nginx/nginx.conf](./nginx/nginx.conf) and [./nginx/conf.d/](./nginx/conf.d/).

## ModSecurity Configuration

ModSecurity is pre-configured with [OWASP CRS](https://www.owasp.org/index.php/Category:OWASP_ModSecurity_Core_Rule_Set_Project).

To add your own rules, modify [./modsec/main.conf](./modsec/main.conf).
