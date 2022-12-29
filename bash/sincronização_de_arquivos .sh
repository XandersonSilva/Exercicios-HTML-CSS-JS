#!/bin/bash

ES=/home/$USER/.locais
EP=/home/$USER/.locais/arquivos
CONCLUIDO=0
PROSEGUIR=0
SONECA=20

function Sincronizar_dados {

        #VERIFICA SE A LISTA EXISTE
        LS=$ES/dados
        if [ ! -e $LS/loc_diretorios.pdt ]; then
            touch $LS/loc_diretorios.pdt
            echo $DIR_0 >> $LS/loc_diretorios.pdt
            echo $DIR_1 >> $LS/loc_diretorios.pdt
        fi
           
        rm $LS/dado_dir.pdt
        touch $LS/dado_dir.pdt
        echo $DIR_0 >> $LS/dado_dir.pdt
        echo $DIR_1 >> $LS/dado_dir.pdt
        
        EX=`cat $LS/loc_diretorios.pdt`
        #VERIFICA SE ESTÁ EM BRANCO
        if [[ $EX == "" ]]; then
            echo $DIR_0 >> $LS/loc_diretorios.pdt
            echo $DIR_1 >> $LS/loc_diretorios.pdt
            echo ` cat $LS/loc_diretorios.pdt `
            echo ` cat $LS/dado_dir.pdt `
        fi
        
        EX=`cat $LS/loc_diretorios.pdt` 
        CAT=`cat $LS/dado_dir.pdt`
        
        #VERIFICA SE ESTA ATUALIZADA 
        if [[ $CAT != $EX ]]; then
                truncate -s 0 $LS/loc_diretorios.pdt
                echo ` cat $LS/dado_dir.pdt ` >> $LS/loc_diretorios.pdt
                
        fi
        EX=`cat $LS/loc_diretorios.pdt` 
        
        #CRIA UM ARRAY COM OS NOMES DOS DIRETORIOS
        IFS=' ' read -ra List_dir <<< "$EX"
        
        for I in ${!List_dir[@]}
        do
                DIR_L=${List_dir[$I]}
                
                if [ ! -d $ES/Arquivos_dir_$I ]; then
                        mkdir $ES/Arquivos_dir_$I
                fi
        done
        
        if [ -e $ES/Arquivos_dir_0/diretorio_L.loc ]; then
                                
                rm $ES/Arquivos_dir_0/diretorio_L.loc
                touch $ES/Arquivos_dir_0/diretorio_L.loc
                echo ` ls ${List_dir[0]} ` >> $ES/Arquivos_dir_0/diretorio_L.loc
        else
                touch $ES/Arquivos_dir_0/diretorio_L.loc
                echo ` ls ${List_dir[0]} ` >> $ES/Arquivos_dir_0/diretorio_L.loc
        fi
                         
        if [ -e   $ES/Arquivos_dir_1/diretorio_R.loc ]; then
                rm   $ES/Arquivos_dir_1/diretorio_R.loc
                touch   $ES/Arquivos_dir_1/diretorio_R.loc
                echo ` ls ${List_dir[1]} ` >>   $ES/Arquivos_dir_1/diretorio_R.loc
        else
                touch   $ES/Arquivos_dir_1/diretorio_R.loc
                echo ` ls ${List_dir[1]} ` >>   $ES/Arquivos_dir_1/diretorio_R.loc
        fi

        for I in ${!List_dir[@]}
        do
                DIR_L=$ES/Arquivos_dir_0/diretorio_L.loc
                DIR_R=$ES/Arquivos_dir_1/diretorio_R.loc
                
                if [ -e $ES/Arquivos_dir_$I/diretorio_L.loc ]; then
                       LIST_Al=` cat $DIR_L `
                       IFS=' ' read -ra List_A_d1 <<< "$LIST_Al"
                fi
                if [ -e $ES/Arquivos_dir_$I/diretorio_R.loc ]; then
                       LIST_Ar=` cat $DIR_R `
                       IFS=' ' read -ra List_A_d2 <<< "$LIST_Ar"
                fi
        done
        
             
        
        #VERIFICAÇÃO 
        for C in ${!List_A_d1[@]}
        do 
            if [[  ${List_A_d1[$C]}  ==  *.$EXTEN  ]]; then 
                    
                    #echo ${List_dir[0]}/${List_A_d1[$C]} ${List_dir[1]}/${List_A_d1[$C]} 
                    cmp -s  ${List_dir[0]}/${List_A_d1[$C]} ${List_dir[1]}/${List_A_d1[$C]}
                    VERIFICACAO=$?
                    if [[ $VERIFICACAO -eq 1 ]]; then 
                             cp ${List_dir[0]}/${List_A_d1[$C]} ${List_dir[1]}
                             zenity   --notification --text="Arquivo ${List_A_d1[$C]} Atualizados!" #EXIBE UMA NOTIFICAÇÃO NA TELA
                    fi
                    if [[ $VERIFICACAO -eq 2 ]]; then
                             cp ${List_dir[0]}/${List_A_d1[$C]} ${List_dir[1]}
                             zenity   --notification --text="Arquivo ${List_A_d1[$C]} Atualizados!" #EXIBE UMA NOTIFICAÇÃO NA TELA
                    fi
            fi
           #chmod +xwr ${List_dir[0]}*.$EXTEN
        done
        
        
        
        
}

function Interface {

        zenity --info --text="Este programa irá fazer verificações em dois diretorios \ncom o intuito  de  que  os arquivos  com  as extenções \ninformadas sejão iguais em ambos os diretorios." 
        
        DIR_0=$(zenity --file-selection --directory --title="Diretorio com arquivos atualizados")
    
        case $? in

        1)
            zenity   --error --text="Informações não inseridas!"
            PROSEGUIR=1
            ;;
        -1)
            zenity   --error --text="Erro desconhecido!"
            PROSEGUIR=1
            ;;
        
    esac
    
    DIR_1=$(zenity --file-selection --directory --title="Diretorio com arquivos a serem atualizados")

    case $? in

        1)
            zenity   --error --text="Informações não inseridas!"
            PROSEGUIR=1
            ;;
        -1)
            zenity   --error --text="Erro desconhecido!"
            PROSEGUIR=1
            ;;
        
    esac
    
    EXTEN=$(zenity --entry --text="Extenção dos arquivos que serão monitorados:" --title="Teste de formulario")

            
    case $? in

        1)
            zenity   --error --text="Extenção não inserida!"
            PROSEGUIR=1
            ;;
        -1)
            zenity   --error --text="Erro desconhecido!"
            PROSEGUIR=1
            ;;
        
    esac
    
    SONECA=$(zenity   --scale --text="Intervalo de verificação em segundos")
    
    case $? in
        0)
            if [[ $SONECA -le 4 ]]; then
                SONECA=5
                zenity   --notification --text="O valor inserido é muito pequeno. \nPara não sobrecarregar o pc o intervalo de verificação foi alteraddo para 5 segundos!"
            fi
            zenity   --info --text="Verificações iniciadas!"
            ;;
        1)
            zenity   --error --text="Informações não inseridas!"
            PROSEGUIR=1
            ;;
        -1)
            zenity   --error --text="Erro desconhecido!"
            PROSEGUIR=1
            ;;
        
    esac
    
    CONCLUIDO=1
    
}

while true
do

    if [ ! -d $ES ]; then
        mkdir $ES
    fi

    if [ ! -d $ES/dados ]; then
        mkdir $ES/dados
    fi

    if [ ! -d $EP ]; then
        mkdir $EP
    fi
    
#    VERIFICAÇÃO

    case $1 in 
        1)      
                
                if [ ! -d $2 ]; then
                        zenity   --notification --text="O primeiro diretorio não existe!"
                        break
                elif [ ! -d $3 ]; then
                        zenity   --notification --text="O segundo diretorio não existe!"
                        break
                else
                        DIR_0=$2
                        DIR_1=$3
                        EXTEN=$4
                        Sincronizar_dados
                        
                fi;;

        
        *)                      
                if [ ! -d $DIR_0 ]; then
                        zenity   --notification --text="O primeiro diretorio não existe!"
                        break
                elif [ ! -d $DIR_1 ]; then
                        zenity   --notification --text="O segundo diretorio não existe!"
                        break
                else
                        if [[ $CONCLUIDO != 1 ]]; then
                                Interface
                        fi
                        if [ $PROSEGUIR -eq 0 ]; then 
                                Sincronizar_dados
                        else
                                break
                        fi
                        
                fi
                ;;
        
    esac
    sleep $SONECA # Waits 
done
