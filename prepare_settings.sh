#!/bin/bash

echo CLOUD_Cluster_MinDimPix:	$(/bin/sh jp.sh $1 CLOUD_Cluster_MinDimPix) > $2
echo SHADOW_Cluster_MinDimPix:	$(/bin/sh jp.sh $1 SHADOW_Cluster_MinDimPix) >> $2
echo SNOW_Cluster_MinDimPix:	$(/bin/sh jp.sh $1 SNOW_Cluster_MinDimPix) >> $2
echo CLOUD_ProbTH:	$(/bin/sh jp.sh $1 CLOUD_ProbTH) >> $2
