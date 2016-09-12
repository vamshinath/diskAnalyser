clear
echo -e "\t\t\tHi $USER"
echo -n "Enter the path to Analyse:"
read path
cd $path

if (( !$? ))
then
space=$(du -h $path | tail -1 | tr "\t" " " | cut -f1 -d" ")

clear
totalfl=$(find . -name "*"  | cat -n | tail -1 | cut -f1 | tr -d " " )
totalfl=$(( totalfl-1 ))
if (( !totalfl ))
then
echo "$path is Empty"
exit 0
fi
dir=$(find . -type d | cat -n | tail -1 | cut -f1 | tr -d " " )
imgs=$(find . -type f \( -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" \) | cat -n | tail -1 | cut -f1 | tr -d " ")
imgper=$((imgs*100/totalfl))



mp=$(find . -name "*.[mM][pP]3" | cat -n | tail -1 | cut -f1 | tr -d " ")
mpper=$((mp*100/totalfl))


mpf=$(find . -type f \( -iname "*.flv" -or -iname "*.mp4" -or -iname "*.mkv" \) | cat -n | tail -1 | cut -f1 | tr -d " ")
mpfper=$((mpf*100/totalfl))

cpp=$(find . -name "*.[cC][pP][pP]" | cat -n | tail -1 | cut -f1 | tr -d " ")
cpper=$((cpp*100/totalfl))

c=$(find . -name "*.[cC]" | cat -n | tail -1 | cut -f1 | tr -d " ")
cper=$((c*100/totalfl))
java=$(find . -type f \( -iname "*.jar" -or -iname "*.java" -or -iname "*.class" \) | cat -n | tail -1 | cut -f1 | tr -d " ")
javaper=$(( java*100/totalfl ))
pgfl=$(( c+cpp+java ))
pp=$(( pgfl*100/totalfl ))
txt=$(find . -name "*.[tT][xX][tT]" | cat -n | tail -1 | cut -f1 | tr -d " ")
txtper=$((txt*100/totalfl))
pspace=$(du $path | tail -1 | tr "\t" " " | cut -f1 -d" ")
pgg=$(( (pgfl*pspace)/(totalfl*1000) ))
txtg=$(( (txt*pspace)/(totalfl*1000) ))
imgg=$(( (imgs*pspace)/(totalfl*1000) ))
mp3g=$(( (mp*pspace)/(totalfl*1000) ))
mpfg=$(( (mpf*pspace)/(totalfl*1000) ))
clear
echo -e -n "\t.."
sleep 0.5
echo -e -n ".."
sleep 0.5
echo -n ".."
echo -n -e "\tAnalysing"
sleep 1
echo -n -e "\t.."
sleep 0.5
echo -n ".."
sleep 0.5
echo -n ".."
clear

echo -e "\n\tTotal disk Utilized by $path :$space"

dirper=$((dir*100/totalfl))
echo -e "\n\tTotal files	:	$totalfl\tIN MEGABYTES"
echo -e "\n\tTotal dirs	:	$dirper%"
echo -e "\n\tProgram files	:	$pgfl\t$pp%\t$pgg \n"
echo -e "\tText files	:	$txt\t$txtper%\t$txtg \n"
echo -e "\timage files	:	$imgs\t$imgper%\t$imgg \n"
echo -e "\tMusic files	:	$mp\t$mpper%\t$mp3g \n"
echo -e "\tVideo files	:	$mpf\t$mpfper%\t$mpfg \n"
else
clear
echo "INVALID PATH: $path"
sleep 2
./diskScan.sh
fi
