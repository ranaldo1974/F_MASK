echo "--------------------------------------------------------------"
echo "CONTENT OF THE CURRENT FOLDER"
ls -a .
echo "--------------------------------------------------------------"

unzip ./Fmask_InData.zip 
unzip ./Fmask_InIOInfoAndSettings.zip

unzip Fmask_4_3.zip -d ./
unzip AuxiData.zip -d ./Fmask_InData

if [ -f /tmp/.X1-lock ]; then
    rm -f /tmp/.X1-lock
fi
if [ -d /tmp/.X11-unix ]; then
    rm -rf /tmp/.X11-unix
fi

vnc4server

export DISPLAY=$HOSTNAME:1
./run_Fmask_4_3.sh /MCR_R2016b/v91 ./Fmask_InIOInfoAndSettings/Fmask_IO_Info.txt ./Fmask_InIOInfoAndSettings/Fmask_Settings.txt

zip -r OutData.zip OutData
