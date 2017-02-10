SRCREV = "648ffc470824c43eb0d16c485f4c24816b32cd6f"

do_deploy_append() {

    echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "## Appends added by yocto:" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

    if [ -n "${ENABLE_RPI3_SERIAL_CONSOLE}" ]; then
        echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "## Disable RPi3 bluetooth to enable serial console on UART0" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "dtoverlay=pi3-disable-bt" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi

    # enable spi
    echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "## Enable SPI" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "dtparam=spi=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

    # add mcp2515-can0 dtovoerlay
    echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "## Add mcp2515-can0 dtoverlay:" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "dtoverlay=mcp2515-can0,oscillator=16000000,interrupt=25" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

    # add spi-bcm2835 overlay
    echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "## Add spi-bcm2835 overlay:" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "dtoverlay=spi-bcm2835-overlay" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

}
