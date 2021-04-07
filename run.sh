echo "--------------------------------------------------------------"
echo "CONTENT OF THE CURRENT FOLDER"
ls -a .
echo "--------------------------------------------------------------"

#pwd_var = `pwd`

/bin/sh prepare_settings.sh vlabparams.json Fmask_Settings.txt

echo "CONTENT OF Fmask_Settings.txt"
cat Fmask_Settings.txt
echo "--------------------------------------------------------------"

unzip ./Fmask_InData.zip

echo "CONTENT OF Fmask_InData"
ls -l Fmask_InData/
echo "--------------------------------------------------------------"


unzip /Fmask_4_3.zip -d ./
unzip /AuxiData.zip -d ./Fmask_InData/

echo "CONTENT OF Fmask_InData after aux unzip"
ls -l Fmask_InData/
echo "--------------------------------------------------------------"

if [ -f /tmp/.X1-lock ]; then
    rm -f /tmp/.X1-lock
fi
if [ -d /tmp/.X11-unix ]; then
    rm -rf /tmp/.X11-unix
fi

vnc4server

export DISPLAY=$HOSTNAME:1
./run_Fmask_4_3.sh /MCR_R2016b/v91 ./Fmask_InIOInfoAndSettings/Fmask_IO_Info.txt Fmask_Settings.txt

zip -r OutData.zip OutData

