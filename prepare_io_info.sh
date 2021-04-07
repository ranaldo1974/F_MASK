#!/bin/bash

echo InputPath:	./Fmask_InData/$(ls $1 | grep MSIL1C) > $2
echo OutputPath:	./OutData >> $2