#! /bin/bash

# Script Original de Ivan Arriola (https://github.com/Autodidacta-TI)

# Reemplazar odoo-server por el nombre del Servicio de Odoo en el Servidor
# Reemplazar https://dominio/ por la URL o el IP a consultar el 502
# Reemplazar el sleep 4's' por la cantidad de segundos a esperar entre el primer restart y la verificación

var=$(curl --insecure -s -o /dev/null -w "%{http_code}" https://dominio/)

if [[ $var = "502" ]];then
        # Servidor reiniciado
        sudo service odoo-server restart
        # Esperando para consultar
        sleep 4's'
        # Volviendo a consultar
        var=$(curl --insecure -s -o /dev/null -w "%{http_code}" https://dominio/)
        if [[ $var = "502" ]];then
                 sudo service odoo-server restart
                 #Reiniciado por segunra vez
        fi
fi

exit
