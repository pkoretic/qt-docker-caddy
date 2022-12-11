FROM alpine:3.17 AS build

RUN apk add --no-cache qt6-qtbase-dev qt6-qthttpserver-dev make g++

RUN mkdir -p /app
COPY qtdockercaddy.pro /app
COPY main.cpp /app

WORKDIR /app/
RUN qmake6 && make -j$(nproc)

FROM alpine:3.17
COPY --from=build /app/qtdockercaddy /app/qtdockercaddy
RUN apk add --no-cache qt6-qthttpserver

EXPOSE 8282
ENTRYPOINT ["/app/qtdockercaddy"]
