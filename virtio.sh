#!/bin/bash -eu
export VIRTIO_WIN_ISO_URL=${VIRTIO_WIN_ISO_URL:-https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso}
export VIRTIO_WIN_ISO=${VIRTIO_WIN_ISO:-iso/$(basename $VIRTIO_WIN_ISO_URL)}

test -f $VIRTIO_WIN_ISO || aria2c $VIRTIO_WIN_ISO_URL -o $VIRTIO_WIN_ISO
