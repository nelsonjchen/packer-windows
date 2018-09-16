FROM nelsonjchen/docker-packer_qemu AS builder

WORKDIR /project

ARG DEBIAN_FRONTEND=noninteractive

COPY . .

RUN ls

FROM nelsonjchen/docker-packer_qemu AS runner

RUN ls
