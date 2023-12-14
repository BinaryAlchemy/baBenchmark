#!/bin/bash

baseDir="$( cd "$( dirname "$0" )" && pwd )"
echo baseDir  is $baseDir 

export binRoot="${baseDir}/mac"
export AppendRandomName="$1"
export PrependHostName="$2"
export AppendHostName="$3"

chmod -R +x "${baseDir}/mac/rrBin/all.app/Contents/MacOS/*"
chmod -R +x "${baseDir}/mac/rrBin/rrCopy.app/Contents/MacOS/rrCopy"


rm -f "${TMPDIR}rrBench-CPUSingle.sh"
"${baseDir}/mac/rrBin/all.app/Contents/MacOS/baConvertEnvFile"  "${baseDir}/test-CPU_singleCore.rrEnv" "${TMPDIR}rrBench-CPUSingle.sh" -shebang -zsh
source  "${TMPDIR}rrBench-CPUSingle.sh"
rm -f "${TMPDIR}rrBench-CPUSingle.sh"

export RandStr=
