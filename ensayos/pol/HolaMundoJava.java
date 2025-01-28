import java.util.Scanner;

public class HolaMundoJava {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Escribe 'Hola, mundo': ");
        String mensaje = scanner.nextLine();

        System.out.println("Has escrito: " + mensaje);

        scanner.close();
    }
}
