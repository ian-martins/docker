H=$(date +%H)
M=$(date +%M)
S=$(date +%S)
DATE=$(date +%Y-%m-%d)

NOME="${DATE}_${H}-${M}-${S}"

CONTAINERS=$(docker ps -a --filter "ancestor=debian_superset:1.1" --format "{{.Names}}")

echo "============================================================="
echo "Realizando Backup $(date '+%d/%m/%Y %H:%M:%S')"

for CONTAINER in $CONTAINERS; do
    mkdir -p "/backups/bks/$CONTAINER"
    echo ""
    echo "Container: $CONTAINER"
    if docker cp "$CONTAINER":/root/.superset/superset.db "/backups/bks/$CONTAINER/${NOME}.db" > /dev/null 2>&1; then
        echo "[OK] Backup de $CONTAINER realizado."
        else
	echo "[ERRO] Falha ao fazer backup de $CONTAINER!" >&2
    fi
    if /usr/bin/zip "/backups/bks/$CONTAINER/${NOME}_${CONTAINER}.zip" "/backups/bks/$CONTAINER/${NOME}.db" > /dev/null 2>&1; then
        echo "[OK] Arquivo ${NOME}_${CONTAINER}.rar gerado"
        else
	echo "[ERRO] Falha ao compactar arquivo de $CONTAINER"
    fi
    rm -f "/backups/bks/$CONTAINER/${NOME}.db"

    OLD=""
    OLD_TIME=""
    na=$(ls -1 /backups/bks/$CONTAINER | wc -l)
    if [ "$na" -gt 7 ] ; then
         cd /backups/bks/$CONTAINER/
        for f in *; do
            T=$(stat -c %W "$f")
            if [ "$T" -eq 0 ]; then
                T=$(stat -c %Y "$f")
            fi
            if [ -z "$OLD" ] || [ "$T" -lt "$OLD_TIME" ]; then
                OLD="$f"
                OLD_TIME="$T"
            fi
	done
	rm -f "$OLD" 
        echo "[OK] Arquivo $OLD.rar removido"
        cd ../..
    fi
done

