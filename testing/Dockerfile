FROM python:3 as builder
FROM  gcr.io/distroless/python3-debian10:debug
COPY --from=builder /usr/bin/openssl /usr/bin/openssl
COPY --from=builder /usr/lib/x86_64-linux-gnu /lib/x86_64-linux-gnu
ENTRYPOINT [ "/bin/sh" ]