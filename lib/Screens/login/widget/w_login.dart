import 'package:flutter/material.dart';

// Definimos la pantalla estrictamente como StatelessWidget
class loginScreen extends StatelessWidget {
  loginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F6), // Color de fondo claro y limpio
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_veterinaria.jpg.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment(0, -1.2),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: size.height,
              color: const Color.fromARGB(255, 134, 209, 247).withOpacity(0.25),
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                const SizedBox(height: 50), // Espacio superior inicial
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          255,
                          6,
                          136,
                          169,
                        ).withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/logo_veterinaria.png.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Respaldo visual si la ruta falla
                        return const Icon(
                          Icons.pets,
                          color: Colors.green,
                          size: 80,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Column(
                  children: [
                    const Text(
                      'Cuidamos a quienes \n te dan felicidad',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 30, 21, 17),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 186, 198, 204),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: size.width * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Correo electrónico',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 10),

                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock_clock_outlined),
                          suffixIcon: Icon(Icons.visibility_off_outlined),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            String email = _emailController.text.trim();
                            String password = _passwordController.text;

                            const String gmailCorrecto = "ingehernan@gmail.com";
                            const String passwordCorrecta = "jon130806";

                            if (email == gmailCorrecto &&
                                password == passwordCorrecta) {
                              print('¡Acceso concedido!');

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('¡Inicio de sesión correcto!'),
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    14,
                                    175,
                                    177,
                                  ),
                                ),
                              );
                            } else {
                              print('Datos incorrectos');

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Correo o contraseña incorrectos. Inténtalo de nuevo.',
                                  ),
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    3,
                                    97,
                                    137,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              134,
                              209,
                              247,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.pets,
                        color: const Color.fromARGB(
                          255,
                          2,
                          168,
                          193,
                        ).withOpacity(0.2),
                        size: 40,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 1,
                                color: const Color.fromARGB(
                                  255,
                                  8,
                                  196,
                                  224,
                                ).withOpacity(0.5),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.pets,
                                  color: Color.fromARGB(255, 11, 158, 211),
                                  size: 14,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 1,
                                color: const Color.fromARGB(
                                  255,
                                  8,
                                  211,
                                  225,
                                ).withOpacity(0.5),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Veterinaria M&L',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const Text(
                            'Masatepe, Nicaragua',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.pets,
                        color: const Color.fromARGB(
                          255,
                          7,
                          161,
                          218,
                        ).withOpacity(0.2),
                        size: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
