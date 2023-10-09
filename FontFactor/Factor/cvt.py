
fp=open("1.hjf","rb")
dat=fp.read()
fp.close()

filedata='''#ifndef _FONT_DATA_H_
#define _FONT_DATA_H_
namespace fontdata{
	unsigned char data[] = {'''

hex_list = ["0x{:02X}".format(b) for b in dat]
hex_code = ', '.join(hex_list)

# idx=0    
# for v in dat:
#     if idx!=0:
#         filedata+=','
#     filedata+=hex(v)
#     idx+=1
filedata += hex_code
filedata+='''};

	
}

#endif'''

with open("fontdata.h","w+") as fp:
    fp.write(filedata)
