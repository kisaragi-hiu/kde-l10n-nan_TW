.ONESHELL:

# fd has {.} but find doesn't, so just use fd.
# This is in two calls because we don't have a way to strip out the first path
# element (nan_TW@latin/kf6 -> ../templates/kf6). It's fine™.
update:
	(cd nan_TW && fd -e po -x msgmerge --update '{}' ../../templates/'{.}'.pot)
	(cd nan_TW@latin && fd -e po -x msgmerge --update '{}' ../../templates/'{.}'.pot)

install:
	mkdir -p ~/.local/share/locale/nan_TW/LC_MESSAGES/
	mkdir -p ~/.local/share/locale/nan_TW@latin/LC_MESSAGES/
	(cd nan_TW && fd -e po -x msgfmt '{}' -o ~/.local/share/locale/nan_TW/LC_MESSAGES/'{/.}'.mo)
	(cd nan_TW@latin && fd -e po -x msgfmt '{}' -o ~/.local/share/locale/nan_TW@latin/LC_MESSAGES/'{/.}'.mo)

fix-plurals:
	find . -path '*.po' -execdir sed -i s/'"Plural-Forms: nplurals=2; plural=n != 1;\\n"'/'"Plural-Forms: nplurals=1; plural=0;\\n"'/ '{}' ';'

sync-glossaries:
	@true # silence echoing command for this target
	# find the newer glossary. %T@ means "mtime as unix time", %P means file path
	# sort -n for numeric sort, and -r to put the larger value on top (= newer)
	# head -1 to keep just the first one
	newer=$$(find . -name 'terms.tbx' -printf '%T@ %P\n' | env LC_ALL=C sort -nr | head -1 | cut -d' ' -f2)
	# if the newer file is @latin, copy it over with @latin removed
	if $$(echo $$newer | grep -q latin); then
		older=nan_TW/terms.tbx
		echo copying $$newer to $$older...
		sed s/'xml:lang="nan-TW@latin"'/'xml:lang="nan-TW"'/ nan_TW@latin/terms.tbx > nan_TW/terms.tbx
	# otherwise copy the non-latin version over with @latin added
	else
		older=nan_TW@latin/terms.tbx
		echo copying $$newer to $$older...
		sed s/'xml:lang="nan-TW"'/'xml:lang="nan-TW@latin"'/ nan_TW/terms.tbx > nan_TW@latin/terms.tbx
	fi
