#!/usr/bin/env python3.9
# -*- coding:utf8  -*-

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

import sys
import inspect
import srt

if __name__ == '__main__':
    """
    Main entry of the inpection script
    """    
    print("1. Wrapper information : ")
    print("")
    print(sys.platform)
    print(sys.path)
    print(sys.argv)
    print(sys.executable)
    print(sys.byteorder)
    print(srt.__file__)
    print(srt.__name__)
    print(srt.__dict__)
    print(type(srt))
    print(id(srt))    
    print(dir(srt))
    print(" ")    
    print("-----------------------------------------------------------")
    print(" ")
    print("2. Method listing :")
    print(" ")
    listing = [f for f in dir(srt) if not f.startswith('_')]    
    print(listing)
    print(" ")    
    print("-----------------------------------------------------------")
    print(" ")
    print("3. Class source code :")
    print(" ")
    print(inspect.getsource(srt))
    print(" ")
    print("-----------------------------------")
    print(" ")
    print(inspect.getsourcelines(srt))
    print(" ")    
    print("-----------------------------------------------------------")
    print(" ")
    print("4. Class documentation :")
    print(" ")
    print(inspect.getdoc(srt))
    print(" ")                
    print("-----------------------------------------------------------")
    print(" ")   
    print("5. Get methods prototype by introspection :")
    print(" ")
    print("     - srt_startup" + str(inspect.signature(srt.srt_startup)))
    print("     - srt_socket" + str(inspect.signature(srt.srt_socket)))
    print("     - srt_bind" + str(inspect.signature(srt.srt_bind)))
    print("     - srt_bind_acquire" + str(inspect.signature(srt.srt_bind_acquire)))
    print("     - srt_bind_peerof" + str(inspect.signature(srt.srt_bind_peerof)))
    print("     - srt_listen" + str(inspect.signature(srt.srt_listen)))
    print("     - srt_accept" + str(inspect.signature(srt.srt_accept)))
    print("     - srt_accept_bond" + str(inspect.signature(srt.srt_accept_bond)))
    print("     - srt_listen_callback" + str(inspect.signature(srt.srt_listen_callback)))
    print("     - srt_connect" + str(inspect.signature(srt.srt_connect)))    
    print("     - srt_connect_debug" + str(inspect.signature(srt.srt_connect_debug)))
    print("     - srt_connect_bind" + str(inspect.signature(srt.srt_connect_bind)))
    print("     - srt_rendezvous" + str(inspect.signature(srt.srt_rendezvous)))
    print("     - srt_close" + str(inspect.signature(srt.srt_close)))
    print("     - srt_getpeername" + str(inspect.signature(srt.srt_getpeername)))
    print("     - srt_getsockname" + str(inspect.signature(srt.srt_getsockname)))
    print("     - srt_getsockopt" + str(inspect.signature(srt.srt_getsockopt)))
    print("     - srt_setsockopt" + str(inspect.signature(srt.srt_setsockopt)))
    print("     - srt_getsockflag" + str(inspect.signature(srt.srt_getsockflag)))    
    print("     - srt_setsockflag" + str(inspect.signature(srt.srt_setsockflag)))
    print("     - srt_msgctrl_init" + str(inspect.signature(srt.srt_msgctrl_init)))
    print("     - srt_send" + str(inspect.signature(srt.srt_send)))
    print("     - srt_sendmsg" + str(inspect.signature(srt.srt_sendmsg)))
    print("     - srt_sendmsg2" + str(inspect.signature(srt.srt_sendmsg2)))
    print("     - srt_recv" + str(inspect.signature(srt.srt_recv)))
    print("     - srt_recvmsg" + str(inspect.signature(srt.srt_recvmsg)))
    print("     - srt_recvmsg2" + str(inspect.signature(srt.srt_recvmsg2)))
    print("     - srt_sendfile" + str(inspect.signature(srt.srt_sendfile)))
    print("     - srt_recvfile" + str(inspect.signature(srt.srt_recvfile)))
    print("     - srt_getlasterror_str" + str(inspect.signature(srt.srt_getlasterror_str)))
    print("     - srt_getlasterror" + str(inspect.signature(srt.srt_getlasterror)))
    print("     - srt_strerror" + str(inspect.signature(srt.srt_strerror)))
    print("     - srt_clearlasterror" + str(inspect.signature(srt.srt_clearlasterror)))
    print("     - srt_bstats" + str(inspect.signature(srt.srt_bstats)))
    print("     - srt_bistats" + str(inspect.signature(srt.srt_bistats)))
    print("     - srt_getsockstate" + str(inspect.signature(srt.srt_getsockstate)))
    print("     - srt_epoll_create" + str(inspect.signature(srt.srt_epoll_create)))
    print("     - srt_epoll_clear_usocks" + str(inspect.signature(srt.srt_epoll_clear_usocks)))    
    print("     - srt_epoll_add_usock" + str(inspect.signature(srt.srt_epoll_add_usock)))
    print("     - srt_epoll_add_ssock" + str(inspect.signature(srt.srt_epoll_add_ssock)))
    print("     - srt_epoll_remove_usock" + str(inspect.signature(srt.srt_epoll_remove_usock)))
    print("     - srt_epoll_remove_ssock" + str(inspect.signature(srt.srt_epoll_remove_ssock)))
    print("     - srt_epoll_update_usock" + str(inspect.signature(srt.srt_epoll_update_usock)))
    print("     - srt_epoll_update_ssock" + str(inspect.signature(srt.srt_epoll_update_ssock)))
    print("     - srt_epoll_wait" + str(inspect.signature(srt.srt_epoll_wait)))
    print("     - srt_epoll_uwait" + str(inspect.signature(srt.srt_epoll_uwait)))
    print("     - srt_epoll_set" + str(inspect.signature(srt.srt_epoll_set)))
    print("     - srt_epoll_release" + str(inspect.signature(srt.srt_epoll_release)))
    print("     - srt_setloglevel" + str(inspect.signature(srt.srt_setloglevel)))    
    print("     - srt_addlogfa" + str(inspect.signature(srt.srt_addlogfa)))
    print("     - srt_dellogfa" + str(inspect.signature(srt.srt_dellogfa)))
    print("     - srt_resetlogfa" + str(inspect.signature(srt.srt_resetlogfa)))
    print("     - srt_setloghandler" + str(inspect.signature(srt.srt_setloghandler)))
    print("     - srt_getsndbuffer" + str(inspect.signature(srt.srt_getsndbuffer)))
    print("     - srt_getrejectreason" + str(inspect.signature(srt.srt_getrejectreason)))
    print("     - srt_setrejectreason" + str(inspect.signature(srt.srt_setrejectreason)))
    print("     - srt_rejectreason_str" + str(inspect.signature(srt.srt_rejectreason_str)))
    print("     - srt_getversion" + str(inspect.signature(srt.srt_getversion)))
    print("     - srt_time_now" + str(inspect.signature(srt.srt_time_now)))
    print("     - srt_clock_type" + str(inspect.signature(srt.srt_getversion)))
    
    #for method in listing:
    #    if "srt_" in method: 
    #        method_name = compile("str.method", '<string>', 'exec')
    #        print(method_name)
    #        print("     Method '" + str(method) + "' : ") 
    #        #print(inspect.getsource(method_name))
    #        print(inspect.signature(method_name))    
    #        print(dir(method_name))
    #        print("-----------------------------------")