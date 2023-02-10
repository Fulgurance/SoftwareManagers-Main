class Target < ISM::Software

    def build
        super
        runCrystalCommand(["build","Main.cr","-o","ism"],buildDirectoryPath)
    end
    
    def prepareInstallation
        super
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/bin")
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share")
        moveFile("#{buildDirectoryPath(false)}ism","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/bin")
        copyDirectory("#{workDirectoryPath(false)}Alpha-06022023","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/ism")
    end

end
