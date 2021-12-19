#makefile for ax25systemd
.PHONY prerequisites:
prerequisites:
	@apt update
	@apt -y install ax25-tools ax25-apps inotify-tools socat tmux

.PHONY install:
install: prerequisites
	@systemctl stop dstarlinktoaprsstatus.service || true
	@/bin/cp -f "dstarlinktoaprsstatus.service" "/lib/systemd/system/"
	@/bin/cp -f "dstarlinktoaprsstatus" "/usr/local/bin/"
	@/bin/chmod +x "/usr/local/bin/dstarlinktoaprsstatus"
	@/bin/cp dstarlinktoaprsstatus.service /lib/systemd/system/
	@/bin/cp -n "dstarlinktoaprsstatus.conf" "/usr/local/etc/" || true
	@#
	@systemctl daemon-reload
	@systemctl enable dstarlinktoaprsstatus
	@echo " "
	@echo " "
	@echo "================================================================================"
	@echo "Installed. Edit config file /usr/local/etc/dstarlinktoaprsstatus"
	@echo "When done run \"sudo service dstarlinktoaprsstatus start\" to start the daemon"

.PHONY uninstall:
uninstall:
	@service dstarlinktoaprsstatus stop
	@systemctl disable dstarlinktoaprsstatus
	@systemctl daemon-reload
	@/bin/rm "/lib/systemd/system/dstarlinktoaprsstatus.service"
	@/bin/rm "/usr/local/bin/dstarlinktoaprsstatus"
	@/bin/rm "/usr/local/etc/dstarlinktoaprsstatus"
	@echo " "
	@echo "Uninstalled !"
