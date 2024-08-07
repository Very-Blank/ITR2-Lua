
mod:
	-mkdir -p LuaMods/shared/ITR2
	-cp -r ITR2.lua LuaMods/shared/ITR2
	7z a ITR2Lib.zip LuaMods/shared/ITR2/ITR2.lua
	-rm -r LuaMods