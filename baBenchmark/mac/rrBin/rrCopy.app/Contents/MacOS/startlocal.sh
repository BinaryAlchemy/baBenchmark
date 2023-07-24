#! /bin/bash 

baseDir=$(dirname "$0")
bundleName=$(defaults read "$baseDir/../Info" CFBundleName)
$baseDir/../../../rrStartLocal $bundleName $@ 
