.ONESHELL:

KERNEL_MAJOR = 6
KERNEL_MINOR = 1
KERNEL_PATCH = 12
KERNEL_VERSION=${KERNEL_MAJOR}.${KERNEL_MINOR}.${KERNEL_PATCH}

fetch_kernel:
	mkdir -p kernel
	cd kernel
	if [ ! -f linux-${KERNEL_VERSION}.tar.xz ]; then \
		curl -O https://cdn.kernel.org/pub/linux/kernel/v${KERNEL_MAJOR}.x/linux-${KERNEL_VERSION}.tar.xz; \
	fi
	if [ ! -d linux-${KERNEL_VERSION} ]; then \
		tar -xvf linux-${KERNEL_VERSION}.tar.xz; \
	fi
	
build_kernel:
	cd kernel/linux-${KERNEL_VERSION}
	make defconfig
	make -j16
