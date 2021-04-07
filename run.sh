echo "--------------------------------------------------------------"
echo "CONTENT OF THE CURRENT FOLDER"
ls -a .
echo "--------------------------------------------------------------"

#pwd_var = `pwd`

/bin/sh prepare_settings.sh vlabparams.json Fmask_Settings.txt

echo "CONTENT OF Fmask_Settings.txt"
cat Fmask_Settings.txt
echo "--------------------------------------------------------------"

mkdir Fmask_InData
unzip ./Fmask_InData.zip -d Fmask_InData/

DUPLICATED=Fmask_InData/Fmask_InData
if [ -d "$DUPLICATED" ]; then
    echo "$DUPLICATED exists."
    mv Fmask_InData/Fmask_InData/$(ls Fmask_InData/Fmask_InData/ | grep MSIL1C) Fmask_InData/
    rm -r Fmask_InData/Fmask_InData
fi


echo "CONTENT OF Fmask_InData"
ls -l Fmask_InData/
echo "--------------------------------------------------------------"

/bin/sh prepare_io_info.sh Fmask_InData Fmask_IO_Info.txt

echo "CONTENT OF Fmask_IO_Info.txt"
cat Fmask_IO_Info.txt
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
./run_Fmask_4_3.sh /MCR_R2016b/v91 Fmask_IO_Info.txt Fmask_Settings.txt
echo "CONTENT OF OutData"
ls -l OutData/
echo "--------------------------------------------------------------"
mv OutData/$(ls OutData/ | grep Fmask) OutData/fmask.tif


