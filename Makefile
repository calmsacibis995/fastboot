all: depends fastboot

depends:
	make -C depends/libzipfile all

fastboot:
	make -C src

clean:
	make -C depends/libzipfile clean
	make -C src clean

.PHONY: all depends clean