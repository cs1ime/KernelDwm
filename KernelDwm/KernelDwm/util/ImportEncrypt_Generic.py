_fu='\n'
tb=open("ImportEncrypt_Table.txt","r")
h_head='''#pragma once

#ifndef _FUNCTION_TABLE_INCLUDED_
#define _FUNCTION_TABLE_INCLUDED_

#include "ntifs.h"

namespace FT {
	VOID InitAll();
	class Function {
	private:
		BOOLEAN CantInit;
	public:
		ULONG64 fn;
		ULONG64 key;
		BOOLEAN Inited;
		bool init(LPCSTR _FnName);
		Function();
		
	};
'''
h_mid=_fu+'}'+_fu
h_end=_fu+'#endif // !_FUNCTION_TABLE_INCLUDED_'

cpp_head='''#include "xorstr.hpp"
#include "DDKCommon.h"
#include "KernelAsm.h"
#include "ImportEncrypt.h"

#pragma optimize( "", off )
#pragma clang optimize off

namespace FT {
	bool g_allinited = false;
'''
cpp_mid='''	VOID InitAll() {
		if (g_allinited == false) {
			g_allinited = true;
'''
cpp_end='''
		}
		
	}

	VOID no() {
		return;
	}
	bool Function::init(LPCSTR _FnName) {
		CHAR FnName[260];
		RtlZeroMemory(FnName, sizeof(FnName));
		strncpy(FnName, _FnName, 259);
		this->fn = 0;
		this->key = 0;
		this->CantInit = FALSE;
		this->Inited = FALSE;
		this->key = (AsmRdtsc() * 0xC66BAF1) ^ 0xCDA5B89CDDEAC56A;
		ULONG64 Address = (ULONG64)KGetProcAddress(KGetNtoskrnl(), FnName);
		if (Address) {
			this->fn = ((ULONG64)Address) ^ this->key;
			this->Inited = TRUE;
			RtlZeroMemory(FnName, sizeof(FnName));
			return true;
		}
		this->fn = ((ULONG64)FT::no) ^ this->key;
		this->CantInit = TRUE;
		return false;
	}
	Function::Function() {
		//this->init(_FnName);
	}
}


#pragma optimize( "", on )
#pragma clang optimize on'''

_extern_list=''
_define_list=''
_undef_list=''
_redef_list=''
_ft_def_list=''
_init_line_list=''



for s in tb:
    s=s.strip()
    print(s)
    _extern='extern FT::Function fn'+s+';'
    _define='#define FT_'+s+' ((decltype('+s+')*)(FT::fn'+s+'.fn ^ FT::fn'+s+'.key))'
    _undef='#undef '+s
    _redef='#define '+s+' FT_'+s
    _ft_def='FT::Function fn'+s+';'
    _init_line='fn'+s+'.init(xs("'+s+'"));'
    
    _extern_list+='        '+_extern+_fu
    _define_list+=_define+_fu
    _undef_list+=_undef+_fu
    _redef_list+=_redef+_fu
    _ft_def_list+='        '+_ft_def+_fu
    _init_line_list+='                '+_init_line+_fu
    
tb.close()

h_content=h_head+_extern_list+h_mid+_define_list+_fu+_undef_list+_fu+_redef_list+_fu+h_end
print(h_content)
cpp_content=cpp_head+_ft_def_list+_fu+cpp_mid+_init_line_list+_fu+cpp_end
print(cpp_content)

h_fp=open("ImportEncrypt.h","w+");
h_fp.write(h_content)
h_fp.close()

cpp_fp=open("ImportEncrypt.cpp","w+");
cpp_fp.write(cpp_content)
cpp_fp.close()
