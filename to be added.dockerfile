FROM gcr.io/distroless/python3
WORKDIR /app
USER root
COPY --from=build /app/dist/ /app/dist/
COPY --from=build /usr/lib/x86_64-linux-gnu/libc.so /lib/x86_64-linux-gnu/libc.so.6
ENTRYPOINT [ "/app/dist/app/app" ]