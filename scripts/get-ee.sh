#!/bin/sh

command -v git >/dev/null 2>&1 || { 
    echo >&2 "I require git but it's not installed.  Aborting."
    exit 1
}
command -v curl >/dev/null 2>&1 || { 
    echo >&2 "I require curl but it's not installed.  Aborting."
    exit 1
}

if command -v python3 >/dev/null 2>&1 
then 
    python_ver=python3
elif command -v python >/dev/null 2>&1 
then 
    python_ver=python
else 
    echo >&2 "I require python and neither v2 or v3 are not installed. Aborting."
    exit 1
fi 

if ls -1qA ./public/ | grep -q .
then 
    ! echo "The public folder is not empty. Empty it and try again. Aborting."
    exit 1
else 
    git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/ExpressionEngine/ExpressionEngine.git '*.*.*' | cut --delimiter='/' --fields=3
    read -p 'Type a version from the list: ' ee_ver
    curl -L https://github.com/ExpressionEngine/ExpressionEngine/releases/download/$ee_ver/ExpressionEngine$ee_ver.zip --output ./ExpressionEngine$ee_ver.zip
    $python_ver -m zipfile -e ./ExpressionEngine$ee_ver.zip ./public/
    rm ./ExpressionEngine$ee_ver.zip
fi