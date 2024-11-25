default: clean zip manual

clean:
	-rm -f ./*.zip

zip: clean
	zip -r ITR2Lib.zip ./ITR2

test-zip:
	zip -r ITR2-LuaTests.zip ./ITR2-LuaTests

manual:
	-rm -rf .build
	-mkdir -p .build/shared/ITR2
	cp -r ITR2/shared/*.lua .build/shared/ITR2/
	cp -r ./ITR2-LuaTests .build/ITR2-LuaTests
	cd .build && zip -r ../ITR2Lib-manual.zip ./ITR2-LuaTests ./shared
