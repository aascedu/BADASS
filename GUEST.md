# Hosting the project


## Image
Create the image with this command:  
`qemu-img create -f qcow2 ~/goinfre/badass.qcow2 40G`


## Booting
First boot from CD-ROM:  
```bash
  qemu-system-x86_64 \
  -enable-kvm \
  -m 9G \
  -smp 20 \
  -cpu max \
  -hda ~/goinfre/badass.qcow2 \
  -cdrom ~/sgoinfre/ubuntu-24.04.iso \
  -boot d \
  -vga virtio \
  -nic user,hostfwd=tcp::2222-:22
```

Then boot from hard disk:  
```bash
  qemu-system-x86_64 \
  -enable-kvm \
  -m 9G \
  -smp 20 \
  -cpu max \
  -hda ~/goinfre/badass.qcow2 \
  -boot c \
  -vga virtio \
  -nic user,hostfwd=tcp::2222-:22 \
  -virtfs local,path=/home/$(whoami)/Documents/BADASS,mount_tag=badass,security_model=passthrough,id=badass \
  -chardev qemu-vdagent,id=ch1,name=vdagent,clipboard=on \
  -device virtio-serial-pci \
  -device virtserialport,chardev=ch1,id=ch1,name=com.redhat.spice.0
```


## Setup the environment


#### Mount shared working directory
```
sudo mkdir -p /mnt/badass
sudo mount -t 9p -o trans=virtio badass /mnt/badass
```


#### GNS3
[GNS3 Install Guide](https://docs.gns3.com/docs/getting-started/installation/linux/)