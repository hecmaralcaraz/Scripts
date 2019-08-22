#!/bin/bash

#######################################################
# Script para crear usuarios con useradd
#######################################################
# ANTIGUO: Pgpdapi1; Igpdapi1 Y Xgpdapi1
# ANTIGUO: Pgpdapi1; Igpdapi1 Y Xgpdapi1
# ANTIGUO Grupo principal lainpl
# ANTIGUO: Grupos Igpdapi1, Pgpdapi1, Xgpdapi1, apache
#######################################################
# NUEVO: Usuarios: Clainpl1; Clainpl2; Alainpl1; Plainpl1
# NUEVO Grupo principal: lainpl
# NUEVO: Grupos Secundarios:
#######################################################

declare -a APPS=('bdcseg')

# Lista de usuarios a crear, actualizar la lista antes de lanzar el script.
USERS=("A${APPS}1" "C${APPS}1" "C${APPS}2")
MAX_DAYS=(180 180 180)

cont=0
for APP in "${APPS[@]}"; do
groupadd ${APP}

	for usr in "${USERS[@]}"; do
		useradd -c "Usuario normativo aplicación" ${usr}
		echo "umask 0027"  >> /home/${usr}/.bashrc
		echo f?u=7FrAc7eJuZ | passwd --stdin ${usr}
		# Comentado: Grupo primario + grupo secundario
		#usermod -G X${APP}1,P${APP}1,I${APP}1,${APP},apache -g ${APP} ${usr}

		# Solo grupo primario y anadido shell bash
		usermod -g ${APP} -s /bin/bash ${usr}
		chage -I -1 -m 0 -M ${MAX_DAYS[cont]} -E -1  ${usr}
		let cont=cont+1
		#/usr/sbin/pam_tally --user ${usr}  --reset
		#/usr/sbin/pam_tally2 --user ${usr} --reset
		#/sbin/pam_tally --user ${usr}  --reset
		/sbin/pam_tally2 --user ${usr} --reset
	done
done

for APP in "${APPS[@]}"; do
	for usr in "${USERS[@]}"; do
		#usermod -a -G weblogic,${APP},C${APP}1,C${APP}2,A${APP}1 ${usr}
		echo "-----"
		id ${usr}
		echo "-----"
		chage -l ${usr}
	done
	echo "----------------------------------------------------"
done
