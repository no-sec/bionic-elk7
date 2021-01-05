# bionic-elk7
Configuration for ELK vagrant box

## Creation of the box

```shell
vagrant up
```

The last command of the Vagrantfile is `poweroff`, so eventually you will have a shutdown VM. Next, you need to get the ID of the VM:

```shell
VBoxManage list vms
```

which gives you something like 
```
"base_default_1609857958534_38019" {5d6d9343-8da3-46b1-88d3-a1326646cde8}
```

Using this VM, we can export a box using

```shell
vagrant package --base base_default_1609857958534_38019 --output bionic-elk7_v2.0.0.box
```

This is the box we can directly use or upload to app.vagrantup.com
