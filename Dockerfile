FROM nelsonjchen/docker-packer_qemu AS builder

WORKDIR /project

ARG DEBIAN_FRONTEND=noninteractive

COPY . .

RUN time ./virtio.sh
RUN time packer build --only=qemu windows_10.json && \
qemu-img convert -c -O qcow2 output-qemu/packer-qemu output-qemu/packer-qemu.qcow2

FROM nelsonjchen/docker-packer_qemu AS runner

WORKDIR /project

COPY --from=builder /project/packer-qemu utput-qemu/packer-qemu.qcow2 ./

RUN ls
