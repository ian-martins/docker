$env:DOCKER_HOST="tcp://10.211.0.31:2375"

#$NOME = Read-Host "Digite o nome do ambiente"
#$env:SUPERSET_WEB_PORT = Read-Host "Digite a porta para o Superset"
#$env:DRILL_PORT = Read-Host "Digite a porta para o Drill"
#$env:SUPERSET_SECRET_KEY = Read-Host "Chave secreta para o Superset"

$NOME = "logistica"
$env:SUPERSET_WEB_PORT = "8090"
$env:DRILL_PORT = "8047"
$env:SUPERSET_SECRET_KEY = "/NPCRk8sXo0/gpYemOisMcPV6AKUNd+xTA9zIZaD4IeNO/uL2Uq/kMBN4" 

$env:DB_USER="$NOME"
$env:DB_PASSWORD="$NOME"
$env:DB_NAME="$NOME"

$env:DRILL=$NOME+"_drill"
$env:POSTGRES=$NOME+"_postgres"
$env:SUPERSET_WEB=$NOME+"_superset"
$env:SUPERSET_INIT=$NOME+"_init"

docker compose up apache-drill -d