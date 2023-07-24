#!/bin/bash

baseDir="$( cd "$( dirname "$0" )" && pwd )"
echo baseDir  is $baseDir 

export binRoot="${baseDir}/mac"
export AppendRandomName="$1"
export PrependHostName="$2"
export AppendHostName="$3"

chmod -R +x "${baseDir}/mac/rrBin/all.app/Contents/MacOS/*"
chmod -R +x "${baseDir}/mac/rrBin/rrCopy.app/Contents/MacOS/rrCopy"


rm -f "${TMPDIR}rrBench-GPU.sh"
"${baseDir}/mac/rrBin/all.app/Contents/MacOS/baConvertEnvFile"  "${baseDir}/test-GPU.rrEnv" "${TMPDIR}rrBench-GPU.sh" -shebang -zsh
source  "${TMPDIR}rrBench-GPU.sh"
rm -f "${TMPDIR}rrBench-GPU.sh"

export RandStr=
