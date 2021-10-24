#!/bin/bash
#
# MIT License
#
# Copyright (c) 2021 Dazzl
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

VERSION="0.1"
#DEBUG="1"
DEBUG="0"
TOPDIR="${PWD}"
TOPDIR_SDK="${PWD}/sdk"
TOPDIR_INCLUDE="${PWD}/sdk/srtcore"
TOPDIR_TMP="${PWD}/tmp"

function display_header() 
{

    echo "  ____  ____  ____    ____  __  __ _  ____  __  __ _   ___     ___  ____  __ _  ____  ____   __  ____  __  ____  "
    echo " / ___)(  _ \(_  _)  (  _ \(  )(  ( \(    \(  )(  ( \ / __)   / __)(  __)(  ( \(  __)(  _ \ / _\(_  _)/  \(  _ \ "
    echo " \___ \ )   /  )(     ) _ ( )( /    / ) D ( )( /    /( (_ \  ( (_ \ ) _) /    / ) _)  )   //    \ )( (  O ))   / "
    echo " (____/(__\_) (__)   (____/(__)\_)__)(____/(__)\_)__) \___/   \___/(____)\_)__)(____)(__\_)\_/\_/(__) \__/(__\_) "
    echo " "
    echo " Copyright (c) 2021 Dazzl - https://site.dazzl.tv/ "
    echo " Version : ${VERSION} "
    echo " "
}

function check_requirements_installed()
{
    if [ "${DEBUG}" == "1" ]; then
        echo " [CHECK] Checking mandatory requirements : "
    else
        echo -n " [CHECK] Checking mandatory requirements : "
    fi
    REQ="TRUE"
    for PROGRAM in "swig4.0" "gcc" "g++" "pkg-config" "gcc" "cmake" "g++"
    do
        if [ "${DEBUG}" == "1" ]; then
            echo -n "      [-] ${PROGRAM}   : "
        fi
        if [ "`which ${PROGRAM}`" != "" ]; then
            if [ "${DEBUG}" == "1" ]; then
                echo "OK "
            fi
        else
            REQ="FALSE"
            if [ "${DEBUG}" == "1" ]; then
                echo "NOK "
            fi
            break
        fi
    done
    if [ "${REQ}" == "FALSE" ]; then
        if [ "${DEBUG}" == "1" ]; then
            echo " [RESULT] NOK "
        else
            echo "NOK "
        fi
        read -p "    Do you wish to install the mandatory requirements ?" yn
        case $yn in
            [Yy]* )
                sudo apt install swig4.0 \
                        swig4.0-doc \
                        swig4.0-examples \
                        pkg-config \
                        gcc \
                        g++ \
                        cmake \
                        tcl \
                        tclsh \
                        findutils \
                        python3.9-dev \
                        libpython3.9-dev \
                        libc-bin \
                        libssl-dev \
                        build-essential
                ;;
            [Nn]* ) 
                echo " [ERROR] Exiting the script. "
                exit;;
            * ) echo "Please answer yes or no.";;
        esac
    else
        if [ "${DEBUG}" == "1" ]; then
            echo "[RESULT] OK "
        else
            echo "OK "
        fi
    fi
}

function create_temp_directy()
{
    if [ ! -d "${TOPDIR_TMP}" ]; then
        mkdir -p ${TOPDIR_TMP}
    fi
    DIR_PATH=$(mktemp -d -t XXXXXXXXXX --tmpdir=${TOPDIR_TMP})    
}

function remove_temp_directory() 
{
    if [ -d "${DIR_PATH}" ]; then
        echo " [REMOVE] Removing the temp directory (${DIR_PATH}) "
        rm -fR ${DIR_PATH}
    else
        echo " [WARNING] Cannot remove the temp directory (${DIR_PATH}) "
    fi
}

function get_srt_sdk()
{
    clone_srt_sdk
    build_srt_sdk
    install_srt_sdk
}

function check_srt_sdk()
{
    # Check if the pkgconfig gile (srt.pc) insa installed
    # if so a previous build of the srt sdk have been done
    export PKG_CONFIG_PATH=${DIR_PATH}/delivery/sdk/usr/local/lib/pkgconfig
    if [ "${RET}" == "0" ]; then
        tree ${DIR_PATH}/delivery/sdk/
        echo " [DEBUG] PKG_CONFIG_PATH=${PKG_CONFIG_PATH} "
    fi    
    pkg-config --exists srt > /dev/null 2>&1
    RET="$?"    
    if [ "${RET}" == "0" ]; then       
        LIBSRT_CFLAGS="`pkg-config --cflags srt|grep /usr/local/include`"
        LIBSRT_LIBS="`pkg-config --libs srt|grep /usr/local/lib`"
        LIBSRT_SO="`ldconfig -p|grep libsrt.so.1`"
        LIBSRT_PATH="`ldconfig -p|grep libsrt.so.1|awk '{ print $4 }'`"
        LIBSRT_PC_CFLAGS="`pkg-config --cflags srt`"
        LIBSRT_PC_LIBS="`pkg-config --libs srt`"
        LIBSRT_VERSION_MAJOR="`cat ${DIR_PATH}/delivery/sdk/usr/local/include/srt/version.h|grep SRT_VERSION_MAJOR|xargs|awk '{ print $3 }'`"
        LIBSRT_VERSION_MINOR="`cat ${DIR_PATH}/delivery/sdk/usr/local/include/srt/version.h|grep SRT_VERSION_MINOR|xargs|awk '{ print $3 }'`"
        LIBSRT_VERSION_PATCH="`cat ${DIR_PATH}/delivery/sdk/usr/local/include/srt/version.h|grep SRT_VERSION_PATCH|xargs|awk '{ print $3 }'`"
        if [ "${DEBUG}" == "1" ]; then
            echo " [INF0] Current SRT SDK installed : ${LIBSRT_VERSION_MAJOR}.${LIBSRT_VERSION_MINOR}.${LIBSRT_VERSION_PATCH} "
            echo "  [DEBUG] LIBSRT_CFLAGS='${LIBSRT_CFLAGS}'"
            echo "  [DEBUG] LIBSRT_LIBS='${LIBSRT_LIBS}'"
            echo "  [DEBUG] LIBSRT_SO='${LIBSRT_SO}'"
            echo "  [DEBUG] LISRT_PATH='${LIBSRT_PATH}'"
            echo "  [DEBUG] LIBSRT_PC_CFLAGS='${LIBSRT_PC_CFLAGS}'"
            echo "  [DEBUG] LIBSRT_PC_LIBS='${LIBSRT_PC_LIBS}'"
        fi
    else
        get_srt_sdk
    fi
}

function clone_srt_sdk()
{
    if [ ! -d "${TOPDIR_SDK}" ]; then
        echo " [DOWNLOAD] Getting the latest srt sdk from upstream (${TOPDIR_SDK}) "
        mkdir -p ${TOPDIR_SDK}
        cd ${TOPDIR_SDK}
        git clone https://github.com/Haivision/srt.git . > /dev/null 2>&1
    else
        echo " [UPDATE] The srt sdk is already existing (${TOPDIR_SDK}) ; just update it "
        cd ${TOPDIR_SDK}
        git pull > /dev/null 2>&1
    fi
}

function build_srt_sdk()
{
    if [ -d "${TOPDIR_SDK}" ]; then
        cd ${TOPDIR_SDK}
        echo " [CONF] Configuring the srt SDK "
        ./configure  > /dev/null 2>&1
        echo " [MAKE] Building the srt library "
        make  > /dev/null 2>&1
    fi
}

function install_srt_sdk()
{
    if [ ! -d "${TOPDIR_SDK}" ]; then
        mkdir -p ${DIR_PATH}/delivery/sdk/
        export PKG_CONFIG_PATH=${DIR_PATH}/delivery/sdk/lib/pkgconfig
    fi
    if [ -d "${TOPDIR_SDK}" ]; then
        cd ${TOPDIR_SDK}        
        echo " [INSTALL] Installing the srt library "

        # --- Installation
        make install DESTDIR=${DIR_PATH}/delivery/sdk > /dev/null 2>&1

        # --- Check installation
        check_srt_sdk
        LIBSRT_NAME_1="`readlink /home/tgayet/Workspace/Python-binding-for-libsrt/tmp/dnH7dJAFZI/delivery/sdk/usr/local/lib/libsrt.so`"
        LIBSRT_NAME_2="`readlink /home/tgayet/Workspace/Python-binding-for-libsrt/tmp/dnH7dJAFZI/delivery/sdk/usr/local/lib/${LIBSRT_NAME_1}`"
        LIBSRT_PATH=${DIR_PATH}/delivery/sdk/usr/local/lib/${LIBSRT_NAME_2}
        if [ -e "${LIBSRT_PATH}" ]; then
            echo " [CHECK] The dynamic libsrt.so v${LIBSRT_VERSION_MAJOR}.${LIBSRT_VERSION_MINOR}.${LIBSRT_VERSION_PATCH} (${LIBSRT_PATH}) is well installed "
        else
            echo " [ERROR] The dynamic libsrt.so v${LIBSRT_VERSION_MAJOR}.${LIBSRT_VERSION_MINOR}.${LIBSRT_VERSION_PATCH} (${LIBSRT_PATH}) is not well installed "
        fi
        if [ "${DEBUG}" == "1" ]; then
            echo -n " [CHECK] Checking libsrt1 file : "
            file ${LIBSRT_PATH}
            echo " [CHECK] Checking libsrt1 dependencies : "
            ldd ${LIBSRT_PATH}
        fi
    fi
}

function generate_binding()
{
    cd ${DIR_PATH}/
    cp ${TOPDIR}/src/* .
    if [ "${DEBUG}" == "1" ]; then
        echo " [VERSION] `swig4.0 -version|xargs` "                
    fi
    echo -n " [MAKE] Generating c binding for python3 language : "
    if [ -e "${DIR_PATH}/libsrt.interface" ]; then
        # --- Generate preprocessing
        swig4.0 -E -python -debug-classes -debug-symtabs -debug-symbols -debug-csymbols -debug-lsymbols -debug-tags -debug-template -debug-typedef -debug-typemap -debug-tmsearch -debug-tmused ${DIR_PATH}/libsrt.interface > ${DIR_PATH}/libsrt.preprocessing

        # --- Generate binding
        swig4.0 -python ${DIR_PATH}/libsrt.interface > /dev/null 2>&1
        if [ -e "${DIR_PATH}/libsrt_wrap.c" ]; then
            echo "OK (libsrt_wrap.c file well generated)"
        else
            echo "NOK (libsrt_wrap.c file not generated ; exiting !"
            exit 1
        fi
    else
        echo "NOK (Cannot find the libsrt.interface file) ; exiting !"
        exit 1
    fi
}

function compile_binding()
{    
    cd ${DIR_PATH}/
    echo -n " [BUILD] Compiling python binding : "
    if [ -e "./libsrt_wrap.c" ]; then
        LIBSRT_CFLAGS="`pkg-config --cflags srt`"
        if [ "${DEBUG}" == "1" ]; then
            echo " [DEBUG] LIBSRT_CFLAGS=${LIBSRT_CFLAGS}"
        fi
        # --- Compile the srt binding
        g++ -fPIC -c libsrt_wrap.c -I/usr/include/python3.9 -I${DIR_PATH}/delivery/sdk/usr/local/include/srt/ -o libsrt_wrap.o > /dev/null 2>&1
        if [ -e "./libsrt_wrap.o" ]; then
            echo "OK (Object libsrt_wrap.o file well generated) "
        else
            echo "NOK (Object libsrt_wrap.o file noy generated) ; exiting !"
            exit 1
        fi
    else
        echo "NOK (Cannot find the libsrt_wrap.c file) ; exiting !"
        exit 1
    fi
}
 
# http://swig.org/Doc3.0/Python.html#Python_nn3

# ldd srt.so
# 	linux-vdso.so.1 (0x00007ffd8a94e000)
# 	libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f7dc99f0000)
# 	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f7dc99d5000)
# 	libsrt.so.1.4 => /usr/local/lib/libsrt.so.1.4 (0x00007f7dc98fa000)
# 	libpython3.9.so.1.0 => /lib/x86_64-linux-gnu/libpython3.9.so.1.0 (0x00007f7dc935d000)
# 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f7dc916b000)
# 	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f7dc901c000)
# 	/lib64/ld-linux-x86-64.so.2 (0x00007f7dc9c3f000)
# 	libcrypto.so.1.1 => /lib/x86_64-linux-gnu/libcrypto.so.1.1 (0x00007f7dc8d44000)
# 	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f7dc8d21000)
# 	libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007f7dc8cf3000)
# 	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f7dc8cd7000)
# 	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f7dc8cd1000)
# 	libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f7dc8ccc000)

function link_binking()
{
    cd ${DIR_PATH}/
    export LD_LIBRARY_PATH=${DIR_PATH}/delivery/sdk/usr/lib/
    if [ "${DEBUG}" == "1" ]; then
        echo -n " [DEBUG] LD_LIBRARY_PATH=${LD_LIBRARY_PATH} "
    fi
    echo -n " [LINK] Linking python binding with the libsrt dynamic library : "
    if [ -e "./libsrt_wrap.o" ]; then
        LIBSRT_LDLAGS="`pkg-config --libs  srt`"
        if [ "${DEBUG}" == "1" ]; then
            echo " [DEBUG] LIBSRT_LDLAGS=${LIBSRT_LDLAGS}"
        fi
        # --- Link the srt binding with its dependencies
        g++ -shared libsrt_wrap.o -o _srt.so -lm -lstdc++ -lgcc_s -lsrt -lcrypto -lc -lpython3.9 -lnettle -lgnutls -Wl,-soname,_srt.so -L/usr/local/lib > /dev/null 2>&1
        if [ -e "./_srt.so" ]; then
            echo "OK "
        else
            echo "NOK ; exiting !"
            exit 1
        fi
    else
        echo "NOK (Cannot find the libsrt_wrap.o file) ; exiting!"
        exit 1
    fi
}

function install_binding()
{
    cd ${DIR_PATH}/
    ls -al ${DIR_PATH}/_srt.so
    ls -al ${DIR_PATH}/srt.py
    if [ -e "${DIR_PATH}/_srt.so" ] && [ -e "${DIR_PATH}/srt.py" ]; then
        echo " [INSTALL] Installing binding into delivery path "
        for FILE in {"${DIR_PATH}/_srt.so","${DIR_PATH}/srt.py"}; do
            for PYTHON_VERSION in {"3.6","3.7","3.8","3.9","3.10"}; do
                # --- Check if the directory exist
                if [ ! -d "${DIR_PATH}/delivery/sdk/usr/lib/python${PYTHON_VERSION}/" ]; then
                    mkdir -p ${DIR_PATH}/delivery/sdk/usr/lib/python${PYTHON_VERSION}/
                fi
                # --- Copy files needed for the srt python3 binding            
                cp ${FILE} ${DIR_PATH}/delivery/sdk/usr/lib/python${PYTHON_VERSION}/               
            done
            cp ${FILE} ${DIR_PATH}/delivery/
        done        
    else
        echo " [ERROR] Missing ${DIR_PATH}/srt.so and/or ${DIR_PATH}/srt.py ! "
    fi
    cp ${TOPDIR}/examples/*.py .
}

# python3 -v
# (...)
# >>> import srt
# code object from /home/tgayet/Workspace/Python-binding-for-libsrt/tmp/gwpTSqg6pC/srt.py
# created '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/gwpTSqg6pC/__pycache__/srt.cpython-38.pyc'
# extension module '_srt' loaded from '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/gwpTSqg6pC/_srt.so'
# extension module '_srt' executed from '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/gwpTSqg6pC/_srt.so'
# import '_srt' # <_frozen_importlib_external.ExtensionFileLoader object at 0x7f138f9aea90>
#import 'srt' # <_frozen_importlib_external.SourceFileLoader object at 0x7f138fab1e50>

function check_binding()
{
    cd ${DIR_PATH}/
    if [ -e "${DIR_PATH}/srt_check.py" ]; then
        python3 ${DIR_PATH}/srt_check.py
    else
        echo " [ERROR] Missing ${DIR_PATH}/srt_check.py test script !"
    fi
}

function test_binding()
{
    cd ${DIR_PATH}/
    
    # TBD

}

function go_final_delivery()
 {   
    echo ""
    echo "-------------------------------------------------------"
    echo "                  END  OF  PROCESS                     "
    echo "-------------------------------------------------------"
}

function main()
{
    display_header
    check_requirements_installed
    create_temp_directy
    echo " [MAKE] Working directory : ${DIR_PATH}/ "
    get_srt_sdk
    generate_binding
    compile_binding
    link_binking
    install_binding
    echo ""
    tree ${DIR_PATH}
    echo ""
    echo "-------------------------------------------------------"
    echo ""
    check_binding
    #test_binding
    go_final_delivery
}

# --- Main entry
main

exit 0