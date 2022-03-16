#!/usr/bin/env bash

# Color files
FILE="$XDG_CONFIG_HOME/R/themes/pywal.tmTheme"

# Change colors
change_color() {

    # create theme
	cat > $FILE <<- EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist>
<!-- Based on Pywal colors -->
<plist version="1.0">
<dict>
	<key>name</key>
	<string>pywal</string>
	<key>settings</key>
	<array>
		<dict>
			<key>settings</key>
			<dict>
				<key>background</key>
				<string>${bg}</string>
				<key>caret</key>
				<string>${fg}</string>
				<key>foreground</key>
				<string>${fg}</string>
				<key>invisibles</key>
				<string>${c7p}</string>
				<key>lineHighlight</key>
				<string>${c7p}</string>
				<key>selection</key>
				<string>${c2p}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Comment</string>
			<key>scope</key>
			<string>comment</string>
			<key>settings</key>
			<dict>
				<key>foreground</key>
				<string>${c1}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>String</string>
			<key>scope</key>
			<string>string</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string>italic</string>
				<key>foreground</key>
				<string>${c5}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Number</string>
			<key>scope</key>
			<string>constant.numeric</string>
			<key>settings</key>
			<dict>
				<key>foreground</key>
				<string>${c5}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Built-in constant</string>
			<key>scope</key>
			<string>constant.language</string>
			<key>settings</key>
			<dict>
				<key>foreground</key>
				<string>${c5}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>User-defined constant</string>
			<key>scope</key>
			<string>constant.character, constant.other</string>
			<key>settings</key>
			<dict>
				<key>foreground</key>
				<string>${c5}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Variable</string>
			<key>scope</key>
			<string>variable</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string></string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Keyword</string>
			<key>scope</key>
			<string>keyword</string>
			<key>settings</key>
			<dict>
				<key>foreground</key>
				<string>${c3}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Storage</string>
			<key>scope</key>
			<string>storage</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string></string>
				<key>foreground</key>
				<string>${c3}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Storage type</string>
			<key>scope</key>
			<string>storage.type</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string>italic</string>
				<key>foreground</key>
				<string>${c6}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Class name</string>
			<key>scope</key>
			<string>entity.name.class</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string>underline</string>
				<key>foreground</key>
				<string>${c4}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Inherited class</string>
			<key>scope</key>
			<string>entity.other.inherited-class</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string>italic underline</string>
				<key>foreground</key>
				<string>${c4}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Function name</string>
			<key>scope</key>
			<string>entity.name.function</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string></string>
				<key>foreground</key>
				<string>${c4}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Function argument</string>
			<key>scope</key>
			<string>variable.parameter</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string>italic</string>
				<key>foreground</key>
				<string>${c7}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Tag name</string>
			<key>scope</key>
			<string>entity.name.tag</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string></string>
				<key>foreground</key>
				<string>${c3}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Tag attribute</string>
			<key>scope</key>
			<string>entity.other.attribute-name</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string></string>
				<key>foreground</key>
				<string>${c4}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Library function</string>
			<key>scope</key>
			<string>support.function</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string></string>
				<key>foreground</key>
				<string>${c6}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Library constant</string>
			<key>scope</key>
			<string>support.constant</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string></string>
				<key>foreground</key>
				<string>${c6}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Library class&#x2f;type</string>
			<key>scope</key>
			<string>support.type, support.class</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string>italic</string>
				<key>foreground</key>
				<string>${c6}</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Library variable</string>
			<key>scope</key>
			<string>support.other.variable</string>
			<key>settings</key>
			<dict>
				<key>fontStyle</key>
				<string>italic</string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Invalid</string>
			<key>scope</key>
			<string>invalid</string>
			<key>settings</key>
			<dict>
				<key>background</key>
				<string>${c5p}</string>
				<key>fontStyle</key>
				<string></string>
				<key>foreground</key>
				<string></string>
			</dict>
		</dict>
		<dict>
			<key>name</key>
			<string>Invalid deprecated</string>
			<key>scope</key>
			<string>invalid.deprecated</string>
			<key>settings</key>
			<dict>
				<key>background</key>
				<string>${c6p}</string>
				<key>foreground</key>
				<string>#F8F8F0</string>
			</dict>
		</dict>
	</array>
	<key>uuid</key>
	<string>91b7b2d8-bae2-4912-af10-b2c363003459</string>
	<key>colorSpaceName</key>
	<string>sRGB</string>
</dict>
</plist>
	EOF
}


# Main
if [[ -f "/usr/bin/wal" ]]; then
	if [[ -f "$XDG_CACHE_HOME/wal/colors.sh" ]]; then

		# Source the pywal color file
		. "$XDG_CACHE_HOME/wal/colors.sh"

        bg="$background"
        fg="$foreground"
        c0p="{$color0}63"
        c1="$color1"
        c2="$color2"
        c2p="${color2}63"
        c3="$color3"
        c4="$color4"
        c5="$color5"
        c5p="${color5}63"
        c6="$color6"
        c6p="${color6}63"
        c7="$color7"
        c7p="${color7}63"


		change_color
	else
		echo -e "[!] Create pywal colors. \n"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
