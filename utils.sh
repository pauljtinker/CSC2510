find /bin/ -name 'c*'
find /bin/ -type f -name 'sh*'
find /usr |head -10
grep 'model name' /proc/cpuinfo
grep -cvn 'send' /etc/services
grep -cn 'send' /etc/services

echo '------------------in food file-------------------------'

cat food |sort
echo '==================sort in order '
cat food | sort -r
echo '==========================sort in reverse order'
cat food |sort --key=2
echo '====================sort by 2nd name'
cat food | sort -nr --key=4 > calo
cat calo
echo '================sort by calories'
