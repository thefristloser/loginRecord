
E:
cd E:\tools\loginmail\
date /t >mail.txt

time /t >>mail.txt

netstat -n -p tcp | find "3389" >>mail.txt
:::::::::::::: log::::::::::::::
for /f "delims=" %%i in (mail.txt) do (

 
 (set/p="%%i"<nul) >> loginHistory.txt  
) 

:::::::::::::: config::::::::::::::
set from=fromMailAddress@xx.com
set user=from
set pass=password
set to=toMail@xx.com
set subj=3389
set mail=mail.txt
set server=smtp.xx.com
set debug=-debug -log blat.log -timestamp
::::::::::::::::: run blat :::::::::::::::::
blat.exe %mail% -to %to%  -charset Gb2312 -subject %subj% -server %server% -f %from% -u %user% -pw %pass%
