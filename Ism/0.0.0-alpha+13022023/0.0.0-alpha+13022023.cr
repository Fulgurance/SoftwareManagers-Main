class Target < ISM::Software

    def extract
        super
        moveFile("#{workDirectoryPath(false)}/ISM-Alpha-13022023","#{workDirectoryPath(false)}/Alpha-13022023")
    end

    def build
        super
        runCrystalCommand(["build","Main.cr","-o","ism"],buildDirectoryPath)
    end
    
    def prepareInstallation
        super
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/bin")
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share")
        moveFile("#{buildDirectoryPath(false)}ism","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/bin/ism")
        copyDirectory("#{workDirectoryPath(false)}/Alpha-13022023","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/ism")
    end

end
