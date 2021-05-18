KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
SOURCE := src
ZIGMODULE := mymodule

obj-m := kmod.o
kmod-y := $(SOURCE)/ffi.o
kmod-y += $(SOURCE)/$(ZIGMODULE).o
ccflags-y += -I$(src)/include

default: zig.o
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	rm -rf src/zig-cache

zig.o:
	cd $(PWD)/$(SOURCE) \
	&& zig build-obj -O ReleaseFast $(ZIGMODULE).zig \
	&& mv $(ZIGMODULE).o $(ZIGMODULE).o_shipped
