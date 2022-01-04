


## dmg-file for MAC OSX

opusMT.app:
	hdiutil create tmp.dmg -ov -volname "opusMT" -fs HFS+ -srcfolder ../build/opusMT.app
	hdiutil convert tmp.dmg -format UDZO -o opusMT.dmg
	rm -f tmp.dmg
