appdata = ENV["APPDATA"]  # gets the path of the roaming folder

file = File.open("#{appdata}\\MC_status.txt")
mc_status = file.read  # read current status of the .mc folder

if ARGV[0] == "-vanilla" || ARGV[0] == "-v"
    if mc_status == "Vanilla"
        puts("You are already on Vanilla")
    else
        puts("the choice was Vanilla")
        system("del \"#{appdata}\\.minecraft(YogBox).7z\"")
        system("7z a -r #{appdata}\\.minecraft.7z #{appdata}\\.minecraft")  # archives current mc dir
        File.rename("#{appdata}\\.minecraft.7z", "#{appdata}\\.minecraft(YogBox).7z")  # rename the archive version to be YogBox
        system("rmdir /S /Q #{appdata}\\.minecraft")  # this is potentially harmful :)
        if File.exist?("#{appdata}\\.minecraft(Vanilla).7z")
            system("7z x #{appdata}\\.minecraft(Vanilla).7z")
        else
            puts("there is no backed up version of Vanilla")
        end
    end
    File.open("#{appdata}\\MC_status.txt", "w") { |f| f.write "Vanilla" }
    system("start #{appdata}\\Minecraft.lnk")  # shortcuts in Windows are weird
elsif ARGV[0] == "-yogbox" || ARGV[0] == "-y"
    if mc_status == "YogBox"
        puts("You are already on YogBox")
    else
        puts("the choice was YogBox")
        system("del \"#{appdata}\\.minecraft(Vanilla).7z\"")
        system("7z a -r #{appdata}\\.minecraft.7z #{appdata}\\.minecraft")  # archives current mc dir
        File.rename("#{appdata}\\.minecraft.7z", "#{appdata}\\.minecraft(Vanilla).7z")  # rename the archive version to be Vanilla
        system("rmdir /S /Q #{appdata}\\.minecraft")  # this is potentially harmful :)
        if File.exist?("#{appdata}\\.minecraft(YogBox).7z")
            system("7z x #{appdata}\\.minecraft(YogBox).7z")
        else
            puts("there is no backed up version of YogBox")
        end
    end
    File.open("MC_status.txt", "w") { |f| f.write "YogBox" }
    system("#{appdata}\\.minecraft\\MinecraftSP.exe")
end
