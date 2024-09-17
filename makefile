default: itr2

itr2:
	-mkdir -p ITR2/shared/
	-cp -r ITR2.lua ITR2/shared/
	7z a ITR2Lib.zip ITR2
	-rm -r ITR2

itr1:
	-mkdir -p ITR1/shared/
	-cp -r ITR1.lua ITR1/shared/
	7z a ITR1Lib.zip ITR1/shared/ITR1.lua
	-rm -r ITR1
