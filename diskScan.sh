clear
echo -e "\t\t\tHi $USER"
echo -n "Enter the path to Analyse:"
read path
cd $path

if (( !$? ))
then
space=$(du -h $path | tail -1 | cut -f1 -d" ")

clear
echo -e "$space"
sleep 3
totalfl=$(find . -name "*"  | cat -n | tail -1 | cut -f1 | tr -d " " )
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
pgfl=$(( cper+cpper+javaper ))
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
echo -e "\n\tTotal files in $path  :	$totalfl"
echo -e "\n\tTotal directories in $path :	$dir    $dirper%"
echo -e "\n\tProgram files:	$java\t$javaper% \n"
echo -e "\tText files:	$txt\t$txtper% \n"
echo -e "\timage files:	$imgs\t$imgper% \n"
echo -e "\tMusic files:	$mp\t$mpper% \n"
echo -e "\tVideo files:	$mpf\t$mpfper% \n"
else
clear
echo "INVALID PATH: $path"
sleep 2
./diskScan.sh
fi
