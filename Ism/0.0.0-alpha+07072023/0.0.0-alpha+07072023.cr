class Target < ISM::Software

    def build
        super

        runCrystalCommand(["build","Main.cr","-o","ism"],buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/bin")
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share")
        moveFile("#{buildDirectoryPath(false)}ism","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/bin/ism")
        copyDirectory("#{workDirectoryPath(false)}/Sources","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/ism")
    end

end
