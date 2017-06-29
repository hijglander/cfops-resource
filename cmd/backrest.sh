#!/bin/bash


function backup_ops{}
(
cfops backup --cid cfopsadmin --cis welcome1 --omh 172.28.63.5 --omu ubuntu --omp welcome1 -t ops-manager -d backup/
)

function backup_ela{}
(
cfops backup --cid cfopsadmin --cis welcome1 --omh 172.28.63.5 --omu ubuntu --omp welcome1 -t elastic-runtime -d backup/
)

function restore_ela{}
(
cfops restore --cid cfopsadmin --cis welcome1 --omh 172.28.63.5 --omu ubuntu --omp welcome1 -t elastic-runtime -d backup/
)

function restore_ops{}
(
cfops restore --cid cfopsadmin --cis welcome1 --omh 172.28.63.5 --omu ubuntu --omp welcome1 -t ops-manager -d backup/
)


case "$1" in
        backup_ela)
            backup_ela
            ;;
         
        backup_ops)
            backup_ops
            ;;
         
        restore_ela)
            restore_ela
            ;;
        restora_ops)
            restora_ops
            ;;
         
        *)
            echo $"Usage: $0 {backup_ela|backup_ops|restore_ela|restora_ops}"
            exit 1
 
esac

