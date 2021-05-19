KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
SOURCE := src
# The zig main file name
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

# In case this isn't auto generated, make an empty .cmd file
# See: https://github.com/dynup/kpatch/issues/1125
zig.o:
	cd $(PWD)/$(SOURCE) \
	&& zig build-obj -O ReleaseFast $(ZIGMODULE).zig \
	&& touch .$(ZIGMODULE).o.cmd \
	&& mv $(ZIGMODULE).o $(ZIGMODULE).o_shipped