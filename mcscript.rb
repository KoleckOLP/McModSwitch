appdata = ENV["APPDATA"]  # gets the path of the roaming folder

file = File.open("MC_status.txt")
mc_current = file.read  # reads stored status of .minecraft folder

mc_switch = ARGV[0]  # archive to switch to
mc_launcher_location = ARGV[1]  # path to minecraft executable or link

if File.directory?("#{appdata}\\.minecraft")  # if there is a minecraft directory in appdata
    if File.exist?(".minecraft(#{mc_current}).7z")  # if there is already an archive
        system("del \".minecraft(#{mc_current}).7z\"")  # delete it
    end
    system("cd /d #{appdata} && 7z a -r .minecraft.7z .minecraft")  # make a new archive
    system("move #{appdata}\\.minecraft.7z .minecraft(#{mc_current}).7z")  # move & rename the archive
    system("rmdir /S /Q #{appdata}\\.minecraft")  # delete the current .minecraft dir
end

archive = File.exist?(".minecraft(#{mc_switch}).7z")

if archive  # check if there is archive
    system("7z x .minecraft(#{mc_switch}).7z -o\"#{appdata}\"")  # extract the archive to appdata
end

if archive or (!archive && mc_switch == "Vanilla")  # if there is archive or choice was Vanilla
    File.open("MC_status.txt", "w") { |f| f.write mc_switch }  # change status to current
    system("start #{mc_launcher_location}")  # launch game
end
