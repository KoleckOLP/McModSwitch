file = File.open("C:\\Users\\okurz\\AppData\\Roaming\\MC_status.txt")
mc_status = file.read

if ARGV[0] == "-vanilla" || ARGV[0] == "-v"
    if mc_status == "Vanilla"
        puts("You are already on Vanilla")
    else
        puts("the choice was Vanilla")
        system("del \"C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(YogBox).7z\"")
        system("7z a -r C:\\Users\\okurz\\AppData\\Roaming\\.minecraft.7z C:\\Users\\okurz\\AppData\\Roaming\\.minecraft")  # archives currtent mc dir
        File.rename("C:\\Users\\okurz\\AppData\\Roaming\\.minecraft.7z", "C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(YogBox).7z")  # rename the archive version to be YogBox
        system("rmdir /S /Q C:\\Users\\okurz\\AppData\\Roaming\\.minecraft")  # this is potencionally harmful :)
        if File.exist?("C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(Vanilla).7z")
            system("7z x C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(Vanilla).7z")
        else
            puts("there is no backed up version of Vanilla")
        end
    end
    File.open("C:\\Users\\okurz\\AppData\\Roaming\\MC_status.txt", "w") { |f| f.write "Vanilla" }
    system("start C:\\Users\\okurz\\AppData\\Roaming\\Minecraft.lnk")  # shortcuts in Windows are weird
elsif ARGV[0] == "-yogbox" || ARGV[0] == "-y"
    if mc_status == "YogBox"
        puts("You are already on YogBox")
    else
        puts("the choice was YogBox")
        system("del \"C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(Vanilla).7z\"")
        system("7z a -r C:\\Users\\okurz\\AppData\\Roaming\\.minecraft.7z C:\\Users\\okurz\\AppData\\Roaming\\.minecraft")  # archives currtent mc dir
        File.rename("C:\\Users\\okurz\\AppData\\Roaming\\.minecraft.7z", "C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(Vanilla).7z")  # rename the archive version to be Vanilla
        system("rmdir /S /Q C:\\Users\\okurz\\AppData\\Roaming\\.minecraft")  # this is potencionally harmful :)
        if File.exist?("C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(YogBox).7z")
            system("7z x C:\\Users\\okurz\\AppData\\Roaming\\.minecraft(YogBox).7z")
        else
            puts("there is no backed up version of YogBox")
        end
    end
    File.open("MC_status.txt", "w") { |f| f.write "YogBox" }
    system("C:\\Users\\okurz\\AppData\\Roaming\\\\.minecraft\\MinecraftSP.exe")
end
