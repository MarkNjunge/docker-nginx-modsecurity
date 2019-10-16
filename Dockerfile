# docker build -t marknjunge/nginx-modsec .
# docker run --name nginx-modsec -d -p 8080:80 marknjunge/nginx-modsec
# docker stop nginx-modsec && docker rm nginx-modsec && docker rmi marknjunge/nginx-modsec 

FROM nginx:1.14.0

RUN mkdir ./scripts
COPY ./scripts ./scripts

# Set up mod Security
RUN ./scripts/1-install-packages.sh
RUN ./scripts/2-compile-modsec.sh
RUN ./scripts/3-configure-nginx-connector.sh
RUN ./scripts/4-add-owasp-crs.sh

# Copy ruleset(s)
COPY ./modsec/main.conf /etc/nginx/modsec/main.conf
COPY ./modsec/modsecurity.conf /etc/nginx/modsec/modsecurity.conf

# Copy nginx config
COPY ./nginx/conf.d /etc/nginx/conf.d
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN service nginx restart