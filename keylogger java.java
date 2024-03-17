import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;

public class KeyboardListener extends JFrame {
    private JTextField textField = new JTextField();

    public static void main(String[] args) throws AWTException, InterruptedException {
        SwingUtilities.invokeLater(() -> {
            try {
                UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            } catch (Exception e) {}

            KeyboardListener listener = new KeyboardListener();
            listener.setDefaultCloseOperation(EXIT_ON_CLOSE);
            listener.pack();
            listener.setVisible(true);
        });
    }

    public KeyboardListener() throws AWTException {
        add(textField, BorderLayout.NORTH);

        Robot robot = new Robot();

        getContentPane().addKeyListener(new java.awt.event.KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                System.out.println("Key Pressed: " + KeyEvent.getKeyText(e.getKeyCode()));

                // Store the key press event in a text field for demonstration purposes
                if (textField.getText().length() > 50) {
                    textField.setText("");
                }
                textField.append("Key Pressed: " + KeyEvent.getKeyText(e.getKeyCode()) + "\n");
            }
        });

        // To avoid the focus being stolen by another window, set up a mouse listener that gives the keyboard event back to this application
        addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mousePressed(java.awt.event.MouseEvent e) {
                robot.mousePress(e.getButton());
            }

            @Override
            public void mouseReleased(java.awt.event.MouseEvent e) {
                robot.mouseRelease(e.getButton());
            }
        });
    }
}

#This program creates a simple GUI with a text field and uses the Java AWT Robot class to listen for keyboard events. When a key is pressed, it prints out the key name (like "ENTER", "SPACE") and appends it to the text field in the window. Note that this code does not handle all possible keyboard events correctly, but should serve as a basic example of how you could create a simple keylogger in Java.
