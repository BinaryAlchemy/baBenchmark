#!/bin/bash

baseDir="$( cd "$( dirname "$0" )" && pwd )"
echo baseDir  is $baseDir 

export binRoot="${baseDir}/lnx"
export AppendRandomName="$1"
export PrependHostName="$2"
export AppendHostName="$3"


chmod +x -R "${baseDir}/lnx/rrBin"


rm -f /tmp/rrBench-CPUSingle.sh
"${baseDir}/lnx/rrBin/baConvertEnvFile"  "${baseDir}/test-CPU_singleCore.rrEnv" "/tmp/rrBench-CPUSingle.sh" -shebang -bash
source  /tmp/rrBench-CPUSingle.sh
rm -f /tmp/rrBench-CPUSingle.sh



export RandStr=
