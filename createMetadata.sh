function createMetadata(){
    read -p "Enter number of fields: " col;
    while( [[ $col != 0 ]] )
    do
        #echo " $col ";
        colMetadata="";
        read -p "Enter column name: " colName;
        if [[ $name =~ ^[a-zA-Z0-9]+$ && $name =~ ^[a-zA-Z]  ]];then
                colMetadata="$colName";

                read -p "Is it Primary-Key (PK): (y/n)" pk;
                if [[ $pk == "y" || $pk == "Y" ]]; then
                colMetadata="$colMetadata:yes";
                elif [[ $pk == "n" || $pk == "N" ]]; then
                colMetadata="$colMetadata:no";
                fi

                read -p "Choose column's datatype String(s) Number(n): (s/n)" colDataType;
                if [[ $colDataType == "s" || $colDataType == "S" ]]; then
                colMetadata="$colMetadata:string";
                elif [[ $colDataType == "n" || $colDataType == "N" ]]; then
                colMetadata="$colMetadata:number";
                fi
                touch $1.metadata; 
                touch $1;
                #put metadata in file
                echo $colMetadata >> $1.metadata;
        else 
            echo "enter name not begin by number and not contain spectial char "     
        fi
       ((col=$col-1))
    done
    . tableDB.sh;
}

read -p "Enter Name of table : " name
            if [ -f $name ] ;then
                echo "Already Exits : please enter another name "
            else 
                if [[ $name =~ ^[a-zA-Z0-9]+$ && $name =~ ^[a-zA-Z]  ]];then
                    createMetadata $name;
                else 
                    echo "enter name not begin by number and not contain spectial char "     
                fi
            fi 