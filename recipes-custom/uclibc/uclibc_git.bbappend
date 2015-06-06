COMPATIBLE_MACHINE = "coolstream-hd2"
FILESEXTRAPATHS_prepend := "${THISDIR}/uclibc:"

SRC_URI += "file://uClibc.machine \
	    file://uClibc.distro \
	    file://locale.cfg \
"

# we cannot compile in thumb mode
configmangle += '${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=n,;"][d.getVar("ARM_INSTRUCTION_SET", True) != "arm"]}'
