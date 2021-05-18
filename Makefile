obj-m := kmod.o
kmod-y := src/ffi.o
kmod-y += src/mymodule.o
ccflags-y += -I$(src)/include

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default: zig.o
	$(MAKE) $(CFLAGS) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNELDIR) $(CFLAGS) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	rm -rf zig-cache src/zig-cache

zig.o:
	cd $(PWD)/src && zig build-obj -O ReleaseFast mymodule.zig && mv mymodule.o mymodule.o_shipped
