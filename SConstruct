import os
from Eiffel import files

EnsurePythonVersion(2, 4)
EnsureSConsVersion(0, 96, 92)

env = Environment(ENV = os.environ, tools = ['Eiffel'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'macintosh'

install_path = '../oe_distrib/' + platform + '/'

def install(dir, source):
	Alias('install', Install(install_path + dir, source))

def eiffel(target, ecf):
	if platform == 'macintosh': target = [target, target + '_no_precompile']
	result = env.Eiffel(target, [ecf])
	Default(Alias(Split(target)[0], result))
	return result

target = eiffel('adl_workbench', 'apps/adl_workbench/app/adl_workbench.ecf')
eiffel('openehr_test',     'libraries/openehr/test/app/openehr_test.ecf')
eiffel('adl_parser_test',  'components/adl_parser/test/app/adl_parser_test.ecf')
eiffel('common_libs_test', 'libraries/common_libs/test/app/common_libs_test.ecf')

icons = 'apps/adl_workbench/app/icons'
news = 'apps/adl_workbench/app/news.txt'
vim = files('apps/adl_workbench/etc/vim/*')

if platform == 'windows':
	if len(target) > 2 and env.Detect('devenv'):
		dir = 'apps/adl_workbench/install/windows/ADL_Workbench/'

		sources = [
			dir + 'ADL_Workbench.sln',
			dir + 'ADL_Workbench.vdproj',
			target[2],
			news
		] + vim

		for source, dirnames, filenames in os.walk(icons):
			if '.svn' in dirnames: dirnames.remove('.svn')
			sources += files(source + '/*')

		msi = env.Command(dir + 'Release/ADL_Workbench.msi', sources, 'devenv $SOURCE /build Release')
		install('tools', msi)

	target = eiffel('adl_dotnet_lib.dll', 'components/adl_parser/lib/dotnet_dll/adl_dotnet_lib.ecf')

	if len(target) > 2:
		install('adl_parser/lib', [target[2], os.path.dirname(str(target[2])) + '/libadl_dotnet_lib.dll'])

if platform == 'macintosh':
	packagemaker = '/Developer/Tools/packagemaker'

	if len(target) > 2 and os.path.exists(packagemaker):
		dir = 'apps/adl_workbench/install/macintosh/'
		root = dir + 'ADL_Workbench/'
		bin = root + 'ADL Workbench.app/Contents/Resources/bin/'
		resources = dir + 'English.lproj/'
		info = dir + 'Info.plist'
		description = dir + 'Description.plist'

		sources = [info, description]
		sources += Install(bin, target[2])
		sources += Install(bin, news)
		sources += Install(root + 'vim', vim)
		sources += InstallAs(resources + 'Welcome.txt', news)

		for source, dirnames, filenames in os.walk(icons):
			if '.svn' in dirnames: dirnames.remove('.svn')
			subdir = os.path.basename(source)
			if subdir == 'icons': subdir = ''
			sources += Install(bin + 'icons/' + subdir, files(source + '/*'))

		for source, dirnames, filenames in os.walk(root + 'ADL Workbench.app'):
			if '.svn' in dirnames: dirnames.remove('.svn')
			if 'bin' in dirnames: dirnames.remove('bin')
			sources += files(source + '/*')

		for html, txt in [
			[resources + 'ReadMe.html', 'apps/doc/README-adl_workbench.txt'],
			[resources + 'License.html', 'apps/doc/LICENSE.txt']
		]:
			substitutions = '2s|^.+$|<h2>&</h2>|;s|^[A-Z].+$|<h3>&</h3>|;s|^$|<br><br>|;s|^-+$||'
			sources += env.Command(html, txt, 'sed -E \'' + substitutions + '\' $SOURCE > $TARGET')

		command = [
			packagemaker, '-build',
			'-p', '${TARGET.dir.dir}',
			'-f', root,
			'-r', resources,
			'-i', info,
			'-d', description
		]

		pkg = env.Command(install_path + 'tools/ADL Workbench.pkg/Contents/Archive.pax.gz', sources, [command])
		Alias('install', pkg)
