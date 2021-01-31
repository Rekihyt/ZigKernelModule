
ccflags-y := -I$(PWD)/include
obj-m := module.o
module-y := src/mymodule.o
module-y += src/pms.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	# zig build && \

	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	rm -rf zig-cache src/zig-cache

pms.o:
	cd $(PWD)/src && zig build-obj -O ReleaseFast pms.zig && mv pms.o pms.o_shipped
