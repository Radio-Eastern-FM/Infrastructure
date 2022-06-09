# Allow the kill signal to kill the right process
_term() { 
  echo "Quitting" 
  kill -TERM "$child" 2>/dev/null
}

trap _term SIGTERM

####### Begin Startup ...

echo "[OK] Begin startup"

echo "[INFO] Testing NGINX configuration"
nginx -t

echo "[INFO] Starting php7.4-fpm and mysql"
service php7.4-fpm start
service mysql start

nginx -g 'daemon off;' &

echo "[OK] NGINX is running..."

####### Application Running ...

# Wait for SIGTERM (kill signal)
child=$!
wait "$child"

