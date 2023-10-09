fp=open("DwmDll.dll","rb")
dat=fp.read()
fp.close()

mcode='''namespace dwm_dlldata {
	unsigned char dll[] =  {'''
    
    
hex_list = ["0x{:02X}".format(b) for b in dat]
hex_code = ', '.join(hex_list)

mcode+=hex_code

mcode+='''};
}'''

with open("dwm_dlldata.h","w+") as fp:
    fp.write(mcode)
