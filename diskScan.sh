IFS=$'\n'
clear
echo -e "\t\t\tHi $USER"
echo -n "Enter the path to Analyse:"
read path
cd $path

if (( !$? ))
then
touch /home/$USER/.Xctf.txt
space=$(du -h $path | tail -1 | tr "\t" " " | cut -f1 -d" ")
tspace=$(du $path | tail -1 | tr "\t" " " | cut -f1 -d" ")
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
find . -type f \( -iname "*" \)  -printf "%s\n" > /home/$USER/.Xctf.txt
for i in $(cat /home/$USER/.Xctf.txt)
do
imp=$(( imp+i ))
done
tspace=$(( imp/1000))
imp=0
rm /home/$USER/.Xctf.txt
find . -type f \( -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" \)  -printf "%s\n" > /home/$USER/.Xctf.txt
for i in $(cat /home/$USER/.Xctf.txt)
do
imp=$(( imp+i ))
done
imgp=$(( imp/(tspace*10)))
imgg=$(( imp/1000000))
imp=0

rm /home/$USER/.Xctf.txt
mp=$(find . -name "*.[mM][pP]3" | cat -n | tail -1 | cut -f1 | tr -d " ")

find . -type f \( -iname "*.mp3" \)  -printf "%s\n" > /home/$USER/.Xctf.txt
for i in $(cat /home/$USER/.Xctf.txt)
do
imp=$(( imp+i ))
done
mp3p=$((imp/(tspace*10)))
mp3g=$(( imp/1000000))
imp=0



rm /home/$USER/.Xctf.txt
mpf=$(find . -type f \( -iname "*.flv" -or -iname "*.mp4" -or -iname "*.mkv" \) | cat -n | tail -1 | cut -f1 | tr -d " ")

find . -type f \( -iname "*.flv" -or -iname "*.mp4" -or -iname "*.mkv" \)  -printf "%s\n" > /home/$USER/.Xctf.txt
for i in $(cat /home/$USER/.Xctf.txt)
do
imp=$(( imp+i ))
done
mp4p=$(( imp/(tspace*10)))
mp4g=$(( imp/1000000))
imp=0


rm /home/$USER/.Xctf.txt
#cpp=$(find . -name "*.[cC][pP][pP]" | cat -n | tail -1 | cut -f1 | tr -d " ")
#cpper=$((cpp*100/totalfl))

#c=$(find . -name "*.[cC]" | cat -n | tail -1 | cut -f1 | tr -d " ")
#cper=$((c*100/totalfl))
#java=$(find . -type f \( -iname "*.jar" -or -iname "*.java" -or -iname "*.class" \) | cat -n | tail -1 | cut -f1 | tr -d " ")
#javaper=$(( java*100/totalfl ))
#pgfl=$(( c+cpp+java ))
#pp=$(( pgfl*100/totalfl ))
#txt=$(find . -name "*.[tT][xX][tT]" | cat -n | tail -1 | cut -f1 | tr -d " ")
#txtper=$((txt*100/totalfl))

#pgg=$(( (pgfl*pspace)/(totalfl*1000) ))
#txtg=$(( (txt*pspace)/(totalfl*1000) ))
#mp3g=$(( (mp*pspace)/(totalfl*1000) ))
#mpfg=$(( (mpf*pspace)/(totalfl*1000) ))
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
echo -e "\n\tTotal files	:	$totalfl\t\t MEGABYTES"
echo -e "\n\tTotal dirs	:	$dirper%\n"
#echo -e "\n\tProgram files	:	$pgfl\t$pp%\t$pgg \n"
#echo -e "\tText files	:	$txt\t$txtpe%\t$txtg \n"
echo -e "\timage files	:	$imgs\t$imgp%\t$imgg \n"
echo -e "\tMusic files	:	$mp\t$mp3p%\t$mp3g \n"
echo -e "\tVideo files	:	$mpf\t$mp4p%\t$mp4g \n"
else
clear
echo "INVALID PATH: $path"
sleep 2
/home/apple/diskScan.sh
fi
#done
