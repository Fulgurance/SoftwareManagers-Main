class Target < ISM::Software

    def extract
        super
        moveFile("#{workDirectoryPath}/ISM-Alpha-14032023","#{workDirectoryPath}/Alpha-14032023")
    end

    def build
        super
        runCrystalCommand(["build","Main.cr","-o","ism"],buildDirectoryPath)
    end
    
    def prepareInstallation
        super
        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/bin")
        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share")
        moveFile("#{buildDirectoryPath}ism","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/bin/ism")
        copyDirectory("#{workDirectoryPath}/Alpha-14032023","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/ism")
    end

end
