import os, shutil, re, subprocess
from Eiffel import files

EnsurePythonVersion(2, 4)
EnsureSConsVersion(0, 97, 0)

env = Environment(ENV = os.environ, tools = ['Eiffel'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'mac_osx'

# Define how to build the parser classes.

def gelex(target, source):
	return env.Command(target, source, [['gelex', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

def geyacc(target, source):
	return env.Command(target, source, [['geyacc', '--new_typing', '-v', '${TARGET.filebase}.txt', '-t', '${TARGETS[1].filebase}', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

def geyacc_html(target, source):
	return env.Command(target, source, [['geyacc', '--doc=html', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

if not env.Detect('gelex') or not env.Detect('geyacc'):
	print 'WARNING! The Gobo tools are missing from your path: cannot build the parsers.'
else:
	for scanner, parser, tokens, dir in [
		['adl_scanner', 'adl_validator', 'adl_tokens', 'components/adl_parser/src/syntax/adl/parser/'],
		['cadl_scanner', 'cadl_validator', 'cadl_tokens', 'components/adl_parser/src/syntax/cadl/parser/'],
		['dadl_scanner', 'dadl2_validator', 'dadl_tokens', 'libraries/common_libs/src/structures/syntax/dadl/parser/'],
		['units_scanner', 'units_parser', 'units_tokens', 'libraries/common_libs/src/unit_parser/parser/']
	]:
		gelex(dir + scanner + '.e', dir + scanner + '.l')
		geyacc([dir + parser + '.e', dir + tokens + '.e'], dir + parser + '.y')
		geyacc_html(dir + parser + '.html', dir + parser + '.y')

# Define how to build the Eiffel projects.

def eiffel(target, ecf, ectarget = None):
	if ectarget == None: ectarget = target
	if platform == 'mac_osx': ectarget += '_no_precompile'
	result = env.Eiffel(target, [ecf], ECTARGET = ectarget)
	Alias(target, result)
	return result

adl_workbench = eiffel('adl_workbench', 'apps/adl_workbench/app/adl_workbench.ecf')
versioned_targets = [adl_workbench]

eiffel('openehr_test',     'libraries/openehr/test/app/openehr_test.ecf')
eiffel('adl_parser_test',  'components/adl_parser/test/app/adl_parser_test.ecf')
eiffel('common_libs_test', 'libraries/common_libs/test/app/common_libs_test.ecf')

if platform == 'windows':
	adl_parser = eiffel('OceanInformatics.AdlParser.dll', 'components/adl_parser/lib/dotnet_dll/adl_parser.ecf', 'adl_parser')
	versioned_targets += [adl_parser]

# Define how to put installers, etc., into the distribution directory.

distrib = None
installer = None

for target in COMMAND_LINE_TARGETS:
	s = os.path.normpath(target)

	while distrib == None and s != os.path.dirname(s):
		if os.path.basename(s) == 'oe_distrib':
			distrib = s + '/' + platform
		else:
			s = os.path.dirname(s)

if distrib:
	news = 'apps/adl_workbench/app/news.txt'
	icons = 'apps/adl_workbench/app/icons'
	vim = 'apps/adl_workbench/etc/vim'
	install = 'apps/adl_workbench/install/' + platform

	adl_workbench_installer_sources = [adl_workbench[2], news]

	for dir in [icons, vim, install]:
		for source, dirnames, filenames in os.walk(dir):
			if '.svn' in dirnames: dirnames.remove('.svn')
			adl_workbench_installer_sources += files(source + '/*')

	if platform == 'windows':
		if len(adl_workbench) > 2:
			if not env.Detect('makensis'):
				print 'WARNING! NSIS is missing from your path: cannot build installer for ADL Workbench.'
			else:
				command = [
					'makensis', '-V1',
					'-XOutFile ${TARGET.abspath}',
					install + '/ADL_Workbench/ADLWorkbenchInstall.nsi'
				]

				installer = env.Command(distrib + '/tools/OceanADLWorkbenchInstall.exe', adl_workbench_installer_sources, [command])
				versioned_targets += [installer]

		if len(adl_parser) > 2:
			unmanaged_dll = os.path.dirname(str(adl_parser[2])) + '/lib' + os.path.basename(str(adl_parser[2]))
			SideEffect(unmanaged_dll, adl_parser[2])
			Install(distrib + '/adl_parser/dotnet', [adl_parser[2], unmanaged_dll])

	if platform == 'mac_osx':
		if len(adl_workbench) > 2:
			packagemaker = '/Developer/usr/bin/packagemaker'
			if not os.path.exists(packagemaker): packagemaker = '/Developer/Tools/packagemaker'

			if not os.path.exists(packagemaker):
				print 'WARNING! ' + packagemaker + ' is missing: cannot build installer for ADL Workbench.'
			else:
				pkg_work = distrib + '/' + platform
				pkg_root = pkg_work + '/ADL_Workbench'
				pkg_resources = pkg_work + '/English.lproj'

				def copy_tree(src, dir):
					name = os.path.basename(src)

					if not name.startswith('.'):
						dst = os.path.join(dir, name)

						if os.path.isfile(src):
							shutil.copy2(src, dst)
						else:
							os.mkdir(dst)
							for name in os.listdir(src): copy_tree(os.path.join(src, name), dst)

				def copy_installer_sources(target, source, env):
					copy_tree(install, distrib)
					copy_tree(vim, pkg_root)

					for src in [str(adl_workbench[2]), news, icons]:
						copy_tree(src, pkg_root + '/ADL Workbench.app/Contents/Resources/')

					shutil.copy2(news, pkg_resources + '/Welcome.txt')

					for html, txt in [['ReadMe.html', 'README-adl_workbench.txt'], ['License.html', 'LICENSE.txt']]:
						substitutions = 's|\&|\&amp;|;'
						substitutions += 's|\<|\&lt;|;'
						substitutions += 's|\>|\&gt;|;'
						substitutions += '2s|^.+$|<h2>&</h2>|;'
						substitutions += 's|^[A-Z].+$|<h3>&</h3>|;'
						substitutions += 's|^$|<br><br>|;'
						substitutions += 's|^-+$||'
						f = open(pkg_resources + '/' + html, 'w')
						f.write(os.popen('sed -E \'' + substitutions + '\' apps/doc/' + txt).read())
						f.close()

				pkg_name = ''
				match = re.match(r'\d+', os.popen('uname -r').read())

				if match:
					pkg_name = match.group()
					if pkg_name == '8': pkg_name = 'for Tiger '
					if pkg_name == '9': pkg_name = 'for Leopard '

				pkg_name = 'ADL Workbench ' + pkg_name + os.popen('uname -p').read().strip()
				pkg_path = pkg_work + '/' + pkg_name + '.pkg'

				command = [
					packagemaker, '-build',
					'-p', pkg_path,
					'-f', pkg_root,
					'-r', pkg_resources,
					'-i', pkg_work + '/Info.plist',
					'-d', pkg_work + '/Description.plist'
				]

				installer = env.Command(distrib + '/tools/' + pkg_name + '.dmg', adl_workbench_installer_sources + files('apps/doc/*.txt'), [
					Delete(pkg_work),
					env.Action(copy_installer_sources, 'Copying installer files to ' + pkg_work),
					command,
					Delete(pkg_root),
					['hdiutil', 'create', '-srcfolder', pkg_path, '$TARGET']
					])

				versioned_targets += [installer]

	# Set the Subversion revision number as the final part of the file version string.

	if not env.Detect('svnversion'):
		print 'WARNING! The svnversion command is missing from your path: cannot set the revision part of the version number.'
	else:
		match = re.match(r'\d+', os.popen('svnversion .').read())

		if match:
			revision = match.group()

			def backup_filename(filename):
				split = os.path.split(filename)
				return os.path.join(split[0], '.' + split[1] + '.bak')

			def set_revision_from_subversion(target, source, env):
				global backed_up_files
				backed_up_files = []
				substitutions = [['libraries/version/openehr_version.e', r'\b(revision:\s*INTEGER\s*=\s*)\d+']]

				if platform == 'windows':
					if target == adl_workbench:
						substitutions += [['apps/adl_workbench/app/adl_workbench.rc', r'(#define\s+VER_\S+\s+"?\d+[,.]\d+[,.]\d+[,.])\d+']]

					if target == adl_parser:
						substitutions += [['components/adl_parser/lib/dotnet_dll/adl_parser.ecf', r'(<version\s+major="\d+"\s+minor="\d+"\s+release="\d+"\s+build=")\d+']]
					if target == installer:
						substitutions = [[install + '/ADL_Workbench/ADLWorkbenchInstall.nsi', r'(VIProductVersion\s+\d+\.\d+\.\d+\.)\d+']]

				if platform == 'mac_osx' and target == installer:
					pattern = r'(<string>\d+\.\d+\.\d+\.)\d+'
					substitutions = [
						[install + '/Info.plist', pattern],
						[install + '/ADL_Workbench/ADL Workbench.app/Contents/Info.plist', pattern]
						]

				for filename, pattern in substitutions:
					f = open(filename, 'r')
					try: s = f.read()
					finally: f.close()

					if s:
						s = re.sub(pattern, r'\g<1>' + revision, s)
						bak = backup_filename(filename)
						if os.path.exists(filename) and not os.path.exists(bak): os.rename(filename, bak)
						backed_up_files.append(filename)
						f = open(filename, 'w')
						try: f.write(s)
						finally: f.close()

			def restore_backed_up_files(target, source, env):
				global backed_up_files

				for filename in backed_up_files:
					bak = backup_filename(filename)

					if os.path.exists(bak):
						if os.path.exists(filename): os.remove(filename)
						os.rename(bak, filename)

			env.AddPreAction(versioned_targets, env.Action(set_revision_from_subversion, 'Setting revision ' + revision + ' ...'))
			env.AddPostAction(versioned_targets, env.Action(restore_backed_up_files, None))
