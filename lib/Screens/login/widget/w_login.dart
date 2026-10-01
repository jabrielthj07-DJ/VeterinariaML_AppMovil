import 'package:flutter/material.dart';
//import 'package:veterinaria_ml_movil/Screens/Inicio/inicio_screem.dart';
import 'package:veterinaria_ml_movil/Screens/principal_Screen/principalScreen.dart';

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
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff154455), Color(0xff22596B)],
                ),
                // alignment: Alignment(0, -1.2),
              ),
            ),

            Container(
              width: double.infinity,
              height: size.height,
              color: const Color.fromARGB(
                255,
                134,
                209,
                247,
              ).withValues(alpha: 0.25),
            ),

            Positioned(
              top: 40,
              left: 20,
              child: Icon(
                Icons.pets_rounded,
                size: 35,
                color: Colors.white.withOpacity(0.08),
              ),
            ),

            Positioned(
              top: 90,
              right: 40,
              child: Transform.rotate(
                angle: 0.5,
                child: Icon(
                  Icons.pets_rounded,
                  size: 60,
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
            ),

            Positioned(
              top: 220,
              left: 15,
              child: Icon(
                Icons.pets_rounded,
                size: 80,
                color: Colors.white.withOpacity(0.05),
              ),
            ),

            Positioned(
              top: 300,
              right: 30,
              child: Transform.rotate(
                angle: -0.6,
                child: Icon(
                  Icons.pets_rounded,
                  size: 45,
                  color: Colors.white.withOpacity(0.07),
                ),
              ),
            ),

            Positioned(
              top: 520,
              left: 25,
              child: Icon(
                Icons.pets_rounded,
                size: 55,
                color: Colors.white.withOpacity(0.05),
              ),
            ),

            Positioned(
              top: 680,
              right: 20,
              child: Icon(
                Icons.pets_rounded,
                size: 70,
                color: Colors.white.withOpacity(0.05),
              ),
            ),

            Positioned(
              bottom: -20,
              left: -20,
              child: Icon(
                Icons.pets_rounded,
                size: 130,
                color: Colors.white.withOpacity(0.18),
              ),
            ),

            Positioned(
              bottom: 80,
              left: 90,
              child: Icon(
                Icons.pets_rounded,
                size: 50,
                color: Colors.white.withOpacity(0.10),
              ),
            ),

            Positioned(
              bottom: 140,
              left: 40,
              child: Icon(
                Icons.pets_rounded,
                size: 30,
                color: Colors.white.withOpacity(0.09),
              ),
            ),

            Positioned(
              bottom: -10,
              right: -20,
              child: Transform.rotate(
                angle: 0.4,
                child: Icon(
                  Icons.pets_rounded,
                  size: 120,
                  color: Colors.white.withOpacity(0.18),
                ),
              ),
            ),

            Positioned(
              bottom: 90,
              right: 80,
              child: Icon(
                Icons.pets_rounded,
                size: 40,
                color: Colors.white.withOpacity(0.10),
              ),
            ),

            Positioned(
              bottom: 230,
              right: 15,
              child: Transform.rotate(
                angle: -0.5,
                child: Icon(
                  Icons.pets_rounded,
                  size: 70,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                const SizedBox(height: 50), // Espacio superior inicial
                Container(
                  width: 160,
                  height: 160,
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
                        ).withValues(alpha: 0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'lib/Screens/login/image/logo_veterinaria.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
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
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 50),
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
                        'Bienvenido',
                        style: TextStyle(
                          // fontSize: size.width * 0.07,
                          fontSize: 18,

                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 17, 22, 25),
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 19, 27, 31),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF4F9FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Color.fromARGB(255, 24, 28, 30),
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF4F9FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
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

                            const String gmailCorrecto = "admin@gmail.com";
                            const String passwordCorrecta = "12345678";

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
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PrincipalScreen(),
                                ),
                                (route) =>
                                    false, // Elimina la pantalla de Login del historial
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
                        ).withValues(alpha: 0.2),
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
                                ).withValues(alpha: 0.5),
                              ),

                              // Huellas
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Veterinaria M&L',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 186, 198, 204),
                            ),
                          ),
                          const Text(
                            'Masatepe, Nicaragua',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 186, 198, 204),
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
                        ).withValues(alpha: 0.2),
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
