systemd is the first process that starts when linux boots (PID1)
its responsible for starting stopping and monitoring services.

unit file controls when a service starts, stops, how it starts and how it stops
systemd takes this information from unit file.

cat basically prints out the output of a file on the terminal
journalctl basically is more advanced version on how a log file must be viewed
we can use filtering and see all the logs

-u    filter by service name       journalctl -u postgresql
-f    follow live (real-time)      journalctl -f
-n    last N lines                 journalctl -u ssh -n 50
--since   filter by time           journalctl -u k3s --since "1 hour ago"
