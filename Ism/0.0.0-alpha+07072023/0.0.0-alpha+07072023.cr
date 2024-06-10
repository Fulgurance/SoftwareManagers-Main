class Target < ISM::Software

    def build
        super

        runCrystalCommand(["build","Main.cr","-o","ism"],buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/bin")
        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share")
        moveFile("#{buildDirectoryPath}ism","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/bin/ism")
        copyDirectory("#{workDirectoryPath}/Sources","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/ism")
    end

end
