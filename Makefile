
default: clean zip manual

clean:
	-rm ./*.zip
	
zip: clean
	7z a ITR2Lib.zip ./ITR2
	
test-zip:
	7z a TestingMod.zip ./TestingMod

manual:
	-rm -rf .build
	-mkdir -p .build/shared/ITR2
	cp -r ITR2/shared/*.lua .build/shared/ITR2/
	cp -r ./TestingMod .build/TestingMod
	cd .build && 7z a ../ITR2Lib-manual.zip ./ITR2Test ./shared

gitpod-setup:
	sudo apt update
	sudo apt install p7zip-full