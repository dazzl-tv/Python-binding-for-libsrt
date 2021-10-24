Here is a python3 binding generation engine (3.6, 3.8, 3.9, ... 2.7 which has become obsolete) for the library managing the SRT communication protocol by Haivision.

It should be noted that this binding does not work with earlier versions and became obsolete in python 3.x.

This bash script requires several prerequisites for a gnu / linux distribution like Debian / Ubuntu:

```
$ sudo apt install swig4.0 \
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
```                        

The script checks in the preamble whether dependencies are required.

However, it is not based on the version of the SRT library packaged in the Debian / Ubuntu repositories, as most of the time they are too old. The choice was therefore made to use a version of the SDK provided via the github haivision.

When the script starts, a cloning or an update of the sdk is performed.

This is a first draft for the generation of a binding but it will be improved to add parameters such as the choice not to update the sdk or to use a sha1 from the official repo, to use a version precise from python3 (3.6, 3.8, 3.9, ....) and so on.

After having checked the dependencies necessary for the correct functioning of the script and after having downloaded the SRT sdk, it will be built and installed in a delivery directory. Thus the generated link will be carried out on a precise and known version of the "srt.h" header. That is why the library will be libsrt.so.1.4 will also be provided.

The bash script "binding.sh" currently runs without any parameters:

```
$ ./binding.sh
  ____ ____ ____ ____ __ __ _ ____ __ __ _ ___ ___ ____ __ _ ____ ____ __ ____ __ ____
 / ___) (_ \ (_ _) (_ \ () ((\ (\ () ((\ / __) / __) (__) ((\ (__) (_ \ / _ \ (_ _) / \ (_ \
 \ ___ \) /) () _ () (/ /) TO DO)) /
 (____ / (__ \ _) (__) (____ / (__) \ _) __) (____ / (__) \ _) __) \ ___ / \ ___ / (____) \ _) __) (____) (__ \ _) \ _ / \ _ / (__) \ __ / (__ \ _)
 
 Copyright (c) 2021 Dazzl - https://site.dazzl.tv/
 Version: 0.1
 
 [CHECK] Verification of mandatory requirements: OK
 [MAKE] Working directory: /home/tgayet/Workspace/Python-binding-for-libsrt/tmp/ o8MWLGyaGi /
 [UPDATE] The sdk srt is already existing (/home/tgayet/Workspace/ Python-binding-for-libsrt/sdk); just update it
 [CONF] Configuration of the srt SDK
 [MAKE] Construction of the srt library
 [INSTALL] Installation of the srt library
 [CHECK] The dynamic libsrt.so v1.4.4 (/home/tgayet/Workspace/Python-binding-for-libsrt/ tmp/o8MWLGyaGi/delivery/sdk/usr/local/lib/) is well installed
 [MAKE] Generation of the c link for the python3 language: OK (libsrt_wrap.c file well generated)
 [BUILD] Compilation of the python link: OK (object file libsrt_wrap.o well generated)
 [LINK] Binding of the python link with the dynamic library libsrt: OK
 [INSTALL] Installation of the link in the delivery path

/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v
├── delivery
│   ├── sdk
│   │   └── usr
│   │       ├── lib
│   │       │   ├── python3.10
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   ├── python3.6
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   ├── python3.7
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   ├── python3.8
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   └── python3.9
│   │       │       ├── srt.py
│   │       │       └── _srt.so
│   │       └── local
│   │           ├── bin
│   │           │   ├── srt-ffplay
│   │           │   ├── srt-file-transmit
│   │           │   ├── srt-live-transmit
│   │           │   └── srt-tunnel
│   │           ├── include
│   │           │   └── srt
│   │           │       ├── access_control.h
│   │           │       ├── logging_api.h
│   │           │       ├── platform_sys.h
│   │           │       ├── srt.h
│   │           │       ├── udt.h
│   │           │       └── version.h
│   │           └── lib
│   │               ├── libsrt.a
│   │               ├── libsrt.so -> libsrt.so.1.4
│   │               ├── libsrt.so.1.4 -> libsrt.so.1.4.4
│   │               ├── libsrt.so.1.4.4
│   │               └── pkgconfig
│   │                   ├── haisrt.pc
│   │                   └── srt.pc
│   ├── srt.py
│   └── _srt.so
├── libsrt.interface
├── libsrt.preprocessing
├── libsrt_wrap.c
├── libsrt_wrap.o
├── old_inspect.py
├── setup.py
├── srt_check.py
├── srt.py
├── _srt.so
├── test-client.py
└── test-server.py

15 directories, 39 files

-------------------------------------------------------

1. Wrapper information : 

linux
['/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/home/tgayet/.local/lib/python3.8/site-packages', '/usr/local/lib/python3.8/dist-packages', '/usr/local/lib/python3.8/dist-packages/gst_gtklaunch_1.0-0.2-py3.8.egg', '/usr/local/lib/python3.8/dist-packages/meson-0.56.99-py3.8.egg', '/usr/local/lib/python3.8/dist-packages/bootstrap4-0.1.0-py3.8.egg', '/usr/local/lib/python3.8/dist-packages/lib_dazzl_logger-2.0.0-py3.8.egg', '/usr/local/lib/python3.8/dist-packages/lib_dazzl_environment-3.4.1-py3.8.egg', '/usr/lib/python3/dist-packages']
['/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v/srt_check.py']
/usr/bin/python3
little
/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v/srt.py
srt
{'__name__': 'srt', '__doc__': None, '__package__': '', '__loader__': <_frozen_importlib_external.SourceFileLoader object at 0x7f7a161c9f10>, '__spec__': ModuleSpec(name='srt', loader=<_frozen_importlib_external.SourceFileLoader object at 0x7f7a161c9f10>, origin='/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v/srt.py'), '__file__': '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v/srt.py', '__cached__': '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v/__pycache__/srt.cpython-38.pyc', '__builtins__': {'__name__': 'builtins', '__doc__': "Built-in functions, exceptions, and other objects.\n\nNoteworthy: None is the `nil' object; Ellipsis represents `...' in slices.", '__package__': '', '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': ModuleSpec(name='builtins', loader=<class '_frozen_importlib.BuiltinImporter'>), '__build_class__': <built-in function __build_class__>, '__import__': <built-in function __import__>, 'abs': <built-in function abs>, 'all': <built-in function all>, 'any': <built-in function any>, 'ascii': <built-in function ascii>, 'bin': <built-in function bin>, 'breakpoint': <built-in function breakpoint>, 'callable': <built-in function callable>, 'chr': <built-in function chr>, 'compile': <built-in function compile>, 'delattr': <built-in function delattr>, 'dir': <built-in function dir>, 'divmod': <built-in function divmod>, 'eval': <built-in function eval>, 'exec': <built-in function exec>, 'format': <built-in function format>, 'getattr': <built-in function getattr>, 'globals': <built-in function globals>, 'hasattr': <built-in function hasattr>, 'hash': <built-in function hash>, 'hex': <built-in function hex>, 'id': <built-in function id>, 'input': <built-in function input>, 'isinstance': <built-in function isinstance>, 'issubclass': <built-in function issubclass>, 'iter': <built-in function iter>, 'len': <built-in function len>, 'locals': <built-in function locals>, 'max': <built-in function max>, 'min': <built-in function min>, 'next': <built-in function next>, 'oct': <built-in function oct>, 'ord': <built-in function ord>, 'pow': <built-in function pow>, 'print': <built-in function print>, 'repr': <built-in function repr>, 'round': <built-in function round>, 'setattr': <built-in function setattr>, 'sorted': <built-in function sorted>, 'sum': <built-in function sum>, 'vars': <built-in function vars>, 'None': None, 'Ellipsis': Ellipsis, 'NotImplemented': NotImplemented, 'False': False, 'True': True, 'bool': <class 'bool'>, 'memoryview': <class 'memoryview'>, 'bytearray': <class 'bytearray'>, 'bytes': <class 'bytes'>, 'classmethod': <class 'classmethod'>, 'complex': <class 'complex'>, 'dict': <class 'dict'>, 'enumerate': <class 'enumerate'>, 'filter': <class 'filter'>, 'float': <class 'float'>, 'frozenset': <class 'frozenset'>, 'property': <class 'property'>, 'int': <class 'int'>, 'list': <class 'list'>, 'map': <class 'map'>, 'object': <class 'object'>, 'range': <class 'range'>, 'reversed': <class 'reversed'>, 'set': <class 'set'>, 'slice': <class 'slice'>, 'staticmethod': <class 'staticmethod'>, 'str': <class 'str'>, 'super': <class 'super'>, 'tuple': <class 'tuple'>, 'type': <class 'type'>, 'zip': <class 'zip'>, '__debug__': True, 'BaseException': <class 'BaseException'>, 'Exception': <class 'Exception'>, 'TypeError': <class 'TypeError'>, 'StopAsyncIteration': <class 'StopAsyncIteration'>, 'StopIteration': <class 'StopIteration'>, 'GeneratorExit': <class 'GeneratorExit'>, 'SystemExit': <class 'SystemExit'>, 'KeyboardInterrupt': <class 'KeyboardInterrupt'>, 'ImportError': <class 'ImportError'>, 'ModuleNotFoundError': <class 'ModuleNotFoundError'>, 'OSError': <class 'OSError'>, 'EnvironmentError': <class 'OSError'>, 'IOError': <class 'OSError'>, 'EOFError': <class 'EOFError'>, 'RuntimeError': <class 'RuntimeError'>, 'RecursionError': <class 'RecursionError'>, 'NotImplementedError': <class 'NotImplementedError'>, 'NameError': <class 'NameError'>, 'UnboundLocalError': <class 'UnboundLocalError'>, 'AttributeError': <class 'AttributeError'>, 'SyntaxError': <class 'SyntaxError'>, 'IndentationError': <class 'IndentationError'>, 'TabError': <class 'TabError'>, 'LookupError': <class 'LookupError'>, 'IndexError': <class 'IndexError'>, 'KeyError': <class 'KeyError'>, 'ValueError': <class 'ValueError'>, 'UnicodeError': <class 'UnicodeError'>, 'UnicodeEncodeError': <class 'UnicodeEncodeError'>, 'UnicodeDecodeError': <class 'UnicodeDecodeError'>, 'UnicodeTranslateError': <class 'UnicodeTranslateError'>, 'AssertionError': <class 'AssertionError'>, 'ArithmeticError': <class 'ArithmeticError'>, 'FloatingPointError': <class 'FloatingPointError'>, 'OverflowError': <class 'OverflowError'>, 'ZeroDivisionError': <class 'ZeroDivisionError'>, 'SystemError': <class 'SystemError'>, 'ReferenceError': <class 'ReferenceError'>, 'MemoryError': <class 'MemoryError'>, 'BufferError': <class 'BufferError'>, 'Warning': <class 'Warning'>, 'UserWarning': <class 'UserWarning'>, 'DeprecationWarning': <class 'DeprecationWarning'>, 'PendingDeprecationWarning': <class 'PendingDeprecationWarning'>, 'SyntaxWarning': <class 'SyntaxWarning'>, 'RuntimeWarning': <class 'RuntimeWarning'>, 'FutureWarning': <class 'FutureWarning'>, 'ImportWarning': <class 'ImportWarning'>, 'UnicodeWarning': <class 'UnicodeWarning'>, 'BytesWarning': <class 'BytesWarning'>, 'ResourceWarning': <class 'ResourceWarning'>, 'ConnectionError': <class 'ConnectionError'>, 'BlockingIOError': <class 'BlockingIOError'>, 'BrokenPipeError': <class 'BrokenPipeError'>, 'ChildProcessError': <class 'ChildProcessError'>, 'ConnectionAbortedError': <class 'ConnectionAbortedError'>, 'ConnectionRefusedError': <class 'ConnectionRefusedError'>, 'ConnectionResetError': <class 'ConnectionResetError'>, 'FileExistsError': <class 'FileExistsError'>, 'FileNotFoundError': <class 'FileNotFoundError'>, 'IsADirectoryError': <class 'IsADirectoryError'>, 'NotADirectoryError': <class 'NotADirectoryError'>, 'InterruptedError': <class 'InterruptedError'>, 'PermissionError': <class 'PermissionError'>, 'ProcessLookupError': <class 'ProcessLookupError'>, 'TimeoutError': <class 'TimeoutError'>, 'open': <built-in function open>, 'quit': Use quit() or Ctrl-D (i.e. EOF) to exit, 'exit': Use exit() or Ctrl-D (i.e. EOF) to exit, 'copyright': Copyright (c) 2001-2021 Python Software Foundation.
All Rights Reserved.

Copyright (c) 2000 BeOpen.com.
All Rights Reserved.

Copyright (c) 1995-2001 Corporation for National Research Initiatives.
All Rights Reserved.

Copyright (c) 1991-1995 Stichting Mathematisch Centrum, Amsterdam.
All Rights Reserved., 'credits':     Thanks to CWI, CNRI, BeOpen.com, Zope Corporation and a cast of thousands
    for supporting Python development.  See www.python.org for more information., 'license': Type license() to see the full license text, 'help': Type help() for interactive help, or help(object) for help about object.}, '_swig_python_version_info': sys.version_info(major=3, minor=8, micro=10, releaselevel='final', serial=0), '_srt': <module '_srt' from '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/Bnpwpw9D6v/_srt.so'>, '__builtin__': <module 'builtins' (built-in)>, '_swig_repr': <function _swig_repr at 0x7f7a160c1dc0>, '_swig_setattr_nondynamic_instance_variable': <function _swig_setattr_nondynamic_instance_variable at 0x7f7a160c1ee0>, '_swig_setattr_nondynamic_class_variable': <function _swig_setattr_nondynamic_class_variable at 0x7f7a160c1f70>, '_swig_add_metaclass': <function _swig_add_metaclass at 0x7f7a160e9040>, '_SwigNonDynamicMeta': <class 'srt._SwigNonDynamicMeta'>, 'SRT_VERSION_FEAT_HSv5': 66304, 'SRT_HAVE_CXX17': 0, 'ENABLE_EXPERIMENTAL_BONDING': 0, 'SRTS_INIT': 1, 'SRTS_OPENED': 2, 'SRTS_LISTENING': 3, 'SRTS_CONNECTING': 4, 'SRTS_CONNECTED': 5, 'SRTS_BROKEN': 6, 'SRTS_CLOSING': 7, 'SRTS_CLOSED': 8, 'SRTS_NONEXIST': 9, 'SRTO_MSS': 0, 'SRTO_SNDSYN': 1, 'SRTO_RCVSYN': 2, 'SRTO_ISN': 3, 'SRTO_FC': 4, 'SRTO_SNDBUF': 5, 'SRTO_RCVBUF': 6, 'SRTO_LINGER': 7, 'SRTO_UDP_SNDBUF': 8, 'SRTO_UDP_RCVBUF': 9, 'SRTO_RENDEZVOUS': 12, 'SRTO_SNDTIMEO': 13, 'SRTO_RCVTIMEO': 14, 'SRTO_REUSEADDR': 15, 'SRTO_MAXBW': 16, 'SRTO_STATE': 17, 'SRTO_EVENT': 18, 'SRTO_SNDDATA': 19, 'SRTO_RCVDATA': 20, 'SRTO_SENDER': 21, 'SRTO_TSBPDMODE': 22, 'SRTO_LATENCY': 23, 'SRTO_INPUTBW': 24, 'SRTO_OHEADBW': 25, 'SRTO_PASSPHRASE': 26, 'SRTO_PBKEYLEN': 27, 'SRTO_KMSTATE': 28, 'SRTO_IPTTL': 29, 'SRTO_IPTOS': 30, 'SRTO_TLPKTDROP': 31, 'SRTO_SNDDROPDELAY': 32, 'SRTO_NAKREPORT': 33, 'SRTO_VERSION': 34, 'SRTO_PEERVERSION': 35, 'SRTO_CONNTIMEO': 36, 'SRTO_DRIFTTRACER': 37, 'SRTO_MININPUTBW': 38, 'SRTO_SNDKMSTATE': 40, 'SRTO_RCVKMSTATE': 41, 'SRTO_LOSSMAXTTL': 42, 'SRTO_RCVLATENCY': 43, 'SRTO_PEERLATENCY': 44, 'SRTO_MINVERSION': 45, 'SRTO_STREAMID': 46, 'SRTO_CONGESTION': 47, 'SRTO_MESSAGEAPI': 48, 'SRTO_PAYLOADSIZE': 49, 'SRTO_TRANSTYPE': 50, 'SRTO_KMREFRESHRATE': 51, 'SRTO_KMPREANNOUNCE': 52, 'SRTO_ENFORCEDENCRYPTION': 53, 'SRTO_IPV6ONLY': 54, 'SRTO_PEERIDLETIMEO': 55, 'SRTO_BINDTODEVICE': 56, 'SRTO_PACKETFILTER': 60, 'SRTO_RETRANSMITALGO': 61, 'SRTO_E_SIZE': 62, 'SRTO_DEPRECATED_END': 0, 'SRTT_LIVE': 0, 'SRTT_FILE': 1, 'SRTT_INVALID': 2, 'CBytePerfMon': <class 'srt.CBytePerfMon'>, 'cvar': <Swig global variables>, 'SRTGROUP_MASK': <Swig Object of type 'SRT_EPOLL_T *' at 0x7f7a160d8300>, 'SRT_LIVE_DEF_PLSIZE': 1316, 'SRT_LIVE_MAX_PLSIZE': 1456, 'SRT_LIVE_DEF_LATENCY_MS': 120, 'MJ_UNKNOWN': -1, 'MJ_SUCCESS': 0, 'MJ_SETUP': 1, 'MJ_CONNECTION': 2, 'MJ_SYSTEMRES': 3, 'MJ_FILESYSTEM': 4, 'MJ_NOTSUP': 5, 'MJ_AGAIN': 6, 'MJ_PEERERROR': 7, 'MN_NONE': 0, 'MN_TIMEOUT': 1, 'MN_REJECTED': 2, 'MN_NORES': 3, 'MN_SECURITY': 4, 'MN_CLOSED': 5, 'MN_CONNLOST': 1, 'MN_NOCONN': 2, 'MN_THREAD': 1, 'MN_MEMORY': 2, 'MN_OBJECT': 3, 'MN_SEEKGFAIL': 1, 'MN_READFAIL': 2, 'MN_SEEKPFAIL': 3, 'MN_WRITEFAIL': 4, 'MN_ISBOUND': 1, 'MN_ISCONNECTED': 2, 'MN_INVAL': 3, 'MN_SIDINVAL': 4, 'MN_ISUNBOUND': 5, 'MN_NOLISTEN': 6, 'MN_ISRENDEZVOUS': 7, 'MN_ISRENDUNBOUND': 8, 'MN_INVALMSGAPI': 9, 'MN_INVALBUFFERAPI': 10, 'MN_BUSY': 11, 'MN_XSIZE': 12, 'MN_EIDINVAL': 13, 'MN_EEMPTY': 14, 'MN_BUSYPORT': 15, 'MN_WRAVAIL': 1, 'MN_RDAVAIL': 2, 'MN_XMTIMEOUT': 3, 'MN_CONGESTION': 4, 'SRT_EUNKNOWN': -1, 'SRT_SUCCESS': 0, 'SRT_ECONNSETUP': 1000, 'SRT_ENOSERVER': 1001, 'SRT_ECONNREJ': 1002, 'SRT_ESOCKFAIL': 1003, 'SRT_ESECFAIL': 1004, 'SRT_ESCLOSED': 1005, 'SRT_ECONNFAIL': 2000, 'SRT_ECONNLOST': 2001, 'SRT_ENOCONN': 2002, 'SRT_ERESOURCE': 3000, 'SRT_ETHREAD': 3001, 'SRT_ENOBUF': 3002, 'SRT_ESYSOBJ': 3003, 'SRT_EFILE': 4000, 'SRT_EINVRDOFF': 4001, 'SRT_ERDPERM': 4002, 'SRT_EINVWROFF': 4003, 'SRT_EWRPERM': 4004, 'SRT_EINVOP': 5000, 'SRT_EBOUNDSOCK': 5001, 'SRT_ECONNSOCK': 5002, 'SRT_EINVPARAM': 5003, 'SRT_EINVSOCK': 5004, 'SRT_EUNBOUNDSOCK': 5005, 'SRT_ENOLISTEN': 5006, 'SRT_ERDVNOSERV': 5007, 'SRT_ERDVUNBOUND': 5008, 'SRT_EINVALMSGAPI': 5009, 'SRT_EINVALBUFFERAPI': 5010, 'SRT_EDUPLISTEN': 5011, 'SRT_ELARGEMSG': 5012, 'SRT_EINVPOLLID': 5013, 'SRT_EPOLLEMPTY': 5014, 'SRT_EBINDCONFLICT': 5015, 'SRT_EASYNCFAIL': 6000, 'SRT_EASYNCSND': 6001, 'SRT_EASYNCRCV': 6002, 'SRT_ETIMEOUT': 6003, 'SRT_ECONGEST': 6004, 'SRT_EPEERERR': 7000, 'SRT_REJ_UNKNOWN': 0, 'SRT_REJ_SYSTEM': 1, 'SRT_REJ_PEER': 2, 'SRT_REJ_RESOURCE': 3, 'SRT_REJ_ROGUE': 4, 'SRT_REJ_BACKLOG': 5, 'SRT_REJ_IPE': 6, 'SRT_REJ_CLOSE': 7, 'SRT_REJ_VERSION': 8, 'SRT_REJ_RDVCOOKIE': 9, 'SRT_REJ_BADSECRET': 10, 'SRT_REJ_UNSECURE': 11, 'SRT_REJ_MESSAGEAPI': 12, 'SRT_REJ_CONGESTION': 13, 'SRT_REJ_FILTER': 14, 'SRT_REJ_GROUP': 15, 'SRT_REJ_TIMEOUT': 16, 'SRT_REJ_E_SIZE': 17, 'SRT_REJC_INTERNAL': 0, 'SRT_REJC_PREDEFINED': 1000, 'SRT_REJC_USERDEFINED': 2000, 'SRT_LOGFA_GENERAL': 0, 'SRT_LOGFA_SOCKMGMT': 1, 'SRT_LOGFA_CONN': 2, 'SRT_LOGFA_XTIMER': 3, 'SRT_LOGFA_TSBPD': 4, 'SRT_LOGFA_RSRC': 5, 'SRT_LOGFA_CONGEST': 7, 'SRT_LOGFA_PFILTER': 8, 'SRT_LOGFA_API_CTRL': 11, 'SRT_LOGFA_QUE_CTRL': 13, 'SRT_LOGFA_EPOLL_UPD': 16, 'SRT_LOGFA_API_RECV': 21, 'SRT_LOGFA_BUF_RECV': 22, 'SRT_LOGFA_QUE_RECV': 23, 'SRT_LOGFA_CHN_RECV': 24, 'SRT_LOGFA_GRP_RECV': 25, 'SRT_LOGFA_API_SEND': 31, 'SRT_LOGFA_BUF_SEND': 32, 'SRT_LOGFA_QUE_SEND': 33, 'SRT_LOGFA_CHN_SEND': 34, 'SRT_LOGFA_GRP_SEND': 35, 'SRT_LOGFA_INTERNAL': 41, 'SRT_LOGFA_QUE_MGMT': 43, 'SRT_LOGFA_CHN_MGMT': 44, 'SRT_LOGFA_GRP_MGMT': 45, 'SRT_LOGFA_EPOLL_API': 46, 'SRT_LOGFA_HAICRYPT': 6, 'SRT_LOGFA_APPLOG': 10, 'SRT_LOGFA_LASTNONE': 63, 'SRT_KM_S_UNSECURED': 0, 'SRT_KM_S_SECURING': 1, 'SRT_KM_S_SECURED': 2, 'SRT_KM_S_NOSECRET': 3, 'SRT_KM_S_BADSECRET': 4, 'SRT_EPOLL_OPT_NONE': 0, 'SRT_EPOLL_IN': 1, 'SRT_EPOLL_OUT': 4, 'SRT_EPOLL_ERR': 8, 'SRT_EPOLL_CONNECT': 4, 'SRT_EPOLL_ACCEPT': 1, 'SRT_EPOLL_UPDATE': 16, 'SRT_EPOLL_ET': -2147483648, 'SRT_EPOLL_ENABLE_EMPTY': 1, 'SRT_EPOLL_ENABLE_OUTPUTCHECK': 2, 'srt_startup': <function srt_startup at 0x7f7a160e90d0>, 'srt_cleanup': <function srt_cleanup at 0x7f7a160e93a0>, 'srt_socket': <function srt_socket at 0x7f7a160e9430>, 'srt_create_socket': <function srt_create_socket at 0x7f7a160e94c0>, 'srt_bind': <function srt_bind at 0x7f7a160e9550>, 'srt_bind_acquire': <function srt_bind_acquire at 0x7f7a160e95e0>, 'srt_bind_peerof': <function srt_bind_peerof at 0x7f7a160e9670>, 'srt_listen': <function srt_listen at 0x7f7a160e9700>, 'srt_accept': <function srt_accept at 0x7f7a160e9790>, 'srt_accept_bond': <function srt_accept_bond at 0x7f7a160e9820>, 'srt_listen_callback': <function srt_listen_callback at 0x7f7a160e98b0>, 'srt_connect_callback': <function srt_connect_callback at 0x7f7a160e9940>, 'srt_connect': <function srt_connect at 0x7f7a160e99d0>, 'srt_connect_debug': <function srt_connect_debug at 0x7f7a160e9a60>, 'srt_connect_bind': <function srt_connect_bind at 0x7f7a160e9af0>, 'srt_rendezvous': <function srt_rendezvous at 0x7f7a160e9b80>, 'srt_close': <function srt_close at 0x7f7a160e9c10>, 'srt_getpeername': <function srt_getpeername at 0x7f7a160e9ca0>, 'srt_getsockname': <function srt_getsockname at 0x7f7a160e9d30>, 'srt_getsockopt': <function srt_getsockopt at 0x7f7a160e9dc0>, 'srt_setsockopt': <function srt_setsockopt at 0x7f7a160e9e50>, 'srt_getsockflag': <function srt_getsockflag at 0x7f7a160e9ee0>, 'srt_setsockflag': <function srt_setsockflag at 0x7f7a160e9f70>, 'SRT_MSGCTRL': <class 'srt.SRT_MSGCTRL'>, 'SRT_INVALID_SOCK': <Swig Object of type 'SRT_EPOLL_T *' at 0x7f7a160d83f0>, 'SRT_ERROR': -1, 'srt_msgctrl_init': <function srt_msgctrl_init at 0x7f7a160f1040>, 'srt_send': <function srt_send at 0x7f7a160f1280>, 'srt_sendmsg': <function srt_sendmsg at 0x7f7a160f1310>, 'srt_sendmsg2': <function srt_sendmsg2 at 0x7f7a160f13a0>, 'srt_recv': <function srt_recv at 0x7f7a160f1430>, 'srt_recvmsg': <function srt_recvmsg at 0x7f7a160f14c0>, 'srt_recvmsg2': <function srt_recvmsg2 at 0x7f7a160f1550>, 'SRT_DEFAULT_SENDFILE_BLOCK': 364000, 'SRT_DEFAULT_RECVFILE_BLOCK': 7280000, 'srt_sendfile': <function srt_sendfile at 0x7f7a160f15e0>, 'srt_recvfile': <function srt_recvfile at 0x7f7a160f1670>, 'srt_getlasterror_str': <function srt_getlasterror_str at 0x7f7a160f1700>, 'srt_getlasterror': <function srt_getlasterror at 0x7f7a160f1790>, 'srt_strerror': <function srt_strerror at 0x7f7a160f1820>, 'srt_clearlasterror': <function srt_clearlasterror at 0x7f7a160f18b0>, 'srt_bstats': <function srt_bstats at 0x7f7a160f1940>, 'srt_bistats': <function srt_bistats at 0x7f7a160f19d0>, 'srt_getsockstate': <function srt_getsockstate at 0x7f7a160f1a60>, 'srt_epoll_create': <function srt_epoll_create at 0x7f7a160f1af0>, 'srt_epoll_clear_usocks': <function srt_epoll_clear_usocks at 0x7f7a160f1b80>, 'srt_epoll_add_usock': <function srt_epoll_add_usock at 0x7f7a160f1c10>, 'srt_epoll_add_ssock': <function srt_epoll_add_ssock at 0x7f7a160f1ca0>, 'srt_epoll_remove_usock': <function srt_epoll_remove_usock at 0x7f7a160f1d30>, 'srt_epoll_remove_ssock': <function srt_epoll_remove_ssock at 0x7f7a160f1dc0>, 'srt_epoll_update_usock': <function srt_epoll_update_usock at 0x7f7a160f1e50>, 'srt_epoll_update_ssock': <function srt_epoll_update_ssock at 0x7f7a160f1ee0>, 'srt_epoll_wait': <function srt_epoll_wait at 0x7f7a160f1f70>, 'SRT_EPOLL_EVENT': <class 'srt.SRT_EPOLL_EVENT'>, 'SRT_SEQNO_NONE': <Swig Object of type 'SRT_EPOLL_T *' at 0x7f7a160d8450>, 'SRT_MSGNO_NONE': <Swig Object of type 'SRT_EPOLL_T *' at 0x7f7a160d8420>, 'SRT_MSGNO_CONTROL': <Swig Object of type 'SRT_EPOLL_T *' at 0x7f7a160d8330>, 'SRT_MSGTTL_INF': -1, 'srt_msgctrl_default': <srt.SRT_MSGCTRL; proxy of <Swig Object of type 'SRT_MsgCtrl_ *' at 0x7f7a160d84e0> >, 'srt_epoll_uwait': <function srt_epoll_uwait at 0x7f7a160f5040>, 'srt_epoll_set': <function srt_epoll_set at 0x7f7a160f5280>, 'srt_epoll_release': <function srt_epoll_release at 0x7f7a160f5310>, 'srt_setloglevel': <function srt_setloglevel at 0x7f7a160f53a0>, 'srt_addlogfa': <function srt_addlogfa at 0x7f7a160f5430>, 'srt_dellogfa': <function srt_dellogfa at 0x7f7a160f54c0>, 'srt_resetlogfa': <function srt_resetlogfa at 0x7f7a160f5550>, 'srt_setloghandler': <function srt_setloghandler at 0x7f7a160f55e0>, 'srt_setlogflags': <function srt_setlogflags at 0x7f7a160f5670>, 'srt_getsndbuffer': <function srt_getsndbuffer at 0x7f7a160f5700>, 'srt_getrejectreason': <function srt_getrejectreason at 0x7f7a160f5790>, 'srt_setrejectreason': <function srt_setrejectreason at 0x7f7a160f5820>, 'srt_rejectreason_str': <function srt_rejectreason_str at 0x7f7a160f58b0>, 'srt_getversion': <function srt_getversion at 0x7f7a160f5940>, 'srt_time_now': <function srt_time_now at 0x7f7a160f59d0>, 'srt_connection_time': <function srt_connection_time at 0x7f7a160f5a60>, 'SRT_SYNC_CLOCK_STDCXX_STEADY': 0, 'SRT_SYNC_CLOCK_GETTIME_MONOTONIC': 1, 'SRT_SYNC_CLOCK_WINQPC': 2, 'SRT_SYNC_CLOCK_MACH_ABSTIME': 3, 'SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY': 4, 'SRT_SYNC_CLOCK_AMD64_RDTSC': 5, 'SRT_SYNC_CLOCK_IA32_RDTSC': 6, 'SRT_SYNC_CLOCK_IA64_ITC': 7, 'srt_clock_type': <function srt_clock_type at 0x7f7a160f5af0>, 'srt_rejectreason_msg': <Swig Object of type 'char **' at 0x7f7a160d8630>}
<class 'module'>
140162333276576
['CBytePerfMon', 'ENABLE_EXPERIMENTAL_BONDING', 'MJ_AGAIN', 'MJ_CONNECTION', 'MJ_FILESYSTEM', 'MJ_NOTSUP', 'MJ_PEERERROR', 'MJ_SETUP', 'MJ_SUCCESS', 'MJ_SYSTEMRES', 'MJ_UNKNOWN', 'MN_BUSY', 'MN_BUSYPORT', 'MN_CLOSED', 'MN_CONGESTION', 'MN_CONNLOST', 'MN_EEMPTY', 'MN_EIDINVAL', 'MN_INVAL', 'MN_INVALBUFFERAPI', 'MN_INVALMSGAPI', 'MN_ISBOUND', 'MN_ISCONNECTED', 'MN_ISRENDEZVOUS', 'MN_ISRENDUNBOUND', 'MN_ISUNBOUND', 'MN_MEMORY', 'MN_NOCONN', 'MN_NOLISTEN', 'MN_NONE', 'MN_NORES', 'MN_OBJECT', 'MN_RDAVAIL', 'MN_READFAIL', 'MN_REJECTED', 'MN_SECURITY', 'MN_SEEKGFAIL', 'MN_SEEKPFAIL', 'MN_SIDINVAL', 'MN_THREAD', 'MN_TIMEOUT', 'MN_WRAVAIL', 'MN_WRITEFAIL', 'MN_XMTIMEOUT', 'MN_XSIZE', 'SRTGROUP_MASK', 'SRTO_BINDTODEVICE', 'SRTO_CONGESTION', 'SRTO_CONNTIMEO', 'SRTO_DEPRECATED_END', 'SRTO_DRIFTTRACER', 'SRTO_ENFORCEDENCRYPTION', 'SRTO_EVENT', 'SRTO_E_SIZE', 'SRTO_FC', 'SRTO_INPUTBW', 'SRTO_IPTOS', 'SRTO_IPTTL', 'SRTO_IPV6ONLY', 'SRTO_ISN', 'SRTO_KMPREANNOUNCE', 'SRTO_KMREFRESHRATE', 'SRTO_KMSTATE', 'SRTO_LATENCY', 'SRTO_LINGER', 'SRTO_LOSSMAXTTL', 'SRTO_MAXBW', 'SRTO_MESSAGEAPI', 'SRTO_MININPUTBW', 'SRTO_MINVERSION', 'SRTO_MSS', 'SRTO_NAKREPORT', 'SRTO_OHEADBW', 'SRTO_PACKETFILTER', 'SRTO_PASSPHRASE', 'SRTO_PAYLOADSIZE', 'SRTO_PBKEYLEN', 'SRTO_PEERIDLETIMEO', 'SRTO_PEERLATENCY', 'SRTO_PEERVERSION', 'SRTO_RCVBUF', 'SRTO_RCVDATA', 'SRTO_RCVKMSTATE', 'SRTO_RCVLATENCY', 'SRTO_RCVSYN', 'SRTO_RCVTIMEO', 'SRTO_RENDEZVOUS', 'SRTO_RETRANSMITALGO', 'SRTO_REUSEADDR', 'SRTO_SENDER', 'SRTO_SNDBUF', 'SRTO_SNDDATA', 'SRTO_SNDDROPDELAY', 'SRTO_SNDKMSTATE', 'SRTO_SNDSYN', 'SRTO_SNDTIMEO', 'SRTO_STATE', 'SRTO_STREAMID', 'SRTO_TLPKTDROP', 'SRTO_TRANSTYPE', 'SRTO_TSBPDMODE', 'SRTO_UDP_RCVBUF', 'SRTO_UDP_SNDBUF', 'SRTO_VERSION', 'SRTS_BROKEN', 'SRTS_CLOSED', 'SRTS_CLOSING', 'SRTS_CONNECTED', 'SRTS_CONNECTING', 'SRTS_INIT', 'SRTS_LISTENING', 'SRTS_NONEXIST', 'SRTS_OPENED', 'SRTT_FILE', 'SRTT_INVALID', 'SRTT_LIVE', 'SRT_DEFAULT_RECVFILE_BLOCK', 'SRT_DEFAULT_SENDFILE_BLOCK', 'SRT_EASYNCFAIL', 'SRT_EASYNCRCV', 'SRT_EASYNCSND', 'SRT_EBINDCONFLICT', 'SRT_EBOUNDSOCK', 'SRT_ECONGEST', 'SRT_ECONNFAIL', 'SRT_ECONNLOST', 'SRT_ECONNREJ', 'SRT_ECONNSETUP', 'SRT_ECONNSOCK', 'SRT_EDUPLISTEN', 'SRT_EFILE', 'SRT_EINVALBUFFERAPI', 'SRT_EINVALMSGAPI', 'SRT_EINVOP', 'SRT_EINVPARAM', 'SRT_EINVPOLLID', 'SRT_EINVRDOFF', 'SRT_EINVSOCK', 'SRT_EINVWROFF', 'SRT_ELARGEMSG', 'SRT_ENOBUF', 'SRT_ENOCONN', 'SRT_ENOLISTEN', 'SRT_ENOSERVER', 'SRT_EPEERERR', 'SRT_EPOLLEMPTY', 'SRT_EPOLL_ACCEPT', 'SRT_EPOLL_CONNECT', 'SRT_EPOLL_ENABLE_EMPTY', 'SRT_EPOLL_ENABLE_OUTPUTCHECK', 'SRT_EPOLL_ERR', 'SRT_EPOLL_ET', 'SRT_EPOLL_EVENT', 'SRT_EPOLL_IN', 'SRT_EPOLL_OPT_NONE', 'SRT_EPOLL_OUT', 'SRT_EPOLL_UPDATE', 'SRT_ERDPERM', 'SRT_ERDVNOSERV', 'SRT_ERDVUNBOUND', 'SRT_ERESOURCE', 'SRT_ERROR', 'SRT_ESCLOSED', 'SRT_ESECFAIL', 'SRT_ESOCKFAIL', 'SRT_ESYSOBJ', 'SRT_ETHREAD', 'SRT_ETIMEOUT', 'SRT_EUNBOUNDSOCK', 'SRT_EUNKNOWN', 'SRT_EWRPERM', 'SRT_HAVE_CXX17', 'SRT_INVALID_SOCK', 'SRT_KM_S_BADSECRET', 'SRT_KM_S_NOSECRET', 'SRT_KM_S_SECURED', 'SRT_KM_S_SECURING', 'SRT_KM_S_UNSECURED', 'SRT_LIVE_DEF_LATENCY_MS', 'SRT_LIVE_DEF_PLSIZE', 'SRT_LIVE_MAX_PLSIZE', 'SRT_LOGFA_API_CTRL', 'SRT_LOGFA_API_RECV', 'SRT_LOGFA_API_SEND', 'SRT_LOGFA_APPLOG', 'SRT_LOGFA_BUF_RECV', 'SRT_LOGFA_BUF_SEND', 'SRT_LOGFA_CHN_MGMT', 'SRT_LOGFA_CHN_RECV', 'SRT_LOGFA_CHN_SEND', 'SRT_LOGFA_CONGEST', 'SRT_LOGFA_CONN', 'SRT_LOGFA_EPOLL_API', 'SRT_LOGFA_EPOLL_UPD', 'SRT_LOGFA_GENERAL', 'SRT_LOGFA_GRP_MGMT', 'SRT_LOGFA_GRP_RECV', 'SRT_LOGFA_GRP_SEND', 'SRT_LOGFA_HAICRYPT', 'SRT_LOGFA_INTERNAL', 'SRT_LOGFA_LASTNONE', 'SRT_LOGFA_PFILTER', 'SRT_LOGFA_QUE_CTRL', 'SRT_LOGFA_QUE_MGMT', 'SRT_LOGFA_QUE_RECV', 'SRT_LOGFA_QUE_SEND', 'SRT_LOGFA_RSRC', 'SRT_LOGFA_SOCKMGMT', 'SRT_LOGFA_TSBPD', 'SRT_LOGFA_XTIMER', 'SRT_MSGCTRL', 'SRT_MSGNO_CONTROL', 'SRT_MSGNO_NONE', 'SRT_MSGTTL_INF', 'SRT_REJC_INTERNAL', 'SRT_REJC_PREDEFINED', 'SRT_REJC_USERDEFINED', 'SRT_REJ_BACKLOG', 'SRT_REJ_BADSECRET', 'SRT_REJ_CLOSE', 'SRT_REJ_CONGESTION', 'SRT_REJ_E_SIZE', 'SRT_REJ_FILTER', 'SRT_REJ_GROUP', 'SRT_REJ_IPE', 'SRT_REJ_MESSAGEAPI', 'SRT_REJ_PEER', 'SRT_REJ_RDVCOOKIE', 'SRT_REJ_RESOURCE', 'SRT_REJ_ROGUE', 'SRT_REJ_SYSTEM', 'SRT_REJ_TIMEOUT', 'SRT_REJ_UNKNOWN', 'SRT_REJ_UNSECURE', 'SRT_REJ_VERSION', 'SRT_SEQNO_NONE', 'SRT_SUCCESS', 'SRT_SYNC_CLOCK_AMD64_RDTSC', 'SRT_SYNC_CLOCK_GETTIME_MONOTONIC', 'SRT_SYNC_CLOCK_IA32_RDTSC', 'SRT_SYNC_CLOCK_IA64_ITC', 'SRT_SYNC_CLOCK_MACH_ABSTIME', 'SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY', 'SRT_SYNC_CLOCK_STDCXX_STEADY', 'SRT_SYNC_CLOCK_WINQPC', 'SRT_VERSION_FEAT_HSv5', '_SwigNonDynamicMeta', '__builtin__', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', '_srt', '_swig_add_metaclass', '_swig_python_version_info', '_swig_repr', '_swig_setattr_nondynamic_class_variable', '_swig_setattr_nondynamic_instance_variable', 'cvar', 'srt_accept', 'srt_accept_bond', 'srt_addlogfa', 'srt_bind', 'srt_bind_acquire', 'srt_bind_peerof', 'srt_bistats', 'srt_bstats', 'srt_cleanup', 'srt_clearlasterror', 'srt_clock_type', 'srt_close', 'srt_connect', 'srt_connect_bind', 'srt_connect_callback', 'srt_connect_debug', 'srt_connection_time', 'srt_create_socket', 'srt_dellogfa', 'srt_epoll_add_ssock', 'srt_epoll_add_usock', 'srt_epoll_clear_usocks', 'srt_epoll_create', 'srt_epoll_release', 'srt_epoll_remove_ssock', 'srt_epoll_remove_usock', 'srt_epoll_set', 'srt_epoll_update_ssock', 'srt_epoll_update_usock', 'srt_epoll_uwait', 'srt_epoll_wait', 'srt_getlasterror', 'srt_getlasterror_str', 'srt_getpeername', 'srt_getrejectreason', 'srt_getsndbuffer', 'srt_getsockflag', 'srt_getsockname', 'srt_getsockopt', 'srt_getsockstate', 'srt_getversion', 'srt_listen', 'srt_listen_callback', 'srt_msgctrl_default', 'srt_msgctrl_init', 'srt_recv', 'srt_recvfile', 'srt_recvmsg', 'srt_recvmsg2', 'srt_rejectreason_msg', 'srt_rejectreason_str', 'srt_rendezvous', 'srt_resetlogfa', 'srt_send', 'srt_sendfile', 'srt_sendmsg', 'srt_sendmsg2', 'srt_setlogflags', 'srt_setloghandler', 'srt_setloglevel', 'srt_setrejectreason', 'srt_setsockflag', 'srt_setsockopt', 'srt_socket', 'srt_startup', 'srt_strerror', 'srt_time_now']
 
-----------------------------------------------------------
 
2. Method listing :
 
['CBytePerfMon', 'ENABLE_EXPERIMENTAL_BONDING', 'MJ_AGAIN', 'MJ_CONNECTION', 'MJ_FILESYSTEM', 'MJ_NOTSUP', 'MJ_PEERERROR', 'MJ_SETUP', 'MJ_SUCCESS', 'MJ_SYSTEMRES', 'MJ_UNKNOWN', 'MN_BUSY', 'MN_BUSYPORT', 'MN_CLOSED', 'MN_CONGESTION', 'MN_CONNLOST', 'MN_EEMPTY', 'MN_EIDINVAL', 'MN_INVAL', 'MN_INVALBUFFERAPI', 'MN_INVALMSGAPI', 'MN_ISBOUND', 'MN_ISCONNECTED', 'MN_ISRENDEZVOUS', 'MN_ISRENDUNBOUND', 'MN_ISUNBOUND', 'MN_MEMORY', 'MN_NOCONN', 'MN_NOLISTEN', 'MN_NONE', 'MN_NORES', 'MN_OBJECT', 'MN_RDAVAIL', 'MN_READFAIL', 'MN_REJECTED', 'MN_SECURITY', 'MN_SEEKGFAIL', 'MN_SEEKPFAIL', 'MN_SIDINVAL', 'MN_THREAD', 'MN_TIMEOUT', 'MN_WRAVAIL', 'MN_WRITEFAIL', 'MN_XMTIMEOUT', 'MN_XSIZE', 'SRTGROUP_MASK', 'SRTO_BINDTODEVICE', 'SRTO_CONGESTION', 'SRTO_CONNTIMEO', 'SRTO_DEPRECATED_END', 'SRTO_DRIFTTRACER', 'SRTO_ENFORCEDENCRYPTION', 'SRTO_EVENT', 'SRTO_E_SIZE', 'SRTO_FC', 'SRTO_INPUTBW', 'SRTO_IPTOS', 'SRTO_IPTTL', 'SRTO_IPV6ONLY', 'SRTO_ISN', 'SRTO_KMPREANNOUNCE', 'SRTO_KMREFRESHRATE', 'SRTO_KMSTATE', 'SRTO_LATENCY', 'SRTO_LINGER', 'SRTO_LOSSMAXTTL', 'SRTO_MAXBW', 'SRTO_MESSAGEAPI', 'SRTO_MININPUTBW', 'SRTO_MINVERSION', 'SRTO_MSS', 'SRTO_NAKREPORT', 'SRTO_OHEADBW', 'SRTO_PACKETFILTER', 'SRTO_PASSPHRASE', 'SRTO_PAYLOADSIZE', 'SRTO_PBKEYLEN', 'SRTO_PEERIDLETIMEO', 'SRTO_PEERLATENCY', 'SRTO_PEERVERSION', 'SRTO_RCVBUF', 'SRTO_RCVDATA', 'SRTO_RCVKMSTATE', 'SRTO_RCVLATENCY', 'SRTO_RCVSYN', 'SRTO_RCVTIMEO', 'SRTO_RENDEZVOUS', 'SRTO_RETRANSMITALGO', 'SRTO_REUSEADDR', 'SRTO_SENDER', 'SRTO_SNDBUF', 'SRTO_SNDDATA', 'SRTO_SNDDROPDELAY', 'SRTO_SNDKMSTATE', 'SRTO_SNDSYN', 'SRTO_SNDTIMEO', 'SRTO_STATE', 'SRTO_STREAMID', 'SRTO_TLPKTDROP', 'SRTO_TRANSTYPE', 'SRTO_TSBPDMODE', 'SRTO_UDP_RCVBUF', 'SRTO_UDP_SNDBUF', 'SRTO_VERSION', 'SRTS_BROKEN', 'SRTS_CLOSED', 'SRTS_CLOSING', 'SRTS_CONNECTED', 'SRTS_CONNECTING', 'SRTS_INIT', 'SRTS_LISTENING', 'SRTS_NONEXIST', 'SRTS_OPENED', 'SRTT_FILE', 'SRTT_INVALID', 'SRTT_LIVE', 'SRT_DEFAULT_RECVFILE_BLOCK', 'SRT_DEFAULT_SENDFILE_BLOCK', 'SRT_EASYNCFAIL', 'SRT_EASYNCRCV', 'SRT_EASYNCSND', 'SRT_EBINDCONFLICT', 'SRT_EBOUNDSOCK', 'SRT_ECONGEST', 'SRT_ECONNFAIL', 'SRT_ECONNLOST', 'SRT_ECONNREJ', 'SRT_ECONNSETUP', 'SRT_ECONNSOCK', 'SRT_EDUPLISTEN', 'SRT_EFILE', 'SRT_EINVALBUFFERAPI', 'SRT_EINVALMSGAPI', 'SRT_EINVOP', 'SRT_EINVPARAM', 'SRT_EINVPOLLID', 'SRT_EINVRDOFF', 'SRT_EINVSOCK', 'SRT_EINVWROFF', 'SRT_ELARGEMSG', 'SRT_ENOBUF', 'SRT_ENOCONN', 'SRT_ENOLISTEN', 'SRT_ENOSERVER', 'SRT_EPEERERR', 'SRT_EPOLLEMPTY', 'SRT_EPOLL_ACCEPT', 'SRT_EPOLL_CONNECT', 'SRT_EPOLL_ENABLE_EMPTY', 'SRT_EPOLL_ENABLE_OUTPUTCHECK', 'SRT_EPOLL_ERR', 'SRT_EPOLL_ET', 'SRT_EPOLL_EVENT', 'SRT_EPOLL_IN', 'SRT_EPOLL_OPT_NONE', 'SRT_EPOLL_OUT', 'SRT_EPOLL_UPDATE', 'SRT_ERDPERM', 'SRT_ERDVNOSERV', 'SRT_ERDVUNBOUND', 'SRT_ERESOURCE', 'SRT_ERROR', 'SRT_ESCLOSED', 'SRT_ESECFAIL', 'SRT_ESOCKFAIL', 'SRT_ESYSOBJ', 'SRT_ETHREAD', 'SRT_ETIMEOUT', 'SRT_EUNBOUNDSOCK', 'SRT_EUNKNOWN', 'SRT_EWRPERM', 'SRT_HAVE_CXX17', 'SRT_INVALID_SOCK', 'SRT_KM_S_BADSECRET', 'SRT_KM_S_NOSECRET', 'SRT_KM_S_SECURED', 'SRT_KM_S_SECURING', 'SRT_KM_S_UNSECURED', 'SRT_LIVE_DEF_LATENCY_MS', 'SRT_LIVE_DEF_PLSIZE', 'SRT_LIVE_MAX_PLSIZE', 'SRT_LOGFA_API_CTRL', 'SRT_LOGFA_API_RECV', 'SRT_LOGFA_API_SEND', 'SRT_LOGFA_APPLOG', 'SRT_LOGFA_BUF_RECV', 'SRT_LOGFA_BUF_SEND', 'SRT_LOGFA_CHN_MGMT', 'SRT_LOGFA_CHN_RECV', 'SRT_LOGFA_CHN_SEND', 'SRT_LOGFA_CONGEST', 'SRT_LOGFA_CONN', 'SRT_LOGFA_EPOLL_API', 'SRT_LOGFA_EPOLL_UPD', 'SRT_LOGFA_GENERAL', 'SRT_LOGFA_GRP_MGMT', 'SRT_LOGFA_GRP_RECV', 'SRT_LOGFA_GRP_SEND', 'SRT_LOGFA_HAICRYPT', 'SRT_LOGFA_INTERNAL', 'SRT_LOGFA_LASTNONE', 'SRT_LOGFA_PFILTER', 'SRT_LOGFA_QUE_CTRL', 'SRT_LOGFA_QUE_MGMT', 'SRT_LOGFA_QUE_RECV', 'SRT_LOGFA_QUE_SEND', 'SRT_LOGFA_RSRC', 'SRT_LOGFA_SOCKMGMT', 'SRT_LOGFA_TSBPD', 'SRT_LOGFA_XTIMER', 'SRT_MSGCTRL', 'SRT_MSGNO_CONTROL', 'SRT_MSGNO_NONE', 'SRT_MSGTTL_INF', 'SRT_REJC_INTERNAL', 'SRT_REJC_PREDEFINED', 'SRT_REJC_USERDEFINED', 'SRT_REJ_BACKLOG', 'SRT_REJ_BADSECRET', 'SRT_REJ_CLOSE', 'SRT_REJ_CONGESTION', 'SRT_REJ_E_SIZE', 'SRT_REJ_FILTER', 'SRT_REJ_GROUP', 'SRT_REJ_IPE', 'SRT_REJ_MESSAGEAPI', 'SRT_REJ_PEER', 'SRT_REJ_RDVCOOKIE', 'SRT_REJ_RESOURCE', 'SRT_REJ_ROGUE', 'SRT_REJ_SYSTEM', 'SRT_REJ_TIMEOUT', 'SRT_REJ_UNKNOWN', 'SRT_REJ_UNSECURE', 'SRT_REJ_VERSION', 'SRT_SEQNO_NONE', 'SRT_SUCCESS', 'SRT_SYNC_CLOCK_AMD64_RDTSC', 'SRT_SYNC_CLOCK_GETTIME_MONOTONIC', 'SRT_SYNC_CLOCK_IA32_RDTSC', 'SRT_SYNC_CLOCK_IA64_ITC', 'SRT_SYNC_CLOCK_MACH_ABSTIME', 'SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY', 'SRT_SYNC_CLOCK_STDCXX_STEADY', 'SRT_SYNC_CLOCK_WINQPC', 'SRT_VERSION_FEAT_HSv5', 'cvar', 'srt_accept', 'srt_accept_bond', 'srt_addlogfa', 'srt_bind', 'srt_bind_acquire', 'srt_bind_peerof', 'srt_bistats', 'srt_bstats', 'srt_cleanup', 'srt_clearlasterror', 'srt_clock_type', 'srt_close', 'srt_connect', 'srt_connect_bind', 'srt_connect_callback', 'srt_connect_debug', 'srt_connection_time', 'srt_create_socket', 'srt_dellogfa', 'srt_epoll_add_ssock', 'srt_epoll_add_usock', 'srt_epoll_clear_usocks', 'srt_epoll_create', 'srt_epoll_release', 'srt_epoll_remove_ssock', 'srt_epoll_remove_usock', 'srt_epoll_set', 'srt_epoll_update_ssock', 'srt_epoll_update_usock', 'srt_epoll_uwait', 'srt_epoll_wait', 'srt_getlasterror', 'srt_getlasterror_str', 'srt_getpeername', 'srt_getrejectreason', 'srt_getsndbuffer', 'srt_getsockflag', 'srt_getsockname', 'srt_getsockopt', 'srt_getsockstate', 'srt_getversion', 'srt_listen', 'srt_listen_callback', 'srt_msgctrl_default', 'srt_msgctrl_init', 'srt_recv', 'srt_recvfile', 'srt_recvmsg', 'srt_recvmsg2', 'srt_rejectreason_msg', 'srt_rejectreason_str', 'srt_rendezvous', 'srt_resetlogfa', 'srt_send', 'srt_sendfile', 'srt_sendmsg', 'srt_sendmsg2', 'srt_setlogflags', 'srt_setloghandler', 'srt_setloglevel', 'srt_setrejectreason', 'srt_setsockflag', 'srt_setsockopt', 'srt_socket', 'srt_startup', 'srt_strerror', 'srt_time_now']
 
-----------------------------------------------------------
 
3. Class source code :
 
# This file was automatically generated by SWIG (http://www.swig.org).
# Version 4.0.1
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

from sys import version_info as _swig_python_version_info
if _swig_python_version_info < (2, 7, 0):
    raise RuntimeError("Python 2.7 or later required")

# Import the low-level C/C++ module
if __package__ or "." in __name__:
    from . import _srt
else:
    import _srt

try:
    import builtins as __builtin__
except ImportError:
    import __builtin__

def _swig_repr(self):
    try:
        strthis = "proxy of " + self.this.__repr__()
    except __builtin__.Exception:
        strthis = ""
    return "<%s.%s; %s >" % (self.__class__.__module__, self.__class__.__name__, strthis,)


def _swig_setattr_nondynamic_instance_variable(set):
    def set_instance_attr(self, name, value):
        if name == "thisown":
            self.this.own(value)
        elif name == "this":
            set(self, name, value)
        elif hasattr(self, name) and isinstance(getattr(type(self), name), property):
            set(self, name, value)
        else:
            raise AttributeError("You cannot add instance attributes to %s" % self)
    return set_instance_attr


def _swig_setattr_nondynamic_class_variable(set):
    def set_class_attr(cls, name, value):
        if hasattr(cls, name) and not isinstance(getattr(cls, name), property):
            set(cls, name, value)
        else:
            raise AttributeError("You cannot add class attributes to %s" % cls)
    return set_class_attr


def _swig_add_metaclass(metaclass):
    """Class decorator for adding a metaclass to a SWIG wrapped class - a slimmed down version of six.add_metaclass"""
    def wrapper(cls):
        return metaclass(cls.__name__, cls.__bases__, cls.__dict__.copy())
    return wrapper


class _SwigNonDynamicMeta(type):
    """Meta class to enforce nondynamic attributes (no new attributes) for a class"""
    __setattr__ = _swig_setattr_nondynamic_class_variable(type.__setattr__)


SRT_VERSION_FEAT_HSv5 = _srt.SRT_VERSION_FEAT_HSv5
SRT_HAVE_CXX17 = _srt.SRT_HAVE_CXX17
ENABLE_EXPERIMENTAL_BONDING = _srt.ENABLE_EXPERIMENTAL_BONDING
SRTS_INIT = _srt.SRTS_INIT
SRTS_OPENED = _srt.SRTS_OPENED
SRTS_LISTENING = _srt.SRTS_LISTENING
SRTS_CONNECTING = _srt.SRTS_CONNECTING
SRTS_CONNECTED = _srt.SRTS_CONNECTED
SRTS_BROKEN = _srt.SRTS_BROKEN
SRTS_CLOSING = _srt.SRTS_CLOSING
SRTS_CLOSED = _srt.SRTS_CLOSED
SRTS_NONEXIST = _srt.SRTS_NONEXIST
SRTO_MSS = _srt.SRTO_MSS
SRTO_SNDSYN = _srt.SRTO_SNDSYN
SRTO_RCVSYN = _srt.SRTO_RCVSYN
SRTO_ISN = _srt.SRTO_ISN
SRTO_FC = _srt.SRTO_FC
SRTO_SNDBUF = _srt.SRTO_SNDBUF
SRTO_RCVBUF = _srt.SRTO_RCVBUF
SRTO_LINGER = _srt.SRTO_LINGER
SRTO_UDP_SNDBUF = _srt.SRTO_UDP_SNDBUF
SRTO_UDP_RCVBUF = _srt.SRTO_UDP_RCVBUF
SRTO_RENDEZVOUS = _srt.SRTO_RENDEZVOUS
SRTO_SNDTIMEO = _srt.SRTO_SNDTIMEO
SRTO_RCVTIMEO = _srt.SRTO_RCVTIMEO
SRTO_REUSEADDR = _srt.SRTO_REUSEADDR
SRTO_MAXBW = _srt.SRTO_MAXBW
SRTO_STATE = _srt.SRTO_STATE
SRTO_EVENT = _srt.SRTO_EVENT
SRTO_SNDDATA = _srt.SRTO_SNDDATA
SRTO_RCVDATA = _srt.SRTO_RCVDATA
SRTO_SENDER = _srt.SRTO_SENDER
SRTO_TSBPDMODE = _srt.SRTO_TSBPDMODE
SRTO_LATENCY = _srt.SRTO_LATENCY
SRTO_INPUTBW = _srt.SRTO_INPUTBW
SRTO_OHEADBW = _srt.SRTO_OHEADBW
SRTO_PASSPHRASE = _srt.SRTO_PASSPHRASE
SRTO_PBKEYLEN = _srt.SRTO_PBKEYLEN
SRTO_KMSTATE = _srt.SRTO_KMSTATE
SRTO_IPTTL = _srt.SRTO_IPTTL
SRTO_IPTOS = _srt.SRTO_IPTOS
SRTO_TLPKTDROP = _srt.SRTO_TLPKTDROP
SRTO_SNDDROPDELAY = _srt.SRTO_SNDDROPDELAY
SRTO_NAKREPORT = _srt.SRTO_NAKREPORT
SRTO_VERSION = _srt.SRTO_VERSION
SRTO_PEERVERSION = _srt.SRTO_PEERVERSION
SRTO_CONNTIMEO = _srt.SRTO_CONNTIMEO
SRTO_DRIFTTRACER = _srt.SRTO_DRIFTTRACER
SRTO_MININPUTBW = _srt.SRTO_MININPUTBW
SRTO_SNDKMSTATE = _srt.SRTO_SNDKMSTATE
SRTO_RCVKMSTATE = _srt.SRTO_RCVKMSTATE
SRTO_LOSSMAXTTL = _srt.SRTO_LOSSMAXTTL
SRTO_RCVLATENCY = _srt.SRTO_RCVLATENCY
SRTO_PEERLATENCY = _srt.SRTO_PEERLATENCY
SRTO_MINVERSION = _srt.SRTO_MINVERSION
SRTO_STREAMID = _srt.SRTO_STREAMID
SRTO_CONGESTION = _srt.SRTO_CONGESTION
SRTO_MESSAGEAPI = _srt.SRTO_MESSAGEAPI
SRTO_PAYLOADSIZE = _srt.SRTO_PAYLOADSIZE
SRTO_TRANSTYPE = _srt.SRTO_TRANSTYPE
SRTO_KMREFRESHRATE = _srt.SRTO_KMREFRESHRATE
SRTO_KMPREANNOUNCE = _srt.SRTO_KMPREANNOUNCE
SRTO_ENFORCEDENCRYPTION = _srt.SRTO_ENFORCEDENCRYPTION
SRTO_IPV6ONLY = _srt.SRTO_IPV6ONLY
SRTO_PEERIDLETIMEO = _srt.SRTO_PEERIDLETIMEO
SRTO_BINDTODEVICE = _srt.SRTO_BINDTODEVICE
SRTO_PACKETFILTER = _srt.SRTO_PACKETFILTER
SRTO_RETRANSMITALGO = _srt.SRTO_RETRANSMITALGO
SRTO_E_SIZE = _srt.SRTO_E_SIZE
SRTO_DEPRECATED_END = _srt.SRTO_DEPRECATED_END
SRTT_LIVE = _srt.SRTT_LIVE
SRTT_FILE = _srt.SRTT_FILE
SRTT_INVALID = _srt.SRTT_INVALID
class CBytePerfMon(object):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr
    msTimeStamp = property(_srt.CBytePerfMon_msTimeStamp_get, _srt.CBytePerfMon_msTimeStamp_set)
    pktSentTotal = property(_srt.CBytePerfMon_pktSentTotal_get, _srt.CBytePerfMon_pktSentTotal_set)
    pktRecvTotal = property(_srt.CBytePerfMon_pktRecvTotal_get, _srt.CBytePerfMon_pktRecvTotal_set)
    pktSndLossTotal = property(_srt.CBytePerfMon_pktSndLossTotal_get, _srt.CBytePerfMon_pktSndLossTotal_set)
    pktRcvLossTotal = property(_srt.CBytePerfMon_pktRcvLossTotal_get, _srt.CBytePerfMon_pktRcvLossTotal_set)
    pktRetransTotal = property(_srt.CBytePerfMon_pktRetransTotal_get, _srt.CBytePerfMon_pktRetransTotal_set)
    pktSentACKTotal = property(_srt.CBytePerfMon_pktSentACKTotal_get, _srt.CBytePerfMon_pktSentACKTotal_set)
    pktRecvACKTotal = property(_srt.CBytePerfMon_pktRecvACKTotal_get, _srt.CBytePerfMon_pktRecvACKTotal_set)
    pktSentNAKTotal = property(_srt.CBytePerfMon_pktSentNAKTotal_get, _srt.CBytePerfMon_pktSentNAKTotal_set)
    pktRecvNAKTotal = property(_srt.CBytePerfMon_pktRecvNAKTotal_get, _srt.CBytePerfMon_pktRecvNAKTotal_set)
    usSndDurationTotal = property(_srt.CBytePerfMon_usSndDurationTotal_get, _srt.CBytePerfMon_usSndDurationTotal_set)
    pktSndDropTotal = property(_srt.CBytePerfMon_pktSndDropTotal_get, _srt.CBytePerfMon_pktSndDropTotal_set)
    pktRcvDropTotal = property(_srt.CBytePerfMon_pktRcvDropTotal_get, _srt.CBytePerfMon_pktRcvDropTotal_set)
    pktRcvUndecryptTotal = property(_srt.CBytePerfMon_pktRcvUndecryptTotal_get, _srt.CBytePerfMon_pktRcvUndecryptTotal_set)
    byteSentTotal = property(_srt.CBytePerfMon_byteSentTotal_get, _srt.CBytePerfMon_byteSentTotal_set)
    byteRecvTotal = property(_srt.CBytePerfMon_byteRecvTotal_get, _srt.CBytePerfMon_byteRecvTotal_set)
    byteRcvLossTotal = property(_srt.CBytePerfMon_byteRcvLossTotal_get, _srt.CBytePerfMon_byteRcvLossTotal_set)
    byteRetransTotal = property(_srt.CBytePerfMon_byteRetransTotal_get, _srt.CBytePerfMon_byteRetransTotal_set)
    byteSndDropTotal = property(_srt.CBytePerfMon_byteSndDropTotal_get, _srt.CBytePerfMon_byteSndDropTotal_set)
    byteRcvDropTotal = property(_srt.CBytePerfMon_byteRcvDropTotal_get, _srt.CBytePerfMon_byteRcvDropTotal_set)
    byteRcvUndecryptTotal = property(_srt.CBytePerfMon_byteRcvUndecryptTotal_get, _srt.CBytePerfMon_byteRcvUndecryptTotal_set)
    pktSent = property(_srt.CBytePerfMon_pktSent_get, _srt.CBytePerfMon_pktSent_set)
    pktRecv = property(_srt.CBytePerfMon_pktRecv_get, _srt.CBytePerfMon_pktRecv_set)
    pktSndLoss = property(_srt.CBytePerfMon_pktSndLoss_get, _srt.CBytePerfMon_pktSndLoss_set)
    pktRcvLoss = property(_srt.CBytePerfMon_pktRcvLoss_get, _srt.CBytePerfMon_pktRcvLoss_set)
    pktRetrans = property(_srt.CBytePerfMon_pktRetrans_get, _srt.CBytePerfMon_pktRetrans_set)
    pktRcvRetrans = property(_srt.CBytePerfMon_pktRcvRetrans_get, _srt.CBytePerfMon_pktRcvRetrans_set)
    pktSentACK = property(_srt.CBytePerfMon_pktSentACK_get, _srt.CBytePerfMon_pktSentACK_set)
    pktRecvACK = property(_srt.CBytePerfMon_pktRecvACK_get, _srt.CBytePerfMon_pktRecvACK_set)
    pktSentNAK = property(_srt.CBytePerfMon_pktSentNAK_get, _srt.CBytePerfMon_pktSentNAK_set)
    pktRecvNAK = property(_srt.CBytePerfMon_pktRecvNAK_get, _srt.CBytePerfMon_pktRecvNAK_set)
    mbpsSendRate = property(_srt.CBytePerfMon_mbpsSendRate_get, _srt.CBytePerfMon_mbpsSendRate_set)
    mbpsRecvRate = property(_srt.CBytePerfMon_mbpsRecvRate_get, _srt.CBytePerfMon_mbpsRecvRate_set)
    usSndDuration = property(_srt.CBytePerfMon_usSndDuration_get, _srt.CBytePerfMon_usSndDuration_set)
    pktReorderDistance = property(_srt.CBytePerfMon_pktReorderDistance_get, _srt.CBytePerfMon_pktReorderDistance_set)
    pktRcvAvgBelatedTime = property(_srt.CBytePerfMon_pktRcvAvgBelatedTime_get, _srt.CBytePerfMon_pktRcvAvgBelatedTime_set)
    pktRcvBelated = property(_srt.CBytePerfMon_pktRcvBelated_get, _srt.CBytePerfMon_pktRcvBelated_set)
    pktSndDrop = property(_srt.CBytePerfMon_pktSndDrop_get, _srt.CBytePerfMon_pktSndDrop_set)
    pktRcvDrop = property(_srt.CBytePerfMon_pktRcvDrop_get, _srt.CBytePerfMon_pktRcvDrop_set)
    pktRcvUndecrypt = property(_srt.CBytePerfMon_pktRcvUndecrypt_get, _srt.CBytePerfMon_pktRcvUndecrypt_set)
    byteSent = property(_srt.CBytePerfMon_byteSent_get, _srt.CBytePerfMon_byteSent_set)
    byteRecv = property(_srt.CBytePerfMon_byteRecv_get, _srt.CBytePerfMon_byteRecv_set)
    byteRcvLoss = property(_srt.CBytePerfMon_byteRcvLoss_get, _srt.CBytePerfMon_byteRcvLoss_set)
    byteRetrans = property(_srt.CBytePerfMon_byteRetrans_get, _srt.CBytePerfMon_byteRetrans_set)
    byteSndDrop = property(_srt.CBytePerfMon_byteSndDrop_get, _srt.CBytePerfMon_byteSndDrop_set)
    byteRcvDrop = property(_srt.CBytePerfMon_byteRcvDrop_get, _srt.CBytePerfMon_byteRcvDrop_set)
    byteRcvUndecrypt = property(_srt.CBytePerfMon_byteRcvUndecrypt_get, _srt.CBytePerfMon_byteRcvUndecrypt_set)
    usPktSndPeriod = property(_srt.CBytePerfMon_usPktSndPeriod_get, _srt.CBytePerfMon_usPktSndPeriod_set)
    pktFlowWindow = property(_srt.CBytePerfMon_pktFlowWindow_get, _srt.CBytePerfMon_pktFlowWindow_set)
    pktCongestionWindow = property(_srt.CBytePerfMon_pktCongestionWindow_get, _srt.CBytePerfMon_pktCongestionWindow_set)
    pktFlightSize = property(_srt.CBytePerfMon_pktFlightSize_get, _srt.CBytePerfMon_pktFlightSize_set)
    msRTT = property(_srt.CBytePerfMon_msRTT_get, _srt.CBytePerfMon_msRTT_set)
    mbpsBandwidth = property(_srt.CBytePerfMon_mbpsBandwidth_get, _srt.CBytePerfMon_mbpsBandwidth_set)
    byteAvailSndBuf = property(_srt.CBytePerfMon_byteAvailSndBuf_get, _srt.CBytePerfMon_byteAvailSndBuf_set)
    byteAvailRcvBuf = property(_srt.CBytePerfMon_byteAvailRcvBuf_get, _srt.CBytePerfMon_byteAvailRcvBuf_set)
    mbpsMaxBW = property(_srt.CBytePerfMon_mbpsMaxBW_get, _srt.CBytePerfMon_mbpsMaxBW_set)
    byteMSS = property(_srt.CBytePerfMon_byteMSS_get, _srt.CBytePerfMon_byteMSS_set)
    pktSndBuf = property(_srt.CBytePerfMon_pktSndBuf_get, _srt.CBytePerfMon_pktSndBuf_set)
    byteSndBuf = property(_srt.CBytePerfMon_byteSndBuf_get, _srt.CBytePerfMon_byteSndBuf_set)
    msSndBuf = property(_srt.CBytePerfMon_msSndBuf_get, _srt.CBytePerfMon_msSndBuf_set)
    msSndTsbPdDelay = property(_srt.CBytePerfMon_msSndTsbPdDelay_get, _srt.CBytePerfMon_msSndTsbPdDelay_set)
    pktRcvBuf = property(_srt.CBytePerfMon_pktRcvBuf_get, _srt.CBytePerfMon_pktRcvBuf_set)
    byteRcvBuf = property(_srt.CBytePerfMon_byteRcvBuf_get, _srt.CBytePerfMon_byteRcvBuf_set)
    msRcvBuf = property(_srt.CBytePerfMon_msRcvBuf_get, _srt.CBytePerfMon_msRcvBuf_set)
    msRcvTsbPdDelay = property(_srt.CBytePerfMon_msRcvTsbPdDelay_get, _srt.CBytePerfMon_msRcvTsbPdDelay_set)
    pktSndFilterExtraTotal = property(_srt.CBytePerfMon_pktSndFilterExtraTotal_get, _srt.CBytePerfMon_pktSndFilterExtraTotal_set)
    pktRcvFilterExtraTotal = property(_srt.CBytePerfMon_pktRcvFilterExtraTotal_get, _srt.CBytePerfMon_pktRcvFilterExtraTotal_set)
    pktRcvFilterSupplyTotal = property(_srt.CBytePerfMon_pktRcvFilterSupplyTotal_get, _srt.CBytePerfMon_pktRcvFilterSupplyTotal_set)
    pktRcvFilterLossTotal = property(_srt.CBytePerfMon_pktRcvFilterLossTotal_get, _srt.CBytePerfMon_pktRcvFilterLossTotal_set)
    pktSndFilterExtra = property(_srt.CBytePerfMon_pktSndFilterExtra_get, _srt.CBytePerfMon_pktSndFilterExtra_set)
    pktRcvFilterExtra = property(_srt.CBytePerfMon_pktRcvFilterExtra_get, _srt.CBytePerfMon_pktRcvFilterExtra_set)
    pktRcvFilterSupply = property(_srt.CBytePerfMon_pktRcvFilterSupply_get, _srt.CBytePerfMon_pktRcvFilterSupply_set)
    pktRcvFilterLoss = property(_srt.CBytePerfMon_pktRcvFilterLoss_get, _srt.CBytePerfMon_pktRcvFilterLoss_set)
    pktReorderTolerance = property(_srt.CBytePerfMon_pktReorderTolerance_get, _srt.CBytePerfMon_pktReorderTolerance_set)
    pktSentUniqueTotal = property(_srt.CBytePerfMon_pktSentUniqueTotal_get, _srt.CBytePerfMon_pktSentUniqueTotal_set)
    pktRecvUniqueTotal = property(_srt.CBytePerfMon_pktRecvUniqueTotal_get, _srt.CBytePerfMon_pktRecvUniqueTotal_set)
    byteSentUniqueTotal = property(_srt.CBytePerfMon_byteSentUniqueTotal_get, _srt.CBytePerfMon_byteSentUniqueTotal_set)
    byteRecvUniqueTotal = property(_srt.CBytePerfMon_byteRecvUniqueTotal_get, _srt.CBytePerfMon_byteRecvUniqueTotal_set)
    pktSentUnique = property(_srt.CBytePerfMon_pktSentUnique_get, _srt.CBytePerfMon_pktSentUnique_set)
    pktRecvUnique = property(_srt.CBytePerfMon_pktRecvUnique_get, _srt.CBytePerfMon_pktRecvUnique_set)
    byteSentUnique = property(_srt.CBytePerfMon_byteSentUnique_get, _srt.CBytePerfMon_byteSentUnique_set)
    byteRecvUnique = property(_srt.CBytePerfMon_byteRecvUnique_get, _srt.CBytePerfMon_byteRecvUnique_set)

    def __init__(self):
        _srt.CBytePerfMon_swiginit(self, _srt.new_CBytePerfMon())
    __swig_destroy__ = _srt.delete_CBytePerfMon

# Register CBytePerfMon in _srt:
_srt.CBytePerfMon_swigregister(CBytePerfMon)
cvar = _srt.cvar
SRTGROUP_MASK = cvar.SRTGROUP_MASK
SRT_LIVE_DEF_PLSIZE = cvar.SRT_LIVE_DEF_PLSIZE
SRT_LIVE_MAX_PLSIZE = cvar.SRT_LIVE_MAX_PLSIZE
SRT_LIVE_DEF_LATENCY_MS = cvar.SRT_LIVE_DEF_LATENCY_MS

MJ_UNKNOWN = _srt.MJ_UNKNOWN
MJ_SUCCESS = _srt.MJ_SUCCESS
MJ_SETUP = _srt.MJ_SETUP
MJ_CONNECTION = _srt.MJ_CONNECTION
MJ_SYSTEMRES = _srt.MJ_SYSTEMRES
MJ_FILESYSTEM = _srt.MJ_FILESYSTEM
MJ_NOTSUP = _srt.MJ_NOTSUP
MJ_AGAIN = _srt.MJ_AGAIN
MJ_PEERERROR = _srt.MJ_PEERERROR
MN_NONE = _srt.MN_NONE
MN_TIMEOUT = _srt.MN_TIMEOUT
MN_REJECTED = _srt.MN_REJECTED
MN_NORES = _srt.MN_NORES
MN_SECURITY = _srt.MN_SECURITY
MN_CLOSED = _srt.MN_CLOSED
MN_CONNLOST = _srt.MN_CONNLOST
MN_NOCONN = _srt.MN_NOCONN
MN_THREAD = _srt.MN_THREAD
MN_MEMORY = _srt.MN_MEMORY
MN_OBJECT = _srt.MN_OBJECT
MN_SEEKGFAIL = _srt.MN_SEEKGFAIL
MN_READFAIL = _srt.MN_READFAIL
MN_SEEKPFAIL = _srt.MN_SEEKPFAIL
MN_WRITEFAIL = _srt.MN_WRITEFAIL
MN_ISBOUND = _srt.MN_ISBOUND
MN_ISCONNECTED = _srt.MN_ISCONNECTED
MN_INVAL = _srt.MN_INVAL
MN_SIDINVAL = _srt.MN_SIDINVAL
MN_ISUNBOUND = _srt.MN_ISUNBOUND
MN_NOLISTEN = _srt.MN_NOLISTEN
MN_ISRENDEZVOUS = _srt.MN_ISRENDEZVOUS
MN_ISRENDUNBOUND = _srt.MN_ISRENDUNBOUND
MN_INVALMSGAPI = _srt.MN_INVALMSGAPI
MN_INVALBUFFERAPI = _srt.MN_INVALBUFFERAPI
MN_BUSY = _srt.MN_BUSY
MN_XSIZE = _srt.MN_XSIZE
MN_EIDINVAL = _srt.MN_EIDINVAL
MN_EEMPTY = _srt.MN_EEMPTY
MN_BUSYPORT = _srt.MN_BUSYPORT
MN_WRAVAIL = _srt.MN_WRAVAIL
MN_RDAVAIL = _srt.MN_RDAVAIL
MN_XMTIMEOUT = _srt.MN_XMTIMEOUT
MN_CONGESTION = _srt.MN_CONGESTION
SRT_EUNKNOWN = _srt.SRT_EUNKNOWN
SRT_SUCCESS = _srt.SRT_SUCCESS
SRT_ECONNSETUP = _srt.SRT_ECONNSETUP
SRT_ENOSERVER = _srt.SRT_ENOSERVER
SRT_ECONNREJ = _srt.SRT_ECONNREJ
SRT_ESOCKFAIL = _srt.SRT_ESOCKFAIL
SRT_ESECFAIL = _srt.SRT_ESECFAIL
SRT_ESCLOSED = _srt.SRT_ESCLOSED
SRT_ECONNFAIL = _srt.SRT_ECONNFAIL
SRT_ECONNLOST = _srt.SRT_ECONNLOST
SRT_ENOCONN = _srt.SRT_ENOCONN
SRT_ERESOURCE = _srt.SRT_ERESOURCE
SRT_ETHREAD = _srt.SRT_ETHREAD
SRT_ENOBUF = _srt.SRT_ENOBUF
SRT_ESYSOBJ = _srt.SRT_ESYSOBJ
SRT_EFILE = _srt.SRT_EFILE
SRT_EINVRDOFF = _srt.SRT_EINVRDOFF
SRT_ERDPERM = _srt.SRT_ERDPERM
SRT_EINVWROFF = _srt.SRT_EINVWROFF
SRT_EWRPERM = _srt.SRT_EWRPERM
SRT_EINVOP = _srt.SRT_EINVOP
SRT_EBOUNDSOCK = _srt.SRT_EBOUNDSOCK
SRT_ECONNSOCK = _srt.SRT_ECONNSOCK
SRT_EINVPARAM = _srt.SRT_EINVPARAM
SRT_EINVSOCK = _srt.SRT_EINVSOCK
SRT_EUNBOUNDSOCK = _srt.SRT_EUNBOUNDSOCK
SRT_ENOLISTEN = _srt.SRT_ENOLISTEN
SRT_ERDVNOSERV = _srt.SRT_ERDVNOSERV
SRT_ERDVUNBOUND = _srt.SRT_ERDVUNBOUND
SRT_EINVALMSGAPI = _srt.SRT_EINVALMSGAPI
SRT_EINVALBUFFERAPI = _srt.SRT_EINVALBUFFERAPI
SRT_EDUPLISTEN = _srt.SRT_EDUPLISTEN
SRT_ELARGEMSG = _srt.SRT_ELARGEMSG
SRT_EINVPOLLID = _srt.SRT_EINVPOLLID
SRT_EPOLLEMPTY = _srt.SRT_EPOLLEMPTY
SRT_EBINDCONFLICT = _srt.SRT_EBINDCONFLICT
SRT_EASYNCFAIL = _srt.SRT_EASYNCFAIL
SRT_EASYNCSND = _srt.SRT_EASYNCSND
SRT_EASYNCRCV = _srt.SRT_EASYNCRCV
SRT_ETIMEOUT = _srt.SRT_ETIMEOUT
SRT_ECONGEST = _srt.SRT_ECONGEST
SRT_EPEERERR = _srt.SRT_EPEERERR
SRT_REJ_UNKNOWN = _srt.SRT_REJ_UNKNOWN
SRT_REJ_SYSTEM = _srt.SRT_REJ_SYSTEM
SRT_REJ_PEER = _srt.SRT_REJ_PEER
SRT_REJ_RESOURCE = _srt.SRT_REJ_RESOURCE
SRT_REJ_ROGUE = _srt.SRT_REJ_ROGUE
SRT_REJ_BACKLOG = _srt.SRT_REJ_BACKLOG
SRT_REJ_IPE = _srt.SRT_REJ_IPE
SRT_REJ_CLOSE = _srt.SRT_REJ_CLOSE
SRT_REJ_VERSION = _srt.SRT_REJ_VERSION
SRT_REJ_RDVCOOKIE = _srt.SRT_REJ_RDVCOOKIE
SRT_REJ_BADSECRET = _srt.SRT_REJ_BADSECRET
SRT_REJ_UNSECURE = _srt.SRT_REJ_UNSECURE
SRT_REJ_MESSAGEAPI = _srt.SRT_REJ_MESSAGEAPI
SRT_REJ_CONGESTION = _srt.SRT_REJ_CONGESTION
SRT_REJ_FILTER = _srt.SRT_REJ_FILTER
SRT_REJ_GROUP = _srt.SRT_REJ_GROUP
SRT_REJ_TIMEOUT = _srt.SRT_REJ_TIMEOUT
SRT_REJ_E_SIZE = _srt.SRT_REJ_E_SIZE
SRT_REJC_INTERNAL = _srt.SRT_REJC_INTERNAL
SRT_REJC_PREDEFINED = _srt.SRT_REJC_PREDEFINED
SRT_REJC_USERDEFINED = _srt.SRT_REJC_USERDEFINED
SRT_LOGFA_GENERAL = _srt.SRT_LOGFA_GENERAL
SRT_LOGFA_SOCKMGMT = _srt.SRT_LOGFA_SOCKMGMT
SRT_LOGFA_CONN = _srt.SRT_LOGFA_CONN
SRT_LOGFA_XTIMER = _srt.SRT_LOGFA_XTIMER
SRT_LOGFA_TSBPD = _srt.SRT_LOGFA_TSBPD
SRT_LOGFA_RSRC = _srt.SRT_LOGFA_RSRC
SRT_LOGFA_CONGEST = _srt.SRT_LOGFA_CONGEST
SRT_LOGFA_PFILTER = _srt.SRT_LOGFA_PFILTER
SRT_LOGFA_API_CTRL = _srt.SRT_LOGFA_API_CTRL
SRT_LOGFA_QUE_CTRL = _srt.SRT_LOGFA_QUE_CTRL
SRT_LOGFA_EPOLL_UPD = _srt.SRT_LOGFA_EPOLL_UPD
SRT_LOGFA_API_RECV = _srt.SRT_LOGFA_API_RECV
SRT_LOGFA_BUF_RECV = _srt.SRT_LOGFA_BUF_RECV
SRT_LOGFA_QUE_RECV = _srt.SRT_LOGFA_QUE_RECV
SRT_LOGFA_CHN_RECV = _srt.SRT_LOGFA_CHN_RECV
SRT_LOGFA_GRP_RECV = _srt.SRT_LOGFA_GRP_RECV
SRT_LOGFA_API_SEND = _srt.SRT_LOGFA_API_SEND
SRT_LOGFA_BUF_SEND = _srt.SRT_LOGFA_BUF_SEND
SRT_LOGFA_QUE_SEND = _srt.SRT_LOGFA_QUE_SEND
SRT_LOGFA_CHN_SEND = _srt.SRT_LOGFA_CHN_SEND
SRT_LOGFA_GRP_SEND = _srt.SRT_LOGFA_GRP_SEND
SRT_LOGFA_INTERNAL = _srt.SRT_LOGFA_INTERNAL
SRT_LOGFA_QUE_MGMT = _srt.SRT_LOGFA_QUE_MGMT
SRT_LOGFA_CHN_MGMT = _srt.SRT_LOGFA_CHN_MGMT
SRT_LOGFA_GRP_MGMT = _srt.SRT_LOGFA_GRP_MGMT
SRT_LOGFA_EPOLL_API = _srt.SRT_LOGFA_EPOLL_API
SRT_LOGFA_HAICRYPT = _srt.SRT_LOGFA_HAICRYPT
SRT_LOGFA_APPLOG = _srt.SRT_LOGFA_APPLOG
SRT_LOGFA_LASTNONE = _srt.SRT_LOGFA_LASTNONE
SRT_KM_S_UNSECURED = _srt.SRT_KM_S_UNSECURED
SRT_KM_S_SECURING = _srt.SRT_KM_S_SECURING
SRT_KM_S_SECURED = _srt.SRT_KM_S_SECURED
SRT_KM_S_NOSECRET = _srt.SRT_KM_S_NOSECRET
SRT_KM_S_BADSECRET = _srt.SRT_KM_S_BADSECRET
SRT_EPOLL_OPT_NONE = _srt.SRT_EPOLL_OPT_NONE
SRT_EPOLL_IN = _srt.SRT_EPOLL_IN
SRT_EPOLL_OUT = _srt.SRT_EPOLL_OUT
SRT_EPOLL_ERR = _srt.SRT_EPOLL_ERR
SRT_EPOLL_CONNECT = _srt.SRT_EPOLL_CONNECT
SRT_EPOLL_ACCEPT = _srt.SRT_EPOLL_ACCEPT
SRT_EPOLL_UPDATE = _srt.SRT_EPOLL_UPDATE
SRT_EPOLL_ET = _srt.SRT_EPOLL_ET
SRT_EPOLL_ENABLE_EMPTY = _srt.SRT_EPOLL_ENABLE_EMPTY
SRT_EPOLL_ENABLE_OUTPUTCHECK = _srt.SRT_EPOLL_ENABLE_OUTPUTCHECK

def srt_startup():
    return _srt.srt_startup()

def srt_cleanup():
    return _srt.srt_cleanup()

def srt_socket(arg1, arg2, arg3):
    return _srt.srt_socket(arg1, arg2, arg3)

def srt_create_socket():
    return _srt.srt_create_socket()

def srt_bind(u, name, namelen):
    return _srt.srt_bind(u, name, namelen)

def srt_bind_acquire(u, sys_udp_sock):
    return _srt.srt_bind_acquire(u, sys_udp_sock)

def srt_bind_peerof(u, sys_udp_sock):
    return _srt.srt_bind_peerof(u, sys_udp_sock)

def srt_listen(u, backlog):
    return _srt.srt_listen(u, backlog)

def srt_accept(u, addr, addrlen):
    return _srt.srt_accept(u, addr, addrlen)

def srt_accept_bond(listeners, lsize, msTimeOut):
    return _srt.srt_accept_bond(listeners, lsize, msTimeOut)

def srt_listen_callback(lsn, hook_fn, hook_opaque):
    return _srt.srt_listen_callback(lsn, hook_fn, hook_opaque)

def srt_connect_callback(clr, hook_fn, hook_opaque):
    return _srt.srt_connect_callback(clr, hook_fn, hook_opaque)

def srt_connect(u, name, namelen):
    return _srt.srt_connect(u, name, namelen)

def srt_connect_debug(u, name, namelen, forced_isn):
    return _srt.srt_connect_debug(u, name, namelen, forced_isn)

def srt_connect_bind(u, source, target, len):
    return _srt.srt_connect_bind(u, source, target, len)

def srt_rendezvous(u, local_name, local_namelen, remote_name, remote_namelen):
    return _srt.srt_rendezvous(u, local_name, local_namelen, remote_name, remote_namelen)

def srt_close(u):
    return _srt.srt_close(u)

def srt_getpeername(u, name, namelen):
    return _srt.srt_getpeername(u, name, namelen)

def srt_getsockname(u, name, namelen):
    return _srt.srt_getsockname(u, name, namelen)

def srt_getsockopt(u, level, optname, optval, optlen):
    return _srt.srt_getsockopt(u, level, optname, optval, optlen)

def srt_setsockopt(u, level, optname, optval, optlen):
    return _srt.srt_setsockopt(u, level, optname, optval, optlen)

def srt_getsockflag(u, opt, optval, optlen):
    return _srt.srt_getsockflag(u, opt, optval, optlen)

def srt_setsockflag(u, opt, optval, optlen):
    return _srt.srt_setsockflag(u, opt, optval, optlen)
class SRT_MSGCTRL(object):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr
    flags = property(_srt.SRT_MSGCTRL_flags_get, _srt.SRT_MSGCTRL_flags_set)
    msgttl = property(_srt.SRT_MSGCTRL_msgttl_get, _srt.SRT_MSGCTRL_msgttl_set)
    inorder = property(_srt.SRT_MSGCTRL_inorder_get, _srt.SRT_MSGCTRL_inorder_set)
    boundary = property(_srt.SRT_MSGCTRL_boundary_get, _srt.SRT_MSGCTRL_boundary_set)
    srctime = property(_srt.SRT_MSGCTRL_srctime_get, _srt.SRT_MSGCTRL_srctime_set)
    pktseq = property(_srt.SRT_MSGCTRL_pktseq_get, _srt.SRT_MSGCTRL_pktseq_set)
    msgno = property(_srt.SRT_MSGCTRL_msgno_get, _srt.SRT_MSGCTRL_msgno_set)
    grpdata = property(_srt.SRT_MSGCTRL_grpdata_get, _srt.SRT_MSGCTRL_grpdata_set)
    grpdata_size = property(_srt.SRT_MSGCTRL_grpdata_size_get, _srt.SRT_MSGCTRL_grpdata_size_set)

    def __init__(self):
        _srt.SRT_MSGCTRL_swiginit(self, _srt.new_SRT_MSGCTRL())
    __swig_destroy__ = _srt.delete_SRT_MSGCTRL

# Register SRT_MSGCTRL in _srt:
_srt.SRT_MSGCTRL_swigregister(SRT_MSGCTRL)
SRT_INVALID_SOCK = cvar.SRT_INVALID_SOCK
SRT_ERROR = cvar.SRT_ERROR


def srt_msgctrl_init(mctrl):
    return _srt.srt_msgctrl_init(mctrl)

def srt_send(u, buf, len):
    return _srt.srt_send(u, buf, len)

def srt_sendmsg(u, buf, len, ttl, inorder):
    return _srt.srt_sendmsg(u, buf, len, ttl, inorder)

def srt_sendmsg2(u, buf, len, mctrl):
    return _srt.srt_sendmsg2(u, buf, len, mctrl)

def srt_recv(u, buf, len):
    return _srt.srt_recv(u, buf, len)

def srt_recvmsg(u, buf, len):
    return _srt.srt_recvmsg(u, buf, len)

def srt_recvmsg2(u, buf, len, mctrl):
    return _srt.srt_recvmsg2(u, buf, len, mctrl)
SRT_DEFAULT_SENDFILE_BLOCK = _srt.SRT_DEFAULT_SENDFILE_BLOCK
SRT_DEFAULT_RECVFILE_BLOCK = _srt.SRT_DEFAULT_RECVFILE_BLOCK

def srt_sendfile(u, path, offset, size, block):
    return _srt.srt_sendfile(u, path, offset, size, block)

def srt_recvfile(u, path, offset, size, block):
    return _srt.srt_recvfile(u, path, offset, size, block)

def srt_getlasterror_str():
    return _srt.srt_getlasterror_str()

def srt_getlasterror(errno_loc):
    return _srt.srt_getlasterror(errno_loc)

def srt_strerror(code, errnoval):
    return _srt.srt_strerror(code, errnoval)

def srt_clearlasterror():
    return _srt.srt_clearlasterror()

def srt_bstats(u, perf, clear):
    return _srt.srt_bstats(u, perf, clear)

def srt_bistats(u, perf, clear, instantaneous):
    return _srt.srt_bistats(u, perf, clear, instantaneous)

def srt_getsockstate(u):
    return _srt.srt_getsockstate(u)

def srt_epoll_create():
    return _srt.srt_epoll_create()

def srt_epoll_clear_usocks(eid):
    return _srt.srt_epoll_clear_usocks(eid)

def srt_epoll_add_usock(eid, u, events):
    return _srt.srt_epoll_add_usock(eid, u, events)

def srt_epoll_add_ssock(eid, s, events):
    return _srt.srt_epoll_add_ssock(eid, s, events)

def srt_epoll_remove_usock(eid, u):
    return _srt.srt_epoll_remove_usock(eid, u)

def srt_epoll_remove_ssock(eid, s):
    return _srt.srt_epoll_remove_ssock(eid, s)

def srt_epoll_update_usock(eid, u, events):
    return _srt.srt_epoll_update_usock(eid, u, events)

def srt_epoll_update_ssock(eid, s, events):
    return _srt.srt_epoll_update_ssock(eid, s, events)

def srt_epoll_wait(eid, readfds, rnum, writefds, wnum, msTimeOut, lrfds, lrnum, lwfds, lwnum):
    return _srt.srt_epoll_wait(eid, readfds, rnum, writefds, wnum, msTimeOut, lrfds, lrnum, lwfds, lwnum)
class SRT_EPOLL_EVENT(object):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr
    fd = property(_srt.SRT_EPOLL_EVENT_fd_get, _srt.SRT_EPOLL_EVENT_fd_set)
    events = property(_srt.SRT_EPOLL_EVENT_events_get, _srt.SRT_EPOLL_EVENT_events_set)

    def __init__(self):
        _srt.SRT_EPOLL_EVENT_swiginit(self, _srt.new_SRT_EPOLL_EVENT())
    __swig_destroy__ = _srt.delete_SRT_EPOLL_EVENT

# Register SRT_EPOLL_EVENT in _srt:
_srt.SRT_EPOLL_EVENT_swigregister(SRT_EPOLL_EVENT)
SRT_SEQNO_NONE = cvar.SRT_SEQNO_NONE
SRT_MSGNO_NONE = cvar.SRT_MSGNO_NONE
SRT_MSGNO_CONTROL = cvar.SRT_MSGNO_CONTROL
SRT_MSGTTL_INF = cvar.SRT_MSGTTL_INF
srt_msgctrl_default = cvar.srt_msgctrl_default


def srt_epoll_uwait(eid, fdsSet, fdsSize, msTimeOut):
    return _srt.srt_epoll_uwait(eid, fdsSet, fdsSize, msTimeOut)

def srt_epoll_set(eid, flags):
    return _srt.srt_epoll_set(eid, flags)

def srt_epoll_release(eid):
    return _srt.srt_epoll_release(eid)

def srt_setloglevel(ll):
    return _srt.srt_setloglevel(ll)

def srt_addlogfa(fa):
    return _srt.srt_addlogfa(fa)

def srt_dellogfa(fa):
    return _srt.srt_dellogfa(fa)

def srt_resetlogfa(fara, fara_size):
    return _srt.srt_resetlogfa(fara, fara_size)

def srt_setloghandler(opaque, handler):
    return _srt.srt_setloghandler(opaque, handler)

def srt_setlogflags(flags):
    return _srt.srt_setlogflags(flags)

def srt_getsndbuffer(sock, blocks, bytes):
    return _srt.srt_getsndbuffer(sock, blocks, bytes)

def srt_getrejectreason(sock):
    return _srt.srt_getrejectreason(sock)

def srt_setrejectreason(sock, value):
    return _srt.srt_setrejectreason(sock, value)

def srt_rejectreason_str(id):
    return _srt.srt_rejectreason_str(id)

def srt_getversion():
    return _srt.srt_getversion()

def srt_time_now():
    return _srt.srt_time_now()

def srt_connection_time(sock):
    return _srt.srt_connection_time(sock)
SRT_SYNC_CLOCK_STDCXX_STEADY = _srt.SRT_SYNC_CLOCK_STDCXX_STEADY
SRT_SYNC_CLOCK_GETTIME_MONOTONIC = _srt.SRT_SYNC_CLOCK_GETTIME_MONOTONIC
SRT_SYNC_CLOCK_WINQPC = _srt.SRT_SYNC_CLOCK_WINQPC
SRT_SYNC_CLOCK_MACH_ABSTIME = _srt.SRT_SYNC_CLOCK_MACH_ABSTIME
SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY = _srt.SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY
SRT_SYNC_CLOCK_AMD64_RDTSC = _srt.SRT_SYNC_CLOCK_AMD64_RDTSC
SRT_SYNC_CLOCK_IA32_RDTSC = _srt.SRT_SYNC_CLOCK_IA32_RDTSC
SRT_SYNC_CLOCK_IA64_ITC = _srt.SRT_SYNC_CLOCK_IA64_ITC

def srt_clock_type():
    return _srt.srt_clock_type()

srt_rejectreason_msg = cvar.srt_rejectreason_msg


 
-----------------------------------
 
(['# This file was automatically generated by SWIG (http://www.swig.org).\n', '# Version 4.0.1\n', '#\n', '# Do not make changes to this file unless you know what you are doing--modify\n', '# the SWIG interface file instead.\n', '\n', 'from sys import version_info as _swig_python_version_info\n', 'if _swig_python_version_info < (2, 7, 0):\n', '    raise RuntimeError("Python 2.7 or later required")\n', '\n', '# Import the low-level C/C++ module\n', 'if __package__ or "." in __name__:\n', '    from . import _srt\n', 'else:\n', '    import _srt\n', '\n', 'try:\n', '    import builtins as __builtin__\n', 'except ImportError:\n', '    import __builtin__\n', '\n', 'def _swig_repr(self):\n', '    try:\n', '        strthis = "proxy of " + self.this.__repr__()\n', '    except __builtin__.Exception:\n', '        strthis = ""\n', '    return "<%s.%s; %s >" % (self.__class__.__module__, self.__class__.__name__, strthis,)\n', '\n', '\n', 'def _swig_setattr_nondynamic_instance_variable(set):\n', '    def set_instance_attr(self, name, value):\n', '        if name == "thisown":\n', '            self.this.own(value)\n', '        elif name == "this":\n', '            set(self, name, value)\n', '        elif hasattr(self, name) and isinstance(getattr(type(self), name), property):\n', '            set(self, name, value)\n', '        else:\n', '            raise AttributeError("You cannot add instance attributes to %s" % self)\n', '    return set_instance_attr\n', '\n', '\n', 'def _swig_setattr_nondynamic_class_variable(set):\n', '    def set_class_attr(cls, name, value):\n', '        if hasattr(cls, name) and not isinstance(getattr(cls, name), property):\n', '            set(cls, name, value)\n', '        else:\n', '            raise AttributeError("You cannot add class attributes to %s" % cls)\n', '    return set_class_attr\n', '\n', '\n', 'def _swig_add_metaclass(metaclass):\n', '    """Class decorator for adding a metaclass to a SWIG wrapped class - a slimmed down version of six.add_metaclass"""\n', '    def wrapper(cls):\n', '        return metaclass(cls.__name__, cls.__bases__, cls.__dict__.copy())\n', '    return wrapper\n', '\n', '\n', 'class _SwigNonDynamicMeta(type):\n', '    """Meta class to enforce nondynamic attributes (no new attributes) for a class"""\n', '    __setattr__ = _swig_setattr_nondynamic_class_variable(type.__setattr__)\n', '\n', '\n', 'SRT_VERSION_FEAT_HSv5 = _srt.SRT_VERSION_FEAT_HSv5\n', 'SRT_HAVE_CXX17 = _srt.SRT_HAVE_CXX17\n', 'ENABLE_EXPERIMENTAL_BONDING = _srt.ENABLE_EXPERIMENTAL_BONDING\n', 'SRTS_INIT = _srt.SRTS_INIT\n', 'SRTS_OPENED = _srt.SRTS_OPENED\n', 'SRTS_LISTENING = _srt.SRTS_LISTENING\n', 'SRTS_CONNECTING = _srt.SRTS_CONNECTING\n', 'SRTS_CONNECTED = _srt.SRTS_CONNECTED\n', 'SRTS_BROKEN = _srt.SRTS_BROKEN\n', 'SRTS_CLOSING = _srt.SRTS_CLOSING\n', 'SRTS_CLOSED = _srt.SRTS_CLOSED\n', 'SRTS_NONEXIST = _srt.SRTS_NONEXIST\n', 'SRTO_MSS = _srt.SRTO_MSS\n', 'SRTO_SNDSYN = _srt.SRTO_SNDSYN\n', 'SRTO_RCVSYN = _srt.SRTO_RCVSYN\n', 'SRTO_ISN = _srt.SRTO_ISN\n', 'SRTO_FC = _srt.SRTO_FC\n', 'SRTO_SNDBUF = _srt.SRTO_SNDBUF\n', 'SRTO_RCVBUF = _srt.SRTO_RCVBUF\n', 'SRTO_LINGER = _srt.SRTO_LINGER\n', 'SRTO_UDP_SNDBUF = _srt.SRTO_UDP_SNDBUF\n', 'SRTO_UDP_RCVBUF = _srt.SRTO_UDP_RCVBUF\n', 'SRTO_RENDEZVOUS = _srt.SRTO_RENDEZVOUS\n', 'SRTO_SNDTIMEO = _srt.SRTO_SNDTIMEO\n', 'SRTO_RCVTIMEO = _srt.SRTO_RCVTIMEO\n', 'SRTO_REUSEADDR = _srt.SRTO_REUSEADDR\n', 'SRTO_MAXBW = _srt.SRTO_MAXBW\n', 'SRTO_STATE = _srt.SRTO_STATE\n', 'SRTO_EVENT = _srt.SRTO_EVENT\n', 'SRTO_SNDDATA = _srt.SRTO_SNDDATA\n', 'SRTO_RCVDATA = _srt.SRTO_RCVDATA\n', 'SRTO_SENDER = _srt.SRTO_SENDER\n', 'SRTO_TSBPDMODE = _srt.SRTO_TSBPDMODE\n', 'SRTO_LATENCY = _srt.SRTO_LATENCY\n', 'SRTO_INPUTBW = _srt.SRTO_INPUTBW\n', 'SRTO_OHEADBW = _srt.SRTO_OHEADBW\n', 'SRTO_PASSPHRASE = _srt.SRTO_PASSPHRASE\n', 'SRTO_PBKEYLEN = _srt.SRTO_PBKEYLEN\n', 'SRTO_KMSTATE = _srt.SRTO_KMSTATE\n', 'SRTO_IPTTL = _srt.SRTO_IPTTL\n', 'SRTO_IPTOS = _srt.SRTO_IPTOS\n', 'SRTO_TLPKTDROP = _srt.SRTO_TLPKTDROP\n', 'SRTO_SNDDROPDELAY = _srt.SRTO_SNDDROPDELAY\n', 'SRTO_NAKREPORT = _srt.SRTO_NAKREPORT\n', 'SRTO_VERSION = _srt.SRTO_VERSION\n', 'SRTO_PEERVERSION = _srt.SRTO_PEERVERSION\n', 'SRTO_CONNTIMEO = _srt.SRTO_CONNTIMEO\n', 'SRTO_DRIFTTRACER = _srt.SRTO_DRIFTTRACER\n', 'SRTO_MININPUTBW = _srt.SRTO_MININPUTBW\n', 'SRTO_SNDKMSTATE = _srt.SRTO_SNDKMSTATE\n', 'SRTO_RCVKMSTATE = _srt.SRTO_RCVKMSTATE\n', 'SRTO_LOSSMAXTTL = _srt.SRTO_LOSSMAXTTL\n', 'SRTO_RCVLATENCY = _srt.SRTO_RCVLATENCY\n', 'SRTO_PEERLATENCY = _srt.SRTO_PEERLATENCY\n', 'SRTO_MINVERSION = _srt.SRTO_MINVERSION\n', 'SRTO_STREAMID = _srt.SRTO_STREAMID\n', 'SRTO_CONGESTION = _srt.SRTO_CONGESTION\n', 'SRTO_MESSAGEAPI = _srt.SRTO_MESSAGEAPI\n', 'SRTO_PAYLOADSIZE = _srt.SRTO_PAYLOADSIZE\n', 'SRTO_TRANSTYPE = _srt.SRTO_TRANSTYPE\n', 'SRTO_KMREFRESHRATE = _srt.SRTO_KMREFRESHRATE\n', 'SRTO_KMPREANNOUNCE = _srt.SRTO_KMPREANNOUNCE\n', 'SRTO_ENFORCEDENCRYPTION = _srt.SRTO_ENFORCEDENCRYPTION\n', 'SRTO_IPV6ONLY = _srt.SRTO_IPV6ONLY\n', 'SRTO_PEERIDLETIMEO = _srt.SRTO_PEERIDLETIMEO\n', 'SRTO_BINDTODEVICE = _srt.SRTO_BINDTODEVICE\n', 'SRTO_PACKETFILTER = _srt.SRTO_PACKETFILTER\n', 'SRTO_RETRANSMITALGO = _srt.SRTO_RETRANSMITALGO\n', 'SRTO_E_SIZE = _srt.SRTO_E_SIZE\n', 'SRTO_DEPRECATED_END = _srt.SRTO_DEPRECATED_END\n', 'SRTT_LIVE = _srt.SRTT_LIVE\n', 'SRTT_FILE = _srt.SRTT_FILE\n', 'SRTT_INVALID = _srt.SRTT_INVALID\n', 'class CBytePerfMon(object):\n', '    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")\n', '    __repr__ = _swig_repr\n', '    msTimeStamp = property(_srt.CBytePerfMon_msTimeStamp_get, _srt.CBytePerfMon_msTimeStamp_set)\n', '    pktSentTotal = property(_srt.CBytePerfMon_pktSentTotal_get, _srt.CBytePerfMon_pktSentTotal_set)\n', '    pktRecvTotal = property(_srt.CBytePerfMon_pktRecvTotal_get, _srt.CBytePerfMon_pktRecvTotal_set)\n', '    pktSndLossTotal = property(_srt.CBytePerfMon_pktSndLossTotal_get, _srt.CBytePerfMon_pktSndLossTotal_set)\n', '    pktRcvLossTotal = property(_srt.CBytePerfMon_pktRcvLossTotal_get, _srt.CBytePerfMon_pktRcvLossTotal_set)\n', '    pktRetransTotal = property(_srt.CBytePerfMon_pktRetransTotal_get, _srt.CBytePerfMon_pktRetransTotal_set)\n', '    pktSentACKTotal = property(_srt.CBytePerfMon_pktSentACKTotal_get, _srt.CBytePerfMon_pktSentACKTotal_set)\n', '    pktRecvACKTotal = property(_srt.CBytePerfMon_pktRecvACKTotal_get, _srt.CBytePerfMon_pktRecvACKTotal_set)\n', '    pktSentNAKTotal = property(_srt.CBytePerfMon_pktSentNAKTotal_get, _srt.CBytePerfMon_pktSentNAKTotal_set)\n', '    pktRecvNAKTotal = property(_srt.CBytePerfMon_pktRecvNAKTotal_get, _srt.CBytePerfMon_pktRecvNAKTotal_set)\n', '    usSndDurationTotal = property(_srt.CBytePerfMon_usSndDurationTotal_get, _srt.CBytePerfMon_usSndDurationTotal_set)\n', '    pktSndDropTotal = property(_srt.CBytePerfMon_pktSndDropTotal_get, _srt.CBytePerfMon_pktSndDropTotal_set)\n', '    pktRcvDropTotal = property(_srt.CBytePerfMon_pktRcvDropTotal_get, _srt.CBytePerfMon_pktRcvDropTotal_set)\n', '    pktRcvUndecryptTotal = property(_srt.CBytePerfMon_pktRcvUndecryptTotal_get, _srt.CBytePerfMon_pktRcvUndecryptTotal_set)\n', '    byteSentTotal = property(_srt.CBytePerfMon_byteSentTotal_get, _srt.CBytePerfMon_byteSentTotal_set)\n', '    byteRecvTotal = property(_srt.CBytePerfMon_byteRecvTotal_get, _srt.CBytePerfMon_byteRecvTotal_set)\n', '    byteRcvLossTotal = property(_srt.CBytePerfMon_byteRcvLossTotal_get, _srt.CBytePerfMon_byteRcvLossTotal_set)\n', '    byteRetransTotal = property(_srt.CBytePerfMon_byteRetransTotal_get, _srt.CBytePerfMon_byteRetransTotal_set)\n', '    byteSndDropTotal = property(_srt.CBytePerfMon_byteSndDropTotal_get, _srt.CBytePerfMon_byteSndDropTotal_set)\n', '    byteRcvDropTotal = property(_srt.CBytePerfMon_byteRcvDropTotal_get, _srt.CBytePerfMon_byteRcvDropTotal_set)\n', '    byteRcvUndecryptTotal = property(_srt.CBytePerfMon_byteRcvUndecryptTotal_get, _srt.CBytePerfMon_byteRcvUndecryptTotal_set)\n', '    pktSent = property(_srt.CBytePerfMon_pktSent_get, _srt.CBytePerfMon_pktSent_set)\n', '    pktRecv = property(_srt.CBytePerfMon_pktRecv_get, _srt.CBytePerfMon_pktRecv_set)\n', '    pktSndLoss = property(_srt.CBytePerfMon_pktSndLoss_get, _srt.CBytePerfMon_pktSndLoss_set)\n', '    pktRcvLoss = property(_srt.CBytePerfMon_pktRcvLoss_get, _srt.CBytePerfMon_pktRcvLoss_set)\n', '    pktRetrans = property(_srt.CBytePerfMon_pktRetrans_get, _srt.CBytePerfMon_pktRetrans_set)\n', '    pktRcvRetrans = property(_srt.CBytePerfMon_pktRcvRetrans_get, _srt.CBytePerfMon_pktRcvRetrans_set)\n', '    pktSentACK = property(_srt.CBytePerfMon_pktSentACK_get, _srt.CBytePerfMon_pktSentACK_set)\n', '    pktRecvACK = property(_srt.CBytePerfMon_pktRecvACK_get, _srt.CBytePerfMon_pktRecvACK_set)\n', '    pktSentNAK = property(_srt.CBytePerfMon_pktSentNAK_get, _srt.CBytePerfMon_pktSentNAK_set)\n', '    pktRecvNAK = property(_srt.CBytePerfMon_pktRecvNAK_get, _srt.CBytePerfMon_pktRecvNAK_set)\n', '    mbpsSendRate = property(_srt.CBytePerfMon_mbpsSendRate_get, _srt.CBytePerfMon_mbpsSendRate_set)\n', '    mbpsRecvRate = property(_srt.CBytePerfMon_mbpsRecvRate_get, _srt.CBytePerfMon_mbpsRecvRate_set)\n', '    usSndDuration = property(_srt.CBytePerfMon_usSndDuration_get, _srt.CBytePerfMon_usSndDuration_set)\n', '    pktReorderDistance = property(_srt.CBytePerfMon_pktReorderDistance_get, _srt.CBytePerfMon_pktReorderDistance_set)\n', '    pktRcvAvgBelatedTime = property(_srt.CBytePerfMon_pktRcvAvgBelatedTime_get, _srt.CBytePerfMon_pktRcvAvgBelatedTime_set)\n', '    pktRcvBelated = property(_srt.CBytePerfMon_pktRcvBelated_get, _srt.CBytePerfMon_pktRcvBelated_set)\n', '    pktSndDrop = property(_srt.CBytePerfMon_pktSndDrop_get, _srt.CBytePerfMon_pktSndDrop_set)\n', '    pktRcvDrop = property(_srt.CBytePerfMon_pktRcvDrop_get, _srt.CBytePerfMon_pktRcvDrop_set)\n', '    pktRcvUndecrypt = property(_srt.CBytePerfMon_pktRcvUndecrypt_get, _srt.CBytePerfMon_pktRcvUndecrypt_set)\n', '    byteSent = property(_srt.CBytePerfMon_byteSent_get, _srt.CBytePerfMon_byteSent_set)\n', '    byteRecv = property(_srt.CBytePerfMon_byteRecv_get, _srt.CBytePerfMon_byteRecv_set)\n', '    byteRcvLoss = property(_srt.CBytePerfMon_byteRcvLoss_get, _srt.CBytePerfMon_byteRcvLoss_set)\n', '    byteRetrans = property(_srt.CBytePerfMon_byteRetrans_get, _srt.CBytePerfMon_byteRetrans_set)\n', '    byteSndDrop = property(_srt.CBytePerfMon_byteSndDrop_get, _srt.CBytePerfMon_byteSndDrop_set)\n', '    byteRcvDrop = property(_srt.CBytePerfMon_byteRcvDrop_get, _srt.CBytePerfMon_byteRcvDrop_set)\n', '    byteRcvUndecrypt = property(_srt.CBytePerfMon_byteRcvUndecrypt_get, _srt.CBytePerfMon_byteRcvUndecrypt_set)\n', '    usPktSndPeriod = property(_srt.CBytePerfMon_usPktSndPeriod_get, _srt.CBytePerfMon_usPktSndPeriod_set)\n', '    pktFlowWindow = property(_srt.CBytePerfMon_pktFlowWindow_get, _srt.CBytePerfMon_pktFlowWindow_set)\n', '    pktCongestionWindow = property(_srt.CBytePerfMon_pktCongestionWindow_get, _srt.CBytePerfMon_pktCongestionWindow_set)\n', '    pktFlightSize = property(_srt.CBytePerfMon_pktFlightSize_get, _srt.CBytePerfMon_pktFlightSize_set)\n', '    msRTT = property(_srt.CBytePerfMon_msRTT_get, _srt.CBytePerfMon_msRTT_set)\n', '    mbpsBandwidth = property(_srt.CBytePerfMon_mbpsBandwidth_get, _srt.CBytePerfMon_mbpsBandwidth_set)\n', '    byteAvailSndBuf = property(_srt.CBytePerfMon_byteAvailSndBuf_get, _srt.CBytePerfMon_byteAvailSndBuf_set)\n', '    byteAvailRcvBuf = property(_srt.CBytePerfMon_byteAvailRcvBuf_get, _srt.CBytePerfMon_byteAvailRcvBuf_set)\n', '    mbpsMaxBW = property(_srt.CBytePerfMon_mbpsMaxBW_get, _srt.CBytePerfMon_mbpsMaxBW_set)\n', '    byteMSS = property(_srt.CBytePerfMon_byteMSS_get, _srt.CBytePerfMon_byteMSS_set)\n', '    pktSndBuf = property(_srt.CBytePerfMon_pktSndBuf_get, _srt.CBytePerfMon_pktSndBuf_set)\n', '    byteSndBuf = property(_srt.CBytePerfMon_byteSndBuf_get, _srt.CBytePerfMon_byteSndBuf_set)\n', '    msSndBuf = property(_srt.CBytePerfMon_msSndBuf_get, _srt.CBytePerfMon_msSndBuf_set)\n', '    msSndTsbPdDelay = property(_srt.CBytePerfMon_msSndTsbPdDelay_get, _srt.CBytePerfMon_msSndTsbPdDelay_set)\n', '    pktRcvBuf = property(_srt.CBytePerfMon_pktRcvBuf_get, _srt.CBytePerfMon_pktRcvBuf_set)\n', '    byteRcvBuf = property(_srt.CBytePerfMon_byteRcvBuf_get, _srt.CBytePerfMon_byteRcvBuf_set)\n', '    msRcvBuf = property(_srt.CBytePerfMon_msRcvBuf_get, _srt.CBytePerfMon_msRcvBuf_set)\n', '    msRcvTsbPdDelay = property(_srt.CBytePerfMon_msRcvTsbPdDelay_get, _srt.CBytePerfMon_msRcvTsbPdDelay_set)\n', '    pktSndFilterExtraTotal = property(_srt.CBytePerfMon_pktSndFilterExtraTotal_get, _srt.CBytePerfMon_pktSndFilterExtraTotal_set)\n', '    pktRcvFilterExtraTotal = property(_srt.CBytePerfMon_pktRcvFilterExtraTotal_get, _srt.CBytePerfMon_pktRcvFilterExtraTotal_set)\n', '    pktRcvFilterSupplyTotal = property(_srt.CBytePerfMon_pktRcvFilterSupplyTotal_get, _srt.CBytePerfMon_pktRcvFilterSupplyTotal_set)\n', '    pktRcvFilterLossTotal = property(_srt.CBytePerfMon_pktRcvFilterLossTotal_get, _srt.CBytePerfMon_pktRcvFilterLossTotal_set)\n', '    pktSndFilterExtra = property(_srt.CBytePerfMon_pktSndFilterExtra_get, _srt.CBytePerfMon_pktSndFilterExtra_set)\n', '    pktRcvFilterExtra = property(_srt.CBytePerfMon_pktRcvFilterExtra_get, _srt.CBytePerfMon_pktRcvFilterExtra_set)\n', '    pktRcvFilterSupply = property(_srt.CBytePerfMon_pktRcvFilterSupply_get, _srt.CBytePerfMon_pktRcvFilterSupply_set)\n', '    pktRcvFilterLoss = property(_srt.CBytePerfMon_pktRcvFilterLoss_get, _srt.CBytePerfMon_pktRcvFilterLoss_set)\n', '    pktReorderTolerance = property(_srt.CBytePerfMon_pktReorderTolerance_get, _srt.CBytePerfMon_pktReorderTolerance_set)\n', '    pktSentUniqueTotal = property(_srt.CBytePerfMon_pktSentUniqueTotal_get, _srt.CBytePerfMon_pktSentUniqueTotal_set)\n', '    pktRecvUniqueTotal = property(_srt.CBytePerfMon_pktRecvUniqueTotal_get, _srt.CBytePerfMon_pktRecvUniqueTotal_set)\n', '    byteSentUniqueTotal = property(_srt.CBytePerfMon_byteSentUniqueTotal_get, _srt.CBytePerfMon_byteSentUniqueTotal_set)\n', '    byteRecvUniqueTotal = property(_srt.CBytePerfMon_byteRecvUniqueTotal_get, _srt.CBytePerfMon_byteRecvUniqueTotal_set)\n', '    pktSentUnique = property(_srt.CBytePerfMon_pktSentUnique_get, _srt.CBytePerfMon_pktSentUnique_set)\n', '    pktRecvUnique = property(_srt.CBytePerfMon_pktRecvUnique_get, _srt.CBytePerfMon_pktRecvUnique_set)\n', '    byteSentUnique = property(_srt.CBytePerfMon_byteSentUnique_get, _srt.CBytePerfMon_byteSentUnique_set)\n', '    byteRecvUnique = property(_srt.CBytePerfMon_byteRecvUnique_get, _srt.CBytePerfMon_byteRecvUnique_set)\n', '\n', '    def __init__(self):\n', '        _srt.CBytePerfMon_swiginit(self, _srt.new_CBytePerfMon())\n', '    __swig_destroy__ = _srt.delete_CBytePerfMon\n', '\n', '# Register CBytePerfMon in _srt:\n', '_srt.CBytePerfMon_swigregister(CBytePerfMon)\n', 'cvar = _srt.cvar\n', 'SRTGROUP_MASK = cvar.SRTGROUP_MASK\n', 'SRT_LIVE_DEF_PLSIZE = cvar.SRT_LIVE_DEF_PLSIZE\n', 'SRT_LIVE_MAX_PLSIZE = cvar.SRT_LIVE_MAX_PLSIZE\n', 'SRT_LIVE_DEF_LATENCY_MS = cvar.SRT_LIVE_DEF_LATENCY_MS\n', '\n', 'MJ_UNKNOWN = _srt.MJ_UNKNOWN\n', 'MJ_SUCCESS = _srt.MJ_SUCCESS\n', 'MJ_SETUP = _srt.MJ_SETUP\n', 'MJ_CONNECTION = _srt.MJ_CONNECTION\n', 'MJ_SYSTEMRES = _srt.MJ_SYSTEMRES\n', 'MJ_FILESYSTEM = _srt.MJ_FILESYSTEM\n', 'MJ_NOTSUP = _srt.MJ_NOTSUP\n', 'MJ_AGAIN = _srt.MJ_AGAIN\n', 'MJ_PEERERROR = _srt.MJ_PEERERROR\n', 'MN_NONE = _srt.MN_NONE\n', 'MN_TIMEOUT = _srt.MN_TIMEOUT\n', 'MN_REJECTED = _srt.MN_REJECTED\n', 'MN_NORES = _srt.MN_NORES\n', 'MN_SECURITY = _srt.MN_SECURITY\n', 'MN_CLOSED = _srt.MN_CLOSED\n', 'MN_CONNLOST = _srt.MN_CONNLOST\n', 'MN_NOCONN = _srt.MN_NOCONN\n', 'MN_THREAD = _srt.MN_THREAD\n', 'MN_MEMORY = _srt.MN_MEMORY\n', 'MN_OBJECT = _srt.MN_OBJECT\n', 'MN_SEEKGFAIL = _srt.MN_SEEKGFAIL\n', 'MN_READFAIL = _srt.MN_READFAIL\n', 'MN_SEEKPFAIL = _srt.MN_SEEKPFAIL\n', 'MN_WRITEFAIL = _srt.MN_WRITEFAIL\n', 'MN_ISBOUND = _srt.MN_ISBOUND\n', 'MN_ISCONNECTED = _srt.MN_ISCONNECTED\n', 'MN_INVAL = _srt.MN_INVAL\n', 'MN_SIDINVAL = _srt.MN_SIDINVAL\n', 'MN_ISUNBOUND = _srt.MN_ISUNBOUND\n', 'MN_NOLISTEN = _srt.MN_NOLISTEN\n', 'MN_ISRENDEZVOUS = _srt.MN_ISRENDEZVOUS\n', 'MN_ISRENDUNBOUND = _srt.MN_ISRENDUNBOUND\n', 'MN_INVALMSGAPI = _srt.MN_INVALMSGAPI\n', 'MN_INVALBUFFERAPI = _srt.MN_INVALBUFFERAPI\n', 'MN_BUSY = _srt.MN_BUSY\n', 'MN_XSIZE = _srt.MN_XSIZE\n', 'MN_EIDINVAL = _srt.MN_EIDINVAL\n', 'MN_EEMPTY = _srt.MN_EEMPTY\n', 'MN_BUSYPORT = _srt.MN_BUSYPORT\n', 'MN_WRAVAIL = _srt.MN_WRAVAIL\n', 'MN_RDAVAIL = _srt.MN_RDAVAIL\n', 'MN_XMTIMEOUT = _srt.MN_XMTIMEOUT\n', 'MN_CONGESTION = _srt.MN_CONGESTION\n', 'SRT_EUNKNOWN = _srt.SRT_EUNKNOWN\n', 'SRT_SUCCESS = _srt.SRT_SUCCESS\n', 'SRT_ECONNSETUP = _srt.SRT_ECONNSETUP\n', 'SRT_ENOSERVER = _srt.SRT_ENOSERVER\n', 'SRT_ECONNREJ = _srt.SRT_ECONNREJ\n', 'SRT_ESOCKFAIL = _srt.SRT_ESOCKFAIL\n', 'SRT_ESECFAIL = _srt.SRT_ESECFAIL\n', 'SRT_ESCLOSED = _srt.SRT_ESCLOSED\n', 'SRT_ECONNFAIL = _srt.SRT_ECONNFAIL\n', 'SRT_ECONNLOST = _srt.SRT_ECONNLOST\n', 'SRT_ENOCONN = _srt.SRT_ENOCONN\n', 'SRT_ERESOURCE = _srt.SRT_ERESOURCE\n', 'SRT_ETHREAD = _srt.SRT_ETHREAD\n', 'SRT_ENOBUF = _srt.SRT_ENOBUF\n', 'SRT_ESYSOBJ = _srt.SRT_ESYSOBJ\n', 'SRT_EFILE = _srt.SRT_EFILE\n', 'SRT_EINVRDOFF = _srt.SRT_EINVRDOFF\n', 'SRT_ERDPERM = _srt.SRT_ERDPERM\n', 'SRT_EINVWROFF = _srt.SRT_EINVWROFF\n', 'SRT_EWRPERM = _srt.SRT_EWRPERM\n', 'SRT_EINVOP = _srt.SRT_EINVOP\n', 'SRT_EBOUNDSOCK = _srt.SRT_EBOUNDSOCK\n', 'SRT_ECONNSOCK = _srt.SRT_ECONNSOCK\n', 'SRT_EINVPARAM = _srt.SRT_EINVPARAM\n', 'SRT_EINVSOCK = _srt.SRT_EINVSOCK\n', 'SRT_EUNBOUNDSOCK = _srt.SRT_EUNBOUNDSOCK\n', 'SRT_ENOLISTEN = _srt.SRT_ENOLISTEN\n', 'SRT_ERDVNOSERV = _srt.SRT_ERDVNOSERV\n', 'SRT_ERDVUNBOUND = _srt.SRT_ERDVUNBOUND\n', 'SRT_EINVALMSGAPI = _srt.SRT_EINVALMSGAPI\n', 'SRT_EINVALBUFFERAPI = _srt.SRT_EINVALBUFFERAPI\n', 'SRT_EDUPLISTEN = _srt.SRT_EDUPLISTEN\n', 'SRT_ELARGEMSG = _srt.SRT_ELARGEMSG\n', 'SRT_EINVPOLLID = _srt.SRT_EINVPOLLID\n', 'SRT_EPOLLEMPTY = _srt.SRT_EPOLLEMPTY\n', 'SRT_EBINDCONFLICT = _srt.SRT_EBINDCONFLICT\n', 'SRT_EASYNCFAIL = _srt.SRT_EASYNCFAIL\n', 'SRT_EASYNCSND = _srt.SRT_EASYNCSND\n', 'SRT_EASYNCRCV = _srt.SRT_EASYNCRCV\n', 'SRT_ETIMEOUT = _srt.SRT_ETIMEOUT\n', 'SRT_ECONGEST = _srt.SRT_ECONGEST\n', 'SRT_EPEERERR = _srt.SRT_EPEERERR\n', 'SRT_REJ_UNKNOWN = _srt.SRT_REJ_UNKNOWN\n', 'SRT_REJ_SYSTEM = _srt.SRT_REJ_SYSTEM\n', 'SRT_REJ_PEER = _srt.SRT_REJ_PEER\n', 'SRT_REJ_RESOURCE = _srt.SRT_REJ_RESOURCE\n', 'SRT_REJ_ROGUE = _srt.SRT_REJ_ROGUE\n', 'SRT_REJ_BACKLOG = _srt.SRT_REJ_BACKLOG\n', 'SRT_REJ_IPE = _srt.SRT_REJ_IPE\n', 'SRT_REJ_CLOSE = _srt.SRT_REJ_CLOSE\n', 'SRT_REJ_VERSION = _srt.SRT_REJ_VERSION\n', 'SRT_REJ_RDVCOOKIE = _srt.SRT_REJ_RDVCOOKIE\n', 'SRT_REJ_BADSECRET = _srt.SRT_REJ_BADSECRET\n', 'SRT_REJ_UNSECURE = _srt.SRT_REJ_UNSECURE\n', 'SRT_REJ_MESSAGEAPI = _srt.SRT_REJ_MESSAGEAPI\n', 'SRT_REJ_CONGESTION = _srt.SRT_REJ_CONGESTION\n', 'SRT_REJ_FILTER = _srt.SRT_REJ_FILTER\n', 'SRT_REJ_GROUP = _srt.SRT_REJ_GROUP\n', 'SRT_REJ_TIMEOUT = _srt.SRT_REJ_TIMEOUT\n', 'SRT_REJ_E_SIZE = _srt.SRT_REJ_E_SIZE\n', 'SRT_REJC_INTERNAL = _srt.SRT_REJC_INTERNAL\n', 'SRT_REJC_PREDEFINED = _srt.SRT_REJC_PREDEFINED\n', 'SRT_REJC_USERDEFINED = _srt.SRT_REJC_USERDEFINED\n', 'SRT_LOGFA_GENERAL = _srt.SRT_LOGFA_GENERAL\n', 'SRT_LOGFA_SOCKMGMT = _srt.SRT_LOGFA_SOCKMGMT\n', 'SRT_LOGFA_CONN = _srt.SRT_LOGFA_CONN\n', 'SRT_LOGFA_XTIMER = _srt.SRT_LOGFA_XTIMER\n', 'SRT_LOGFA_TSBPD = _srt.SRT_LOGFA_TSBPD\n', 'SRT_LOGFA_RSRC = _srt.SRT_LOGFA_RSRC\n', 'SRT_LOGFA_CONGEST = _srt.SRT_LOGFA_CONGEST\n', 'SRT_LOGFA_PFILTER = _srt.SRT_LOGFA_PFILTER\n', 'SRT_LOGFA_API_CTRL = _srt.SRT_LOGFA_API_CTRL\n', 'SRT_LOGFA_QUE_CTRL = _srt.SRT_LOGFA_QUE_CTRL\n', 'SRT_LOGFA_EPOLL_UPD = _srt.SRT_LOGFA_EPOLL_UPD\n', 'SRT_LOGFA_API_RECV = _srt.SRT_LOGFA_API_RECV\n', 'SRT_LOGFA_BUF_RECV = _srt.SRT_LOGFA_BUF_RECV\n', 'SRT_LOGFA_QUE_RECV = _srt.SRT_LOGFA_QUE_RECV\n', 'SRT_LOGFA_CHN_RECV = _srt.SRT_LOGFA_CHN_RECV\n', 'SRT_LOGFA_GRP_RECV = _srt.SRT_LOGFA_GRP_RECV\n', 'SRT_LOGFA_API_SEND = _srt.SRT_LOGFA_API_SEND\n', 'SRT_LOGFA_BUF_SEND = _srt.SRT_LOGFA_BUF_SEND\n', 'SRT_LOGFA_QUE_SEND = _srt.SRT_LOGFA_QUE_SEND\n', 'SRT_LOGFA_CHN_SEND = _srt.SRT_LOGFA_CHN_SEND\n', 'SRT_LOGFA_GRP_SEND = _srt.SRT_LOGFA_GRP_SEND\n', 'SRT_LOGFA_INTERNAL = _srt.SRT_LOGFA_INTERNAL\n', 'SRT_LOGFA_QUE_MGMT = _srt.SRT_LOGFA_QUE_MGMT\n', 'SRT_LOGFA_CHN_MGMT = _srt.SRT_LOGFA_CHN_MGMT\n', 'SRT_LOGFA_GRP_MGMT = _srt.SRT_LOGFA_GRP_MGMT\n', 'SRT_LOGFA_EPOLL_API = _srt.SRT_LOGFA_EPOLL_API\n', 'SRT_LOGFA_HAICRYPT = _srt.SRT_LOGFA_HAICRYPT\n', 'SRT_LOGFA_APPLOG = _srt.SRT_LOGFA_APPLOG\n', 'SRT_LOGFA_LASTNONE = _srt.SRT_LOGFA_LASTNONE\n', 'SRT_KM_S_UNSECURED = _srt.SRT_KM_S_UNSECURED\n', 'SRT_KM_S_SECURING = _srt.SRT_KM_S_SECURING\n', 'SRT_KM_S_SECURED = _srt.SRT_KM_S_SECURED\n', 'SRT_KM_S_NOSECRET = _srt.SRT_KM_S_NOSECRET\n', 'SRT_KM_S_BADSECRET = _srt.SRT_KM_S_BADSECRET\n', 'SRT_EPOLL_OPT_NONE = _srt.SRT_EPOLL_OPT_NONE\n', 'SRT_EPOLL_IN = _srt.SRT_EPOLL_IN\n', 'SRT_EPOLL_OUT = _srt.SRT_EPOLL_OUT\n', 'SRT_EPOLL_ERR = _srt.SRT_EPOLL_ERR\n', 'SRT_EPOLL_CONNECT = _srt.SRT_EPOLL_CONNECT\n', 'SRT_EPOLL_ACCEPT = _srt.SRT_EPOLL_ACCEPT\n', 'SRT_EPOLL_UPDATE = _srt.SRT_EPOLL_UPDATE\n', 'SRT_EPOLL_ET = _srt.SRT_EPOLL_ET\n', 'SRT_EPOLL_ENABLE_EMPTY = _srt.SRT_EPOLL_ENABLE_EMPTY\n', 'SRT_EPOLL_ENABLE_OUTPUTCHECK = _srt.SRT_EPOLL_ENABLE_OUTPUTCHECK\n', '\n', 'def srt_startup():\n', '    return _srt.srt_startup()\n', '\n', 'def srt_cleanup():\n', '    return _srt.srt_cleanup()\n', '\n', 'def srt_socket(arg1, arg2, arg3):\n', '    return _srt.srt_socket(arg1, arg2, arg3)\n', '\n', 'def srt_create_socket():\n', '    return _srt.srt_create_socket()\n', '\n', 'def srt_bind(u, name, namelen):\n', '    return _srt.srt_bind(u, name, namelen)\n', '\n', 'def srt_bind_acquire(u, sys_udp_sock):\n', '    return _srt.srt_bind_acquire(u, sys_udp_sock)\n', '\n', 'def srt_bind_peerof(u, sys_udp_sock):\n', '    return _srt.srt_bind_peerof(u, sys_udp_sock)\n', '\n', 'def srt_listen(u, backlog):\n', '    return _srt.srt_listen(u, backlog)\n', '\n', 'def srt_accept(u, addr, addrlen):\n', '    return _srt.srt_accept(u, addr, addrlen)\n', '\n', 'def srt_accept_bond(listeners, lsize, msTimeOut):\n', '    return _srt.srt_accept_bond(listeners, lsize, msTimeOut)\n', '\n', 'def srt_listen_callback(lsn, hook_fn, hook_opaque):\n', '    return _srt.srt_listen_callback(lsn, hook_fn, hook_opaque)\n', '\n', 'def srt_connect_callback(clr, hook_fn, hook_opaque):\n', '    return _srt.srt_connect_callback(clr, hook_fn, hook_opaque)\n', '\n', 'def srt_connect(u, name, namelen):\n', '    return _srt.srt_connect(u, name, namelen)\n', '\n', 'def srt_connect_debug(u, name, namelen, forced_isn):\n', '    return _srt.srt_connect_debug(u, name, namelen, forced_isn)\n', '\n', 'def srt_connect_bind(u, source, target, len):\n', '    return _srt.srt_connect_bind(u, source, target, len)\n', '\n', 'def srt_rendezvous(u, local_name, local_namelen, remote_name, remote_namelen):\n', '    return _srt.srt_rendezvous(u, local_name, local_namelen, remote_name, remote_namelen)\n', '\n', 'def srt_close(u):\n', '    return _srt.srt_close(u)\n', '\n', 'def srt_getpeername(u, name, namelen):\n', '    return _srt.srt_getpeername(u, name, namelen)\n', '\n', 'def srt_getsockname(u, name, namelen):\n', '    return _srt.srt_getsockname(u, name, namelen)\n', '\n', 'def srt_getsockopt(u, level, optname, optval, optlen):\n', '    return _srt.srt_getsockopt(u, level, optname, optval, optlen)\n', '\n', 'def srt_setsockopt(u, level, optname, optval, optlen):\n', '    return _srt.srt_setsockopt(u, level, optname, optval, optlen)\n', '\n', 'def srt_getsockflag(u, opt, optval, optlen):\n', '    return _srt.srt_getsockflag(u, opt, optval, optlen)\n', '\n', 'def srt_setsockflag(u, opt, optval, optlen):\n', '    return _srt.srt_setsockflag(u, opt, optval, optlen)\n', 'class SRT_MSGCTRL(object):\n', '    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")\n', '    __repr__ = _swig_repr\n', '    flags = property(_srt.SRT_MSGCTRL_flags_get, _srt.SRT_MSGCTRL_flags_set)\n', '    msgttl = property(_srt.SRT_MSGCTRL_msgttl_get, _srt.SRT_MSGCTRL_msgttl_set)\n', '    inorder = property(_srt.SRT_MSGCTRL_inorder_get, _srt.SRT_MSGCTRL_inorder_set)\n', '    boundary = property(_srt.SRT_MSGCTRL_boundary_get, _srt.SRT_MSGCTRL_boundary_set)\n', '    srctime = property(_srt.SRT_MSGCTRL_srctime_get, _srt.SRT_MSGCTRL_srctime_set)\n', '    pktseq = property(_srt.SRT_MSGCTRL_pktseq_get, _srt.SRT_MSGCTRL_pktseq_set)\n', '    msgno = property(_srt.SRT_MSGCTRL_msgno_get, _srt.SRT_MSGCTRL_msgno_set)\n', '    grpdata = property(_srt.SRT_MSGCTRL_grpdata_get, _srt.SRT_MSGCTRL_grpdata_set)\n', '    grpdata_size = property(_srt.SRT_MSGCTRL_grpdata_size_get, _srt.SRT_MSGCTRL_grpdata_size_set)\n', '\n', '    def __init__(self):\n', '        _srt.SRT_MSGCTRL_swiginit(self, _srt.new_SRT_MSGCTRL())\n', '    __swig_destroy__ = _srt.delete_SRT_MSGCTRL\n', '\n', '# Register SRT_MSGCTRL in _srt:\n', '_srt.SRT_MSGCTRL_swigregister(SRT_MSGCTRL)\n', 'SRT_INVALID_SOCK = cvar.SRT_INVALID_SOCK\n', 'SRT_ERROR = cvar.SRT_ERROR\n', '\n', '\n', 'def srt_msgctrl_init(mctrl):\n', '    return _srt.srt_msgctrl_init(mctrl)\n', '\n', 'def srt_send(u, buf, len):\n', '    return _srt.srt_send(u, buf, len)\n', '\n', 'def srt_sendmsg(u, buf, len, ttl, inorder):\n', '    return _srt.srt_sendmsg(u, buf, len, ttl, inorder)\n', '\n', 'def srt_sendmsg2(u, buf, len, mctrl):\n', '    return _srt.srt_sendmsg2(u, buf, len, mctrl)\n', '\n', 'def srt_recv(u, buf, len):\n', '    return _srt.srt_recv(u, buf, len)\n', '\n', 'def srt_recvmsg(u, buf, len):\n', '    return _srt.srt_recvmsg(u, buf, len)\n', '\n', 'def srt_recvmsg2(u, buf, len, mctrl):\n', '    return _srt.srt_recvmsg2(u, buf, len, mctrl)\n', 'SRT_DEFAULT_SENDFILE_BLOCK = _srt.SRT_DEFAULT_SENDFILE_BLOCK\n', 'SRT_DEFAULT_RECVFILE_BLOCK = _srt.SRT_DEFAULT_RECVFILE_BLOCK\n', '\n', 'def srt_sendfile(u, path, offset, size, block):\n', '    return _srt.srt_sendfile(u, path, offset, size, block)\n', '\n', 'def srt_recvfile(u, path, offset, size, block):\n', '    return _srt.srt_recvfile(u, path, offset, size, block)\n', '\n', 'def srt_getlasterror_str():\n', '    return _srt.srt_getlasterror_str()\n', '\n', 'def srt_getlasterror(errno_loc):\n', '    return _srt.srt_getlasterror(errno_loc)\n', '\n', 'def srt_strerror(code, errnoval):\n', '    return _srt.srt_strerror(code, errnoval)\n', '\n', 'def srt_clearlasterror():\n', '    return _srt.srt_clearlasterror()\n', '\n', 'def srt_bstats(u, perf, clear):\n', '    return _srt.srt_bstats(u, perf, clear)\n', '\n', 'def srt_bistats(u, perf, clear, instantaneous):\n', '    return _srt.srt_bistats(u, perf, clear, instantaneous)\n', '\n', 'def srt_getsockstate(u):\n', '    return _srt.srt_getsockstate(u)\n', '\n', 'def srt_epoll_create():\n', '    return _srt.srt_epoll_create()\n', '\n', 'def srt_epoll_clear_usocks(eid):\n', '    return _srt.srt_epoll_clear_usocks(eid)\n', '\n', 'def srt_epoll_add_usock(eid, u, events):\n', '    return _srt.srt_epoll_add_usock(eid, u, events)\n', '\n', 'def srt_epoll_add_ssock(eid, s, events):\n', '    return _srt.srt_epoll_add_ssock(eid, s, events)\n', '\n', 'def srt_epoll_remove_usock(eid, u):\n', '    return _srt.srt_epoll_remove_usock(eid, u)\n', '\n', 'def srt_epoll_remove_ssock(eid, s):\n', '    return _srt.srt_epoll_remove_ssock(eid, s)\n', '\n', 'def srt_epoll_update_usock(eid, u, events):\n', '    return _srt.srt_epoll_update_usock(eid, u, events)\n', '\n', 'def srt_epoll_update_ssock(eid, s, events):\n', '    return _srt.srt_epoll_update_ssock(eid, s, events)\n', '\n', 'def srt_epoll_wait(eid, readfds, rnum, writefds, wnum, msTimeOut, lrfds, lrnum, lwfds, lwnum):\n', '    return _srt.srt_epoll_wait(eid, readfds, rnum, writefds, wnum, msTimeOut, lrfds, lrnum, lwfds, lwnum)\n', 'class SRT_EPOLL_EVENT(object):\n', '    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")\n', '    __repr__ = _swig_repr\n', '    fd = property(_srt.SRT_EPOLL_EVENT_fd_get, _srt.SRT_EPOLL_EVENT_fd_set)\n', '    events = property(_srt.SRT_EPOLL_EVENT_events_get, _srt.SRT_EPOLL_EVENT_events_set)\n', '\n', '    def __init__(self):\n', '        _srt.SRT_EPOLL_EVENT_swiginit(self, _srt.new_SRT_EPOLL_EVENT())\n', '    __swig_destroy__ = _srt.delete_SRT_EPOLL_EVENT\n', '\n', '# Register SRT_EPOLL_EVENT in _srt:\n', '_srt.SRT_EPOLL_EVENT_swigregister(SRT_EPOLL_EVENT)\n', 'SRT_SEQNO_NONE = cvar.SRT_SEQNO_NONE\n', 'SRT_MSGNO_NONE = cvar.SRT_MSGNO_NONE\n', 'SRT_MSGNO_CONTROL = cvar.SRT_MSGNO_CONTROL\n', 'SRT_MSGTTL_INF = cvar.SRT_MSGTTL_INF\n', 'srt_msgctrl_default = cvar.srt_msgctrl_default\n', '\n', '\n', 'def srt_epoll_uwait(eid, fdsSet, fdsSize, msTimeOut):\n', '    return _srt.srt_epoll_uwait(eid, fdsSet, fdsSize, msTimeOut)\n', '\n', 'def srt_epoll_set(eid, flags):\n', '    return _srt.srt_epoll_set(eid, flags)\n', '\n', 'def srt_epoll_release(eid):\n', '    return _srt.srt_epoll_release(eid)\n', '\n', 'def srt_setloglevel(ll):\n', '    return _srt.srt_setloglevel(ll)\n', '\n', 'def srt_addlogfa(fa):\n', '    return _srt.srt_addlogfa(fa)\n', '\n', 'def srt_dellogfa(fa):\n', '    return _srt.srt_dellogfa(fa)\n', '\n', 'def srt_resetlogfa(fara, fara_size):\n', '    return _srt.srt_resetlogfa(fara, fara_size)\n', '\n', 'def srt_setloghandler(opaque, handler):\n', '    return _srt.srt_setloghandler(opaque, handler)\n', '\n', 'def srt_setlogflags(flags):\n', '    return _srt.srt_setlogflags(flags)\n', '\n', 'def srt_getsndbuffer(sock, blocks, bytes):\n', '    return _srt.srt_getsndbuffer(sock, blocks, bytes)\n', '\n', 'def srt_getrejectreason(sock):\n', '    return _srt.srt_getrejectreason(sock)\n', '\n', 'def srt_setrejectreason(sock, value):\n', '    return _srt.srt_setrejectreason(sock, value)\n', '\n', 'def srt_rejectreason_str(id):\n', '    return _srt.srt_rejectreason_str(id)\n', '\n', 'def srt_getversion():\n', '    return _srt.srt_getversion()\n', '\n', 'def srt_time_now():\n', '    return _srt.srt_time_now()\n', '\n', 'def srt_connection_time(sock):\n', '    return _srt.srt_connection_time(sock)\n', 'SRT_SYNC_CLOCK_STDCXX_STEADY = _srt.SRT_SYNC_CLOCK_STDCXX_STEADY\n', 'SRT_SYNC_CLOCK_GETTIME_MONOTONIC = _srt.SRT_SYNC_CLOCK_GETTIME_MONOTONIC\n', 'SRT_SYNC_CLOCK_WINQPC = _srt.SRT_SYNC_CLOCK_WINQPC\n', 'SRT_SYNC_CLOCK_MACH_ABSTIME = _srt.SRT_SYNC_CLOCK_MACH_ABSTIME\n', 'SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY = _srt.SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY\n', 'SRT_SYNC_CLOCK_AMD64_RDTSC = _srt.SRT_SYNC_CLOCK_AMD64_RDTSC\n', 'SRT_SYNC_CLOCK_IA32_RDTSC = _srt.SRT_SYNC_CLOCK_IA32_RDTSC\n', 'SRT_SYNC_CLOCK_IA64_ITC = _srt.SRT_SYNC_CLOCK_IA64_ITC\n', '\n', 'def srt_clock_type():\n', '    return _srt.srt_clock_type()\n', '\n', 'srt_rejectreason_msg = cvar.srt_rejectreason_msg\n', '\n'], 0)
 
-----------------------------------------------------------
 
4. Class documentation :
 
None
 
-----------------------------------------------------------
 
5. Get methods prototype by introspection :
 
     - srt_startup()
     - srt_socket(arg1, arg2, arg3)
     - srt_bind(u, name, namelen)
     - srt_bind_acquire(u, sys_udp_sock)
     - srt_bind_peerof(u, sys_udp_sock)
     - srt_listen(u, backlog)
     - srt_accept(u, addr, addrlen)
     - srt_accept_bond(listeners, lsize, msTimeOut)
     - srt_listen_callback(lsn, hook_fn, hook_opaque)
     - srt_connect(u, name, namelen)
     - srt_connect_debug(u, name, namelen, forced_isn)
     - srt_connect_bind(u, source, target, len)
     - srt_rendezvous(u, local_name, local_namelen, remote_name, remote_namelen)
     - srt_close(u)
     - srt_getpeername(u, name, namelen)
     - srt_getsockname(u, name, namelen)
     - srt_getsockopt(u, level, optname, optval, optlen)
     - srt_setsockopt(u, level, optname, optval, optlen)
     - srt_getsockflag(u, opt, optval, optlen)
     - srt_setsockflag(u, opt, optval, optlen)
     - srt_msgctrl_init(mctrl)
     - srt_send(u, buf, len)
     - srt_sendmsg(u, buf, len, ttl, inorder)
     - srt_sendmsg2(u, buf, len, mctrl)
     - srt_recv(u, buf, len)
     - srt_recvmsg(u, buf, len)
     - srt_recvmsg2(u, buf, len, mctrl)
     - srt_sendfile(u, path, offset, size, block)
     - srt_recvfile(u, path, offset, size, block)
     - srt_getlasterror_str()
     - srt_getlasterror(errno_loc)
     - srt_strerror(code, errnoval)
     - srt_clearlasterror()
     - srt_bstats(u, perf, clear)
     - srt_bistats(u, perf, clear, instantaneous)
     - srt_getsockstate(u)
     - srt_epoll_create()
     - srt_epoll_clear_usocks(eid)
     - srt_epoll_add_usock(eid, u, events)
     - srt_epoll_add_ssock(eid, s, events)
     - srt_epoll_remove_usock(eid, u)
     - srt_epoll_remove_ssock(eid, s)
     - srt_epoll_update_usock(eid, u, events)
     - srt_epoll_update_ssock(eid, s, events)
     - srt_epoll_wait(eid, readfds, rnum, writefds, wnum, msTimeOut, lrfds, lrnum, lwfds, lwnum)
     - srt_epoll_uwait(eid, fdsSet, fdsSize, msTimeOut)
     - srt_epoll_set(eid, flags)
     - srt_epoll_release(eid)
     - srt_setloglevel(ll)
     - srt_addlogfa(fa)
     - srt_dellogfa(fa)
     - srt_resetlogfa(fara, fara_size)
     - srt_setloghandler(opaque, handler)
     - srt_getsndbuffer(sock, blocks, bytes)
     - srt_getrejectreason(sock)
     - srt_setrejectreason(sock, value)
     - srt_rejectreason_str(id)
     - srt_getversion()
     - srt_time_now()
     - srt_clock_type()

-------------------------------------------------------
                  END  OF  PROCESS                     
-------------------------------------------------------
```

Once executed, a working directory will contain all the working files, including the SRT library built from the official sdk (libsrt.so, libsrt.so.1.4, libsrt.so.1.4.4) but also its binding (_srt.so and srt.py).

```
tree ./tmp/o8MWLGyaGi/
├── delivery
│   ├── sdk
│   │   └── usr
│   │       ├── lib
│   │       │   ├── python3.10
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   ├── python3.6
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   ├── python3.7
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   ├── python3.8
│   │       │   │   ├── srt.py
│   │       │   │   └── _srt.so
│   │       │   └── python3.9
│   │       │       ├── srt.py
│   │       │       └── _srt.so
│   │       └── local
│   │           ├── bin
│   │           │   ├── srt-ffplay
│   │           │   ├── srt-file-transmit
│   │           │   ├── srt-live-transmit
│   │           │   └── srt-tunnel
│   │           ├── include
│   │           │   └── srt
│   │           │       ├── access_control.h
│   │           │       ├── logging_api.h
│   │           │       ├── platform_sys.h
│   │           │       ├── srt.h
│   │           │       ├── udt.h
│   │           │       └── version.h
│   │           └── lib
│   │               ├── libsrt.a
│   │               ├── libsrt.so -> libsrt.so.1.4
│   │               ├── libsrt.so.1.4 -> libsrt.so.1.4.4
│   │               ├── libsrt.so.1.4.4
│   │               └── pkgconfig
│   │                   ├── haisrt.pc
│   │                   └── srt.pc
│   ├── srt.py
│   └── _srt.so
```

The SRT python binding is composed of two files: srt.py which is the visible/top part of the iceberg and _srt.so which is the hidden/internal/bottom part.

Those two files can be installed at the system level (/usr/lib/python3.9/), stay in the current path or located in another directory using the PYTHONPATH environment's variable :

```
$ export PYTHONPATH=${PYTHONPATH}:${HOME}/py_srt_binding
```

As for the Haivision srt library, if no similar library is already installed, it is possible to deploy it at the system level (ex: /usr/local/lib/) then to update the loader cache for the editor dynamic links:

```
$ sudo ldconfig
```

To check if a similar library was already installed at the system level:

```
$ ldconfig -p | grep libsrt.so
libsrt.so.1.4 (libc6, x86-64) => /usr/local/lib/libsrt.so.1.4
libsrt.so (libc6, x86-64) => /usr/local/lib/libsrt.so
```

Otherwise, it is possible to override the search:

```
$ cd tmp /o8MWLGyaGi/delivery/
$ export LD_LIBRARY_PATH=$PWD/sdk/usr/local/lib
```

Once everything is in place, it is possible to import the binding into a python interpreter:

```
$ python3
Python 3.8.10 (default, Sep 28 2021, 16:10:42)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import srt

>>> type(srt)
<class 'module'>

>>> print(dir(srt))
['CBytePerfMon', 'ENABLE_EXPERIMENTAL_BONDING', 'MJ_AGAIN', 'MJ_CONNECTION', 'MJ_FILESYSTEM', 'MJ_NOTSUP', 'MJ_PEERERROR', 'MJ_SETUP', 'MJ_SUCCESS', 'MJ_SYSTEMRES', 'MJ_UNKNOWN', 'MN_BUSY', 'MN_BUSYPORT', 'MN_CLOSED', 'MN_CONGESTION', 'MN_CONNLOST', 'MN_EEMPTY', 'MN_EIDINVAL', 'MN_INVAL', 'MN_INVALBUFFERAPI', 'MN_INVALMSGAPI', 'MN_ISBOUND', 'MN_ISCONNECTED', 'MN_ISRENDEZVOUS', 'MN_ISRENDUNBOUND', 'MN_ISUNBOUND', 'MN_MEMORY', 'MN_NOCONN', 'MN_NOLISTEN', 'MN_NONE', 'MN_NORES', 'MN_OBJECT', 'MN_RDAVAIL', 'MN_READFAIL', 'MN_REJECTED', 'MN_SECURITY', 'MN_SEEKGFAIL', 'MN_SEEKPFAIL', 'MN_SIDINVAL', 'MN_THREAD', 'MN_TIMEOUT', 'MN_WRAVAIL', 'MN_WRITEFAIL', 'MN_XMTIMEOUT', 'MN_XSIZE', 'SRTGROUP_MASK', 'SRTO_BINDTODEVICE', 'SRTO_CONGESTION', 'SRTO_CONNTIMEO', 'SRTO_DEPRECATED_END', 'SRTO_DRIFTTRACER', 'SRTO_ENFORCEDENCRYPTION', 'SRTO_EVENT', 'SRTO_E_SIZE', 'SRTO_FC', 'SRTO_INPUTBW', 'SRTO_IPTOS', 'SRTO_IPTTL', 'SRTO_IPV6ONLY', 'SRTO_ISN', 'SRTO_KMPREANNOUNCE', 'SRTO_KMREFRESHRATE', 'SRTO_KMSTATE', 'SRTO_LATENCY', 'SRTO_LINGER', 'SRTO_LOSSMAXTTL', 'SRTO_MAXBW', 'SRTO_MESSAGEAPI', 'SRTO_MININPUTBW', 'SRTO_MINVERSION', 'SRTO_MSS', 'SRTO_NAKREPORT', 'SRTO_OHEADBW', 'SRTO_PACKETFILTER', 'SRTO_PASSPHRASE', 'SRTO_PAYLOADSIZE', 'SRTO_PBKEYLEN', 'SRTO_PEERIDLETIMEO', 'SRTO_PEERLATENCY', 'SRTO_PEERVERSION', 'SRTO_RCVBUF', 'SRTO_RCVDATA', 'SRTO_RCVKMSTATE', 'SRTO_RCVLATENCY', 'SRTO_RCVSYN', 'SRTO_RCVTIMEO', 'SRTO_RENDEZVOUS', 'SRTO_RETRANSMITALGO', 'SRTO_REUSEADDR', 'SRTO_SENDER', 'SRTO_SNDBUF', 'SRTO_SNDDATA', 'SRTO_SNDDROPDELAY', 'SRTO_SNDKMSTATE', 'SRTO_SNDSYN', 'SRTO_SNDTIMEO', 'SRTO_STATE', 'SRTO_STREAMID', 'SRTO_TLPKTDROP', 'SRTO_TRANSTYPE', 'SRTO_TSBPDMODE', 'SRTO_UDP_RCVBUF', 'SRTO_UDP_SNDBUF', 'SRTO_VERSION', 'SRTS_BROKEN', 'SRTS_CLOSED', 'SRTS_CLOSING', 'SRTS_CONNECTED', 'SRTS_CONNECTING', 'SRTS_INIT', 'SRTS_LISTENING', 'SRTS_NONEXIST', 'SRTS_OPENED', 'SRTT_FILE', 'SRTT_INVALID', 'SRTT_LIVE', 'SRT_DEFAULT_RECVFILE_BLOCK', 'SRT_DEFAULT_SENDFILE_BLOCK', 'SRT_EASYNCFAIL', 'SRT_EASYNCRCV', 'SRT_EASYNCSND', 'SRT_EBINDCONFLICT', 'SRT_EBOUNDSOCK', 'SRT_ECONGEST', 'SRT_ECONNFAIL', 'SRT_ECONNLOST', 'SRT_ECONNREJ', 'SRT_ECONNSETUP', 'SRT_ECONNSOCK', 'SRT_EDUPLISTEN', 'SRT_EFILE', 'SRT_EINVALBUFFERAPI', 'SRT_EINVALMSGAPI', 'SRT_EINVOP', 'SRT_EINVPARAM', 'SRT_EINVPOLLID', 'SRT_EINVRDOFF', 'SRT_EINVSOCK', 'SRT_EINVWROFF', 'SRT_ELARGEMSG', 'SRT_ENOBUF', 'SRT_ENOCONN', 'SRT_ENOLISTEN', 'SRT_ENOSERVER', 'SRT_EPEERERR', 'SRT_EPOLLEMPTY', 'SRT_EPOLL_ACCEPT', 'SRT_EPOLL_CONNECT', 'SRT_EPOLL_ENABLE_EMPTY', 'SRT_EPOLL_ENABLE_OUTPUTCHECK', 'SRT_EPOLL_ERR', 'SRT_EPOLL_ET', 'SRT_EPOLL_EVENT', 'SRT_EPOLL_IN', 'SRT_EPOLL_OPT_NONE', 'SRT_EPOLL_OUT', 'SRT_EPOLL_UPDATE', 'SRT_ERDPERM', 'SRT_ERDVNOSERV', 'SRT_ERDVUNBOUND', 'SRT_ERESOURCE', 'SRT_ERROR', 'SRT_ESCLOSED', 'SRT_ESECFAIL', 'SRT_ESOCKFAIL', 'SRT_ESYSOBJ', 'SRT_ETHREAD', 'SRT_ETIMEOUT', 'SRT_EUNBOUNDSOCK', 'SRT_EUNKNOWN', 'SRT_EWRPERM', 'SRT_HAVE_CXX17', 'SRT_INVALID_SOCK', 'SRT_KM_S_BADSECRET', 'SRT_KM_S_NOSECRET', 'SRT_KM_S_SECURED', 'SRT_KM_S_SECURING', 'SRT_KM_S_UNSECURED', 'SRT_LIVE_DEF_LATENCY_MS', 'SRT_LIVE_DEF_PLSIZE', 'SRT_LIVE_MAX_PLSIZE', 'SRT_LOGFA_API_CTRL', 'SRT_LOGFA_API_RECV', 'SRT_LOGFA_API_SEND', 'SRT_LOGFA_APPLOG', 'SRT_LOGFA_BUF_RECV', 'SRT_LOGFA_BUF_SEND', 'SRT_LOGFA_CHN_MGMT', 'SRT_LOGFA_CHN_RECV', 'SRT_LOGFA_CHN_SEND', 'SRT_LOGFA_CONGEST', 'SRT_LOGFA_CONN', 'SRT_LOGFA_EPOLL_API', 'SRT_LOGFA_EPOLL_UPD', 'SRT_LOGFA_GENERAL', 'SRT_LOGFA_GRP_MGMT', 'SRT_LOGFA_GRP_RECV', 'SRT_LOGFA_GRP_SEND', 'SRT_LOGFA_HAICRYPT', 'SRT_LOGFA_INTERNAL', 'SRT_LOGFA_LASTNONE', 'SRT_LOGFA_PFILTER', 'SRT_LOGFA_QUE_CTRL', 'SRT_LOGFA_QUE_MGMT', 'SRT_LOGFA_QUE_RECV', 'SRT_LOGFA_QUE_SEND', 'SRT_LOGFA_RSRC', 'SRT_LOGFA_SOCKMGMT', 'SRT_LOGFA_TSBPD', 'SRT_LOGFA_XTIMER', 'SRT_MSGCTRL', 'SRT_MSGNO_CONTROL', 'SRT_MSGNO_NONE', 'SRT_MSGTTL_INF', 'SRT_REJC_INTERNAL', 'SRT_REJC_PREDEFINED', 'SRT_REJC_USERDEFINED', 'SRT_REJ_BACKLOG', 'SRT_REJ_BADSECRET', 'SRT_REJ_CLOSE', 'SRT_REJ_CONGESTION', 'SRT_REJ_E_SIZE', 'SRT_REJ_FILTER', 'SRT_REJ_GROUP', 'SRT_REJ_IPE', 'SRT_REJ_MESSAGEAPI', 'SRT_REJ_PEER', 'SRT_REJ_RDVCOOKIE', 'SRT_REJ_RESOURCE', 'SRT_REJ_ROGUE', 'SRT_REJ_SYSTEM', 'SRT_REJ_TIMEOUT', 'SRT_REJ_UNKNOWN', 'SRT_REJ_UNSECURE', 'SRT_REJ_VERSION', 'SRT_SEQNO_NONE', 'SRT_SUCCESS', 'SRT_SYNC_CLOCK_AMD64_RDTSC', 'SRT_SYNC_CLOCK_GETTIME_MONOTONIC', 'SRT_SYNC_CLOCK_IA32_RDTSC', 'SRT_SYNC_CLOCK_IA64_ITC', 'SRT_SYNC_CLOCK_MACH_ABSTIME', 'SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY', 'SRT_SYNC_CLOCK_STDCXX_STEADY', 'SRT_SYNC_CLOCK_WINQPC', 'SRT_VERSION_FEAT_HSv5', '_SwigNonDynamicMeta', '__builtin__', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', '_srt', '_swig_add_metaclass', '_swig_python_version_info', '_swig_repr', '_swig_setattr_nondynamic_class_variable', '_swig_setattr_nondynamic_instance_variable', 'cvar', 'srt_accept', 'srt_accept_bond', 'srt_addlogfa', 'srt_bind', 'srt_bind_acquire', 'srt_bind_peerof', 'srt_bistats', 'srt_bstats', 'srt_cleanup', 'srt_clearlasterror', 'srt_clock_type', 'srt_close', 'srt_connect', 'srt_connect_bind', 'srt_connect_callback', 'srt_connect_debug', 'srt_connection_time', 'srt_create_socket', 'srt_dellogfa', 'srt_epoll_add_ssock', 'srt_epoll_add_usock', 'srt_epoll_clear_usocks', 'srt_epoll_create', 'srt_epoll_release', 'srt_epoll_remove_ssock', 'srt_epoll_remove_usock', 'srt_epoll_set', 'srt_epoll_update_ssock', 'srt_epoll_update_usock', 'srt_epoll_uwait', 'srt_epoll_wait', 'srt_getlasterror', 'srt_getlasterror_str', 'srt_getpeername', 'srt_getrejectreason', 'srt_getsndbuffer', 'srt_getsockflag', 'srt_getsockname', 'srt_getsockopt', 'srt_getsockstate', 'srt_getversion', 'srt_listen', 'srt_listen_callback', 'srt_msgctrl_default', 'srt_msgctrl_init', 'srt_recv', 'srt_recvfile', 'srt_recvmsg', 'srt_recvmsg2', 'srt_rejectreason_msg', 'srt_rejectreason_str', 'srt_rendezvous', 'srt_resetlogfa', 'srt_send', 'srt_sendfile', 'srt_sendmsg', 'srt_sendmsg2', 'srt_setlogflags', 'srt_setloghandler', 'srt_setloglevel', 'srt_setrejectreason', 'srt_setsockflag', 'srt_setsockopt', 'srt_socket', 'srt_startup', 'srt_strerror', 'srt_time_now']

>>> import inspect
>>> print(inspect.getmembers(srt))
[('CBytePerfMon', <class 'srt.CBytePerfMon'>), ('ENABLE_EXPERIMENTAL_BONDING', 0), ('MJ_AGAIN', 6), ('MJ_CONNECTION', 2), ('MJ_FILESYSTEM', 4), ('MJ_NOTSUP', 5), ('MJ_PEERERROR', 7), ('MJ_SETUP', 1), ('MJ_SUCCESS', 0), ('MJ_SYSTEMRES', 3), ('MJ_UNKNOWN', -1), ('MN_BUSY', 11), ('MN_BUSYPORT', 15), ('MN_CLOSED', 5), ('MN_CONGESTION', 4), ('MN_CONNLOST', 1), ('MN_EEMPTY', 14), ('MN_EIDINVAL', 13), ('MN_INVAL', 3), ('MN_INVALBUFFERAPI', 10), ('MN_INVALMSGAPI', 9), ('MN_ISBOUND', 1), ('MN_ISCONNECTED', 2), ('MN_ISRENDEZVOUS', 7), ('MN_ISRENDUNBOUND', 8), ('MN_ISUNBOUND', 5), ('MN_MEMORY', 2), ('MN_NOCONN', 2), ('MN_NOLISTEN', 6), ('MN_NONE', 0), ('MN_NORES', 3), ('MN_OBJECT', 3), ('MN_RDAVAIL', 2), ('MN_READFAIL', 2), ('MN_REJECTED', 2), ('MN_SECURITY', 4), ('MN_SEEKGFAIL', 1), ('MN_SEEKPFAIL', 3), ('MN_SIDINVAL', 4), ('MN_THREAD', 1), ('MN_TIMEOUT', 1), ('MN_WRAVAIL', 1), ('MN_WRITEFAIL', 4), ('MN_XMTIMEOUT', 3), ('MN_XSIZE', 12), ('SRTGROUP_MASK', <Swig Object of type 'SRT_EPOLL_T *' at 0x7f348c8ee780>), ('SRTO_BINDTODEVICE', 56), ('SRTO_CONGESTION', 47), ('SRTO_CONNTIMEO', 36), ('SRTO_DEPRECATED_END', 0), ('SRTO_DRIFTTRACER', 37), ('SRTO_ENFORCEDENCRYPTION', 53), ('SRTO_EVENT', 18), ('SRTO_E_SIZE', 62), ('SRTO_FC', 4), ('SRTO_INPUTBW', 24), ('SRTO_IPTOS', 30), ('SRTO_IPTTL', 29), ('SRTO_IPV6ONLY', 54), ('SRTO_ISN', 3), ('SRTO_KMPREANNOUNCE', 52), ('SRTO_KMREFRESHRATE', 51), ('SRTO_KMSTATE', 28), ('SRTO_LATENCY', 23), ('SRTO_LINGER', 7), ('SRTO_LOSSMAXTTL', 42), ('SRTO_MAXBW', 16), ('SRTO_MESSAGEAPI', 48), ('SRTO_MININPUTBW', 38), ('SRTO_MINVERSION', 45), ('SRTO_MSS', 0), ('SRTO_NAKREPORT', 33), ('SRTO_OHEADBW', 25), ('SRTO_PACKETFILTER', 60), ('SRTO_PASSPHRASE', 26), ('SRTO_PAYLOADSIZE', 49), ('SRTO_PBKEYLEN', 27), ('SRTO_PEERIDLETIMEO', 55), ('SRTO_PEERLATENCY', 44), ('SRTO_PEERVERSION', 35), ('SRTO_RCVBUF', 6), ('SRTO_RCVDATA', 20), ('SRTO_RCVKMSTATE', 41), ('SRTO_RCVLATENCY', 43), ('SRTO_RCVSYN', 2), ('SRTO_RCVTIMEO', 14), ('SRTO_RENDEZVOUS', 12), ('SRTO_RETRANSMITALGO', 61), ('SRTO_REUSEADDR', 15), ('SRTO_SENDER', 21), ('SRTO_SNDBUF', 5), ('SRTO_SNDDATA', 19), ('SRTO_SNDDROPDELAY', 32), ('SRTO_SNDKMSTATE', 40), ('SRTO_SNDSYN', 1), ('SRTO_SNDTIMEO', 13), ('SRTO_STATE', 17), ('SRTO_STREAMID', 46), ('SRTO_TLPKTDROP', 31), ('SRTO_TRANSTYPE', 50), ('SRTO_TSBPDMODE', 22), ('SRTO_UDP_RCVBUF', 9), ('SRTO_UDP_SNDBUF', 8), ('SRTO_VERSION', 34), ('SRTS_BROKEN', 6), ('SRTS_CLOSED', 8), ('SRTS_CLOSING', 7), ('SRTS_CONNECTED', 5), ('SRTS_CONNECTING', 4), ('SRTS_INIT', 1), ('SRTS_LISTENING', 3), ('SRTS_NONEXIST', 9), ('SRTS_OPENED', 2), ('SRTT_FILE', 1), ('SRTT_INVALID', 2), ('SRTT_LIVE', 0), ('SRT_DEFAULT_RECVFILE_BLOCK', 7280000), ('SRT_DEFAULT_SENDFILE_BLOCK', 364000), ('SRT_EASYNCFAIL', 6000), ('SRT_EASYNCRCV', 6002), ('SRT_EASYNCSND', 6001), ('SRT_EBINDCONFLICT', 5015), ('SRT_EBOUNDSOCK', 5001), ('SRT_ECONGEST', 6004), ('SRT_ECONNFAIL', 2000), ('SRT_ECONNLOST', 2001), ('SRT_ECONNREJ', 1002), ('SRT_ECONNSETUP', 1000), ('SRT_ECONNSOCK', 5002), ('SRT_EDUPLISTEN', 5011), ('SRT_EFILE', 4000), ('SRT_EINVALBUFFERAPI', 5010), ('SRT_EINVALMSGAPI', 5009), ('SRT_EINVOP', 5000), ('SRT_EINVPARAM', 5003), ('SRT_EINVPOLLID', 5013), ('SRT_EINVRDOFF', 4001), ('SRT_EINVSOCK', 5004), ('SRT_EINVWROFF', 4003), ('SRT_ELARGEMSG', 5012), ('SRT_ENOBUF', 3002), ('SRT_ENOCONN', 2002), ('SRT_ENOLISTEN', 5006), ('SRT_ENOSERVER', 1001), ('SRT_EPEERERR', 7000), ('SRT_EPOLLEMPTY', 5014), ('SRT_EPOLL_ACCEPT', 1), ('SRT_EPOLL_CONNECT', 4), ('SRT_EPOLL_ENABLE_EMPTY', 1), ('SRT_EPOLL_ENABLE_OUTPUTCHECK', 2), ('SRT_EPOLL_ERR', 8), ('SRT_EPOLL_ET', -2147483648), ('SRT_EPOLL_EVENT', <class 'srt.SRT_EPOLL_EVENT'>), ('SRT_EPOLL_IN', 1), ('SRT_EPOLL_OPT_NONE', 0), ('SRT_EPOLL_OUT', 4), ('SRT_EPOLL_UPDATE', 16), ('SRT_ERDPERM', 4002), ('SRT_ERDVNOSERV', 5007), ('SRT_ERDVUNBOUND', 5008), ('SRT_ERESOURCE', 3000), ('SRT_ERROR', -1), ('SRT_ESCLOSED', 1005), ('SRT_ESECFAIL', 1004), ('SRT_ESOCKFAIL', 1003), ('SRT_ESYSOBJ', 3003), ('SRT_ETHREAD', 3001), ('SRT_ETIMEOUT', 6003), ('SRT_EUNBOUNDSOCK', 5005), ('SRT_EUNKNOWN', -1), ('SRT_EWRPERM', 4004), ('SRT_HAVE_CXX17', 0), ('SRT_INVALID_SOCK', <Swig Object of type 'SRT_EPOLL_T *' at 0x7f348c8ee870>), ('SRT_KM_S_BADSECRET', 4), ('SRT_KM_S_NOSECRET', 3), ('SRT_KM_S_SECURED', 2), ('SRT_KM_S_SECURING', 1), ('SRT_KM_S_UNSECURED', 0), ('SRT_LIVE_DEF_LATENCY_MS', 120), ('SRT_LIVE_DEF_PLSIZE', 1316), ('SRT_LIVE_MAX_PLSIZE', 1456), ('SRT_LOGFA_API_CTRL', 11), ('SRT_LOGFA_API_RECV', 21), ('SRT_LOGFA_API_SEND', 31), ('SRT_LOGFA_APPLOG', 10), ('SRT_LOGFA_BUF_RECV', 22), ('SRT_LOGFA_BUF_SEND', 32), ('SRT_LOGFA_CHN_MGMT', 44), ('SRT_LOGFA_CHN_RECV', 24), ('SRT_LOGFA_CHN_SEND', 34), ('SRT_LOGFA_CONGEST', 7), ('SRT_LOGFA_CONN', 2), ('SRT_LOGFA_EPOLL_API', 46), ('SRT_LOGFA_EPOLL_UPD', 16), ('SRT_LOGFA_GENERAL', 0), ('SRT_LOGFA_GRP_MGMT', 45), ('SRT_LOGFA_GRP_RECV', 25), ('SRT_LOGFA_GRP_SEND', 35), ('SRT_LOGFA_HAICRYPT', 6), ('SRT_LOGFA_INTERNAL', 41), ('SRT_LOGFA_LASTNONE', 63), ('SRT_LOGFA_PFILTER', 8), ('SRT_LOGFA_QUE_CTRL', 13), ('SRT_LOGFA_QUE_MGMT', 43), ('SRT_LOGFA_QUE_RECV', 23), ('SRT_LOGFA_QUE_SEND', 33), ('SRT_LOGFA_RSRC', 5), ('SRT_LOGFA_SOCKMGMT', 1), ('SRT_LOGFA_TSBPD', 4), ('SRT_LOGFA_XTIMER', 3), ('SRT_MSGCTRL', <class 'srt.SRT_MSGCTRL'>), ('SRT_MSGNO_CONTROL', <Swig Object of type 'SRT_EPOLL_T *' at 0x7f348c8ee7b0>), ('SRT_MSGNO_NONE', <Swig Object of type 'SRT_EPOLL_T *' at 0x7f348c8ee8a0>), ('SRT_MSGTTL_INF', -1), ('SRT_REJC_INTERNAL', 0), ('SRT_REJC_PREDEFINED', 1000), ('SRT_REJC_USERDEFINED', 2000), ('SRT_REJ_BACKLOG', 5), ('SRT_REJ_BADSECRET', 10), ('SRT_REJ_CLOSE', 7), ('SRT_REJ_CONGESTION', 13), ('SRT_REJ_E_SIZE', 17), ('SRT_REJ_FILTER', 14), ('SRT_REJ_GROUP', 15), ('SRT_REJ_IPE', 6), ('SRT_REJ_MESSAGEAPI', 12), ('SRT_REJ_PEER', 2), ('SRT_REJ_RDVCOOKIE', 9), ('SRT_REJ_RESOURCE', 3), ('SRT_REJ_ROGUE', 4), ('SRT_REJ_SYSTEM', 1), ('SRT_REJ_TIMEOUT', 16), ('SRT_REJ_UNKNOWN', 0), ('SRT_REJ_UNSECURE', 11), ('SRT_REJ_VERSION', 8), ('SRT_SEQNO_NONE', <Swig Object of type 'SRT_EPOLL_T *' at 0x7f348c8ee8d0>), ('SRT_SUCCESS', 0), ('SRT_SYNC_CLOCK_AMD64_RDTSC', 5), ('SRT_SYNC_CLOCK_GETTIME_MONOTONIC', 1), ('SRT_SYNC_CLOCK_IA32_RDTSC', 6), ('SRT_SYNC_CLOCK_IA64_ITC', 7), ('SRT_SYNC_CLOCK_MACH_ABSTIME', 3), ('SRT_SYNC_CLOCK_POSIX_GETTIMEOFDAY', 4), ('SRT_SYNC_CLOCK_STDCXX_STEADY', 0), ('SRT_SYNC_CLOCK_WINQPC', 2), ('SRT_VERSION_FEAT_HSv5', 66304), ('_SwigNonDynamicMeta', <class 'srt._SwigNonDynamicMeta'>), ('__builtin__', <module 'builtins' (built-in)>), ('__builtins__', {'__name__': 'builtins', '__doc__': "Built-in functions, exceptions, and other objects.\n\nNoteworthy: None is the `nil' object; Ellipsis represents `...' in slices.", '__package__': '', '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': ModuleSpec(name='builtins', loader=<class '_frozen_importlib.BuiltinImporter'>), '__build_class__': <built-in function __build_class__>, '__import__': <built-in function __import__>, 'abs': <built-in function abs>, 'all': <built-in function all>, 'any': <built-in function any>, 'ascii': <built-in function ascii>, 'bin': <built-in function bin>, 'breakpoint': <built-in function breakpoint>, 'callable': <built-in function callable>, 'chr': <built-in function chr>, 'compile': <built-in function compile>, 'delattr': <built-in function delattr>, 'dir': <built-in function dir>, 'divmod': <built-in function divmod>, 'eval': <built-in function eval>, 'exec': <built-in function exec>, 'format': <built-in function format>, 'getattr': <built-in function getattr>, 'globals': <built-in function globals>, 'hasattr': <built-in function hasattr>, 'hash': <built-in function hash>, 'hex': <built-in function hex>, 'id': <built-in function id>, 'input': <built-in function input>, 'isinstance': <built-in function isinstance>, 'issubclass': <built-in function issubclass>, 'iter': <built-in function iter>, 'len': <built-in function len>, 'locals': <built-in function locals>, 'max': <built-in function max>, 'min': <built-in function min>, 'next': <built-in function next>, 'oct': <built-in function oct>, 'ord': <built-in function ord>, 'pow': <built-in function pow>, 'print': <built-in function print>, 'repr': <built-in function repr>, 'round': <built-in function round>, 'setattr': <built-in function setattr>, 'sorted': <built-in function sorted>, 'sum': <built-in function sum>, 'vars': <built-in function vars>, 'None': None, 'Ellipsis': Ellipsis, 'NotImplemented': NotImplemented, 'False': False, 'True': True, 'bool': <class 'bool'>, 'memoryview': <class 'memoryview'>, 'bytearray': <class 'bytearray'>, 'bytes': <class 'bytes'>, 'classmethod': <class 'classmethod'>, 'complex': <class 'complex'>, 'dict': <class 'dict'>, 'enumerate': <class 'enumerate'>, 'filter': <class 'filter'>, 'float': <class 'float'>, 'frozenset': <class 'frozenset'>, 'property': <class 'property'>, 'int': <class 'int'>, 'list': <class 'list'>, 'map': <class 'map'>, 'object': <class 'object'>, 'range': <class 'range'>, 'reversed': <class 'reversed'>, 'set': <class 'set'>, 'slice': <class 'slice'>, 'staticmethod': <class 'staticmethod'>, 'str': <class 'str'>, 'super': <class 'super'>, 'tuple': <class 'tuple'>, 'type': <class 'type'>, 'zip': <class 'zip'>, '__debug__': True, 'BaseException': <class 'BaseException'>, 'Exception': <class 'Exception'>, 'TypeError': <class 'TypeError'>, 'StopAsyncIteration': <class 'StopAsyncIteration'>, 'StopIteration': <class 'StopIteration'>, 'GeneratorExit': <class 'GeneratorExit'>, 'SystemExit': <class 'SystemExit'>, 'KeyboardInterrupt': <class 'KeyboardInterrupt'>, 'ImportError': <class 'ImportError'>, 'ModuleNotFoundError': <class 'ModuleNotFoundError'>, 'OSError': <class 'OSError'>, 'EnvironmentError': <class 'OSError'>, 'IOError': <class 'OSError'>, 'EOFError': <class 'EOFError'>, 'RuntimeError': <class 'RuntimeError'>, 'RecursionError': <class 'RecursionError'>, 'NotImplementedError': <class 'NotImplementedError'>, 'NameError': <class 'NameError'>, 'UnboundLocalError': <class 'UnboundLocalError'>, 'AttributeError': <class 'AttributeError'>, 'SyntaxError': <class 'SyntaxError'>, 'IndentationError': <class 'IndentationError'>, 'TabError': <class 'TabError'>, 'LookupError': <class 'LookupError'>, 'IndexError': <class 'IndexError'>, 'KeyError': <class 'KeyError'>, 'ValueError': <class 'ValueError'>, 'UnicodeError': <class 'UnicodeError'>, 'UnicodeEncodeError': <class 'UnicodeEncodeError'>, 'UnicodeDecodeError': <class 'UnicodeDecodeError'>, 'UnicodeTranslateError': <class 'UnicodeTranslateError'>, 'AssertionError': <class 'AssertionError'>, 'ArithmeticError': <class 'ArithmeticError'>, 'FloatingPointError': <class 'FloatingPointError'>, 'OverflowError': <class 'OverflowError'>, 'ZeroDivisionError': <class 'ZeroDivisionError'>, 'SystemError': <class 'SystemError'>, 'ReferenceError': <class 'ReferenceError'>, 'MemoryError': <class 'MemoryError'>, 'BufferError': <class 'BufferError'>, 'Warning': <class 'Warning'>, 'UserWarning': <class 'UserWarning'>, 'DeprecationWarning': <class 'DeprecationWarning'>, 'PendingDeprecationWarning': <class 'PendingDeprecationWarning'>, 'SyntaxWarning': <class 'SyntaxWarning'>, 'RuntimeWarning': <class 'RuntimeWarning'>, 'FutureWarning': <class 'FutureWarning'>, 'ImportWarning': <class 'ImportWarning'>, 'UnicodeWarning': <class 'UnicodeWarning'>, 'BytesWarning': <class 'BytesWarning'>, 'ResourceWarning': <class 'ResourceWarning'>, 'ConnectionError': <class 'ConnectionError'>, 'BlockingIOError': <class 'BlockingIOError'>, 'BrokenPipeError': <class 'BrokenPipeError'>, 'ChildProcessError': <class 'ChildProcessError'>, 'ConnectionAbortedError': <class 'ConnectionAbortedError'>, 'ConnectionRefusedError': <class 'ConnectionRefusedError'>, 'ConnectionResetError': <class 'ConnectionResetError'>, 'FileExistsError': <class 'FileExistsError'>, 'FileNotFoundError': <class 'FileNotFoundError'>, 'IsADirectoryError': <class 'IsADirectoryError'>, 'NotADirectoryError': <class 'NotADirectoryError'>, 'InterruptedError': <class 'InterruptedError'>, 'PermissionError': <class 'PermissionError'>, 'ProcessLookupError': <class 'ProcessLookupError'>, 'TimeoutError': <class 'TimeoutError'>, 'open': <built-in function open>, 'quit': Use quit() or Ctrl-D (i.e. EOF) to exit, 'exit': Use exit() or Ctrl-D (i.e. EOF) to exit, 'copyright': Copyright (c) 2001-2021 Python Software Foundation.
All Rights Reserved.

Copyright (c) 2000 BeOpen.com.
All Rights Reserved.

Copyright (c) 1995-2001 Corporation for National Research Initiatives.
All Rights Reserved.

Copyright (c) 1991-1995 Stichting Mathematisch Centrum, Amsterdam.
All Rights Reserved., 'credits':     Thanks to CWI, CNRI, BeOpen.com, Zope Corporation and a cast of thousands
    for supporting Python development.  See www.python.org for more information., 'license': Type license() to see the full license text, 'help': Type help() for interactive help, or help(object) for help about object., '_': <class 'module'>}), ('__cached__', '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/yUiiAO2YWQ/__pycache__/srt.cpython-38.pyc'), ('__doc__', None), ('__file__', '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/yUiiAO2YWQ/srt.py'), ('__loader__', <_frozen_importlib_external.SourceFileLoader object at 0x7f348c9f1e50>), ('__name__', 'srt'), ('__package__', ''), ('__spec__', ModuleSpec(name='srt', loader=<_frozen_importlib_external.SourceFileLoader object at 0x7f348c9f1e50>, origin='/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/yUiiAO2YWQ/srt.py')), ('_srt', <module '_srt' from '/home/tgayet/Workspace/Python-binding-for-libsrt/tmp/yUiiAO2YWQ/_srt.so'>), ('_swig_add_metaclass', <function _swig_add_metaclass at 0x7f348ca09ca0>), ('_swig_python_version_info', sys.version_info(major=3, minor=8, micro=10, releaselevel='final', serial=0)), ('_swig_repr', <function _swig_repr at 0x7f348ca09a60>), ('_swig_setattr_nondynamic_class_variable', <function _swig_setattr_nondynamic_class_variable at 0x7f348ca09c10>), ('_swig_setattr_nondynamic_instance_variable', <function _swig_setattr_nondynamic_instance_variable at 0x7f348ca09b80>), ('cvar', <Swig global variables>), ('srt_accept', <function srt_accept at 0x7f348c900430>), ('srt_accept_bond', <function srt_accept_bond at 0x7f348c9004c0>), ('srt_addlogfa', <function srt_addlogfa at 0x7f348c9150d0>), ('srt_bind', <function srt_bind at 0x7f348c9001f0>), ('srt_bind_acquire', <function srt_bind_acquire at 0x7f348c900280>), ('srt_bind_peerof', <function srt_bind_peerof at 0x7f348c900310>), ('srt_bistats', <function srt_bistats at 0x7f348c90f670>), ('srt_bstats', <function srt_bstats at 0x7f348c90f5e0>), ('srt_cleanup', <function srt_cleanup at 0x7f348c900040>), ('srt_clearlasterror', <function srt_clearlasterror at 0x7f348c90f550>), ('srt_clock_type', <function srt_clock_type at 0x7f348c915790>), ('srt_close', <function srt_close at 0x7f348c9008b0>), ('srt_connect', <function srt_connect at 0x7f348c900670>), ('srt_connect_bind', <function srt_connect_bind at 0x7f348c900790>), ('srt_connect_callback', <function srt_connect_callback at 0x7f348c9005e0>), ('srt_connect_debug', <function srt_connect_debug at 0x7f348c900700>), ('srt_connection_time', <function srt_connection_time at 0x7f348c915700>), ('srt_create_socket', <function srt_create_socket at 0x7f348c900160>), ('srt_dellogfa', <function srt_dellogfa at 0x7f348c915160>), ('srt_epoll_add_ssock', <function srt_epoll_add_ssock at 0x7f348c90f940>), ('srt_epoll_add_usock', <function srt_epoll_add_usock at 0x7f348c90f8b0>), ('srt_epoll_clear_usocks', <function srt_epoll_clear_usocks at 0x7f348c90f820>), ('srt_epoll_create', <function srt_epoll_create at 0x7f348c90f790>), ('srt_epoll_release', <function srt_epoll_release at 0x7f348c90ff70>), ('srt_epoll_remove_ssock', <function srt_epoll_remove_ssock at 0x7f348c90fa60>), ('srt_epoll_remove_usock', <function srt_epoll_remove_usock at 0x7f348c90f9d0>), ('srt_epoll_set', <function srt_epoll_set at 0x7f348c90fee0>), ('srt_epoll_update_ssock', <function srt_epoll_update_ssock at 0x7f348c90fb80>), ('srt_epoll_update_usock', <function srt_epoll_update_usock at 0x7f348c90faf0>), ('srt_epoll_uwait', <function srt_epoll_uwait at 0x7f348c90fca0>), ('srt_epoll_wait', <function srt_epoll_wait at 0x7f348c90fc10>), ('srt_getlasterror', <function srt_getlasterror at 0x7f348c90f430>), ('srt_getlasterror_str', <function srt_getlasterror_str at 0x7f348c90f3a0>), ('srt_getpeername', <function srt_getpeername at 0x7f348c900940>), ('srt_getrejectreason', <function srt_getrejectreason at 0x7f348c915430>), ('srt_getsndbuffer', <function srt_getsndbuffer at 0x7f348c9153a0>), ('srt_getsockflag', <function srt_getsockflag at 0x7f348c900b80>), ('srt_getsockname', <function srt_getsockname at 0x7f348c9009d0>), ('srt_getsockopt', <function srt_getsockopt at 0x7f348c900a60>), ('srt_getsockstate', <function srt_getsockstate at 0x7f348c90f700>), ('srt_getversion', <function srt_getversion at 0x7f348c9155e0>), ('srt_listen', <function srt_listen at 0x7f348c9003a0>), ('srt_listen_callback', <function srt_listen_callback at 0x7f348c900550>), ('srt_msgctrl_default', <srt.SRT_MSGCTRL; proxy of <Swig Object of type 'SRT_MsgCtrl_ *' at 0x7f348c8ee960> >), ('srt_msgctrl_init', <function srt_msgctrl_init at 0x7f348c900ca0>), ('srt_recv', <function srt_recv at 0x7f348c90f0d0>), ('srt_recvfile', <function srt_recvfile at 0x7f348c90f310>), ('srt_recvmsg', <function srt_recvmsg at 0x7f348c90f160>), ('srt_recvmsg2', <function srt_recvmsg2 at 0x7f348c90f1f0>), ('srt_rejectreason_msg', <Swig Object of type 'char **' at 0x7f348c8eeab0>), ('srt_rejectreason_str', <function srt_rejectreason_str at 0x7f348c915550>), ('srt_rendezvous', <function srt_rendezvous at 0x7f348c900820>), ('srt_resetlogfa', <function srt_resetlogfa at 0x7f348c9151f0>), ('srt_send', <function srt_send at 0x7f348c900ee0>), ('srt_sendfile', <function srt_sendfile at 0x7f348c90f280>), ('srt_sendmsg', <function srt_sendmsg at 0x7f348c900f70>), ('srt_sendmsg2', <function srt_sendmsg2 at 0x7f348c90f040>), ('srt_setlogflags', <function srt_setlogflags at 0x7f348c915310>), ('srt_setloghandler', <function srt_setloghandler at 0x7f348c915280>), ('srt_setloglevel', <function srt_setloglevel at 0x7f348c915040>), ('srt_setrejectreason', <function srt_setrejectreason at 0x7f348c9154c0>), ('srt_setsockflag', <function srt_setsockflag at 0x7f348c900c10>), ('srt_setsockopt', <function srt_setsockopt at 0x7f348c900af0>), ('srt_socket', <function srt_socket at 0x7f348c9000d0>), ('srt_startup', <function srt_startup at 0x7f348ca09d30>), ('srt_strerror', <function srt_strerror at 0x7f348c90f4c0>), ('srt_time_now', <function srt_time_now at 0x7f348c915670>)]
```

Thank you for your interest in this work and if you ever have any comments or if you observe something problematic please return it by email : Thierry.Gayet@dazzl.tv

Any contribution is encouraged in order to maintain this initiative, but also for its development.

Indeed, this work was carried out within the company Dazzl (https://site.dazzl.tv/fr/) which develops and markets a TV control room in the cloud. It is however made open source so that it can be used by other people and that it can serve as an official reference.