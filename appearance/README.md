## Colorschemes, Wallpapers, System Themes, and More

## Wallpapers
Artist: Louis Coyle
	- The Valley
Firewatch/Firewatch Night

## System Themes

### Ubuntu
Gnome Tweak Tool:
	- Applications: Arc-Dark
		- [Arc-dark theme](https://github.com/horst3180/arc-theme)
	- Cursor: DMZ-Black
	- Icons: [Paper](https://snwh.org/paper) ([alternate](https://github.com/snwh/paper-icon-theme))


### Terminal Profile Colors
To load the profile:
`dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < terminal-profile.dconf`

**Background on how to do this**:
[Instructions](https://gist.github.com/reavon/0bbe99150810baa5623e5f601aa93afc)
- To obtain the information about the profile:
`$ dconf dump /org/gnome/terminal/legacy/profiles:/`:
	[:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
	background-color='rgb(45,47,48)'
	background-transparency-percent=4
	bold-color='rgb(232,217,80)'
	bold-color-same-as-fg=false
	font='DejaVu Sans Mono 12'
	foreground-color='rgb(221,223,219)'
	palette=['rgb(46,52,54)', 'rgb(241,58,58)', 'rgb(55,211,33)', 'rgb(196,160,0)', 'rgb(73,142,230)', 'rgb(218,96,250)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(238,72,76)', 'rgb(94,230,49)', 'rgb(252,233,79)', 'rgb(68,155,248)', 'rgb(201,142,195)', 'rgb(52,226,226)', 'rgb(238,238,236)']
	scroll-on-keystroke=false
	scrollback-lines=20000
	use-system-font=false
	use-theme-colors=false
	use-theme-transparency=false
	use-transparent-background=true
	visible-name='Personal'

- Copy the string name in the brackets (including the :)
- Run the following to export ther profile to a file:
`$ dconf dump /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ > terminal-profile.dconf

