cask 'blockblock' do
  if MacOS.version <= :mojave
    version '0.9.9.4'
    sha256 '6ab3a8224e8bc77b9abe8d41492c161454c6b0266e60e61b06931fed4b431282'

    # bitbucket.org/objective-see/ was verified as official when first introduced to the cask
    url "https://bitbucket.org/objective-see/deploy/downloads/BlockBlock_#{version}.zip"

    installer script: {
                        executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock",
                        args:       ['-install'],
                        sudo:       true,
                      }

    uninstall script: {
                        executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock",
                        args:       ['-uninstall'],
                        sudo:       true,
                      }
  else
    version '1.0.1'
    sha256 '7e5c459ce033eda44a6e5e2e57ec503ad07d96b6272d0ee7c3bbfb6a04d03ce4'

    # bitbucket.org/objective-see/ was verified as official when first introduced to the cask
    url "https://bitbucket.org/objective-see/deploy/downloads/BlockBlock_#{version}.zip"

    installer script: {
                        executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock Installer",
                        args:       ['-install'],
                        sudo:       true,
                      }

    uninstall script: {
                        executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock Installer",
                        args:       ['-uninstall'],
                        sudo:       true,
                      }
  end

  appcast 'https://objective-see.com/products/changelogs/BlockBlock.txt'
  name 'BlockBlock'
  homepage 'https://objective-see.com/products/blockblock.html'

  zap trash: '~/Library/Preferences/com.objectiveSee.BlockBlock.plist'
end
