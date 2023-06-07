FROM rust:bookworm AS builder

RUN \
  mkdir /root/ats && \
  mkdir /root/ats/src 

WORKDIR /root/ats

COPY Cargo.lock .
COPY Cargo.toml .

WORKDIR /root/ats/src

COPY src/main.rs .

WORKDIR /root/ats

RUN cargo build --release


FROM debian:bookworm-slim

WORKDIR /usr/bin

COPY --from=builder /root/ats/target/release/atsastro_frontend_server .

RUN chmod -R +rwx /usr/bin/atsastro_frontend_server

WORKDIR /

RUN \
  mkdir /root/ats && \
  mkdir /root/ats/data

WORKDIR /root/ats/data

COPY data/ .

EXPOSE 8789

STOPSIGNAL SIGINT

# CMD ["tail", "-f", "/dev/null"]
CMD ["/usr/bin/atsastro_frontend_server"]
