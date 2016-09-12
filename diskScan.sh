echo "Hi $USER"
echo -n "Enter the path to Analyse:"
read path
cd $path
totalfl=$(find . -name "*" | cat -n | tail -1 | cut -f1 | tr -d " " )
dir=$(find . -type d | cat -n | tail -1 | cut -f1 | tr -d " " )
imgs=$(find . -name "*.[jJ][pP][gG]" | cat -n | tail -1 | cut -f1 | tr -d " ")
png=$(find . -name "*.[pP][nN][gG]" | cat -n | tail -1 | cut -f1 | tr -d " ")
jpeg=$(find . -name "*.[jJ][pP][eE][gG]" | cat -n | tail -1 | cut -f1 | tr -d " ")
(( imgs=imgs+png+jpeg ))
imgper=$((imgs*100/totalfl))



mp=$(find . -name "*.[mM][pP]3" | cat -n | tail -1 | cut -f1 | tr -d " ")
mpper=$((mp*100/totalfl))


mpf=$(find . -name "*.[mM][pP]4" | cat -n | tail -1 | cut -f1 | tr -d " ")
tgp=$(find . -name "*.3[gG][pP]" | cat -n | tail -1 | cut -f1 | tr -d " ")
avi=$(find . -name "*.[aA][vV][iI]" | cat -n | tail -1 | cut -f1 | tr -d " ")
flv=$(find . -name "*.[fF][lL][vV]" | cat -n | tail -1 | cut -f1 | tr -d " ")
((mpf=mpf+tgp+avi+flv))
mpfper=$((mpf*100/totalfl))

cpp=$(find . -name "*.[cC][pP][pP]" | cat -n | tail -1 | cut -f1 | tr -d " ")
cpper=$((cpp*100/totalfl))

c=$(find . -name "*.[cC]" | cat -n | tail -1 | cut -f1 | tr -d " ")
cper=$((c*100/totalfl))

txt=$(find . -name "*.[tT][xX][tT]" | cat -n | tail -1 | cut -f1 | tr -d " ")
txtper=$((txt*100/totalfl))

clear
echo -n ".."
sleep 0.5
echo -n ".."
sleep 0.5
echo -n ".."
echo -n -e "\tAnalysing"
sleep 1
echo -n ".."
sleep 0.5
echo -n ".."
sleep 0.5
echo -n ".."

 dirper=$((dir*100/totalfl))
echo -e "\n\tTotal files in $path :	$totalfl"
echo -e "\n\tTotal directories in $path :	$dir    $dirper%"
echo -e "\n\tC files:	$c\t$cper% \n"
echo -e "\tCPP files:	$cpp\t$cpper% \n"
echo -e "\tText files:	$txt\t$txtper% \n"
echo -e "\timage files:	$imgs\t$imgper% \n"
echo -e "\tMusic files:	$mp\t$mpper% \n"
echo -e "\tVideo files:	$mpf\t$mpfper% \n"
