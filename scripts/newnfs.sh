#!/bin/bash
echo "Insira o nome do volume"
read nome;

# Volume que será criado
nfsvol=/mnt/nfsvol/$nome
mkdir $nfsvol
rede="172.0.0.0/16(rw,sync,no_root_squash,no_sub_tree_check)";
echo $nfsvol $rede >> /etc /exports
exports -a 
systemctl restart nfs-kernel-server
echo "Volume criado"

echo 'echo "---"' >> du.sh
echo 'echo "---' $nome '--"' >> du.sh
echo "du -sh /mnt/nfsvol/lv01/"$nome >> du.sh
echo "Finalizada a adição no script du.sh"