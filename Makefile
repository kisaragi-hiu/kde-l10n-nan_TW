update:
	cd nan_TW && fd -e po -x msgmerge --update '{}' ../../templates/'{.}'.pot
	cd nan_TW@latin && fd -e po -x msgmerge --update '{}' ../../templates/'{.}'.pot
