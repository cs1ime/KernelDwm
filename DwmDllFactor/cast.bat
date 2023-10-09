del DwmDll.dll /q
del dwm_dlldata.h /q
copy DwmDll\Release\DwmDll.dll DwmDll.dll 
python convert_chdr.py
