# fd has {.} but find doesn't, so just use fd.
# This is in two calls because we don't have a way to strip out the first path
# element (nan_TW@latin/kf6 -> ../templates/kf6). It's fine™.
update:
	cd nan_TW && fd -e po -x msgmerge --update '{}' ../../templates/'{.}'.pot
	cd nan_TW@latin && fd -e po -x msgmerge --update '{}' ../../templates/'{.}'.pot
