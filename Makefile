update:
	fd -e po -x msgmerge --update '{}' ../templates/'{.}'.pot ';'
