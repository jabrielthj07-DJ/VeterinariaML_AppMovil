import 'package:flutter/material.dart';

import '../../../Core/team_data.dart';

class WConfi extends StatefulWidget {
  const WConfi({super.key});

  @override
  State<WConfi> createState() => _WConfiState();
}

class _WConfiState extends State<WConfi> {
  bool notificaciones = true;

  String nombreTema(ThemeMode tema) {
    switch (tema) {
      case ThemeMode.light:
        return 'Claro';

      case ThemeMode.dark:
        return 'Oscuro';

      case ThemeMode.system:
        return 'Sistema';
    }
  }

  void seleccionarTema() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Modo de tema'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: const Text('Claro'),
                value: ThemeMode.light,
                groupValue: TemaApp.tema.value,
                onChanged: (valor) {
                  TemaApp.tema.value = valor!;
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Oscuro'),
                value: ThemeMode.dark,
                groupValue: TemaApp.tema.value,
                onChanged: (valor) {
                  TemaApp.tema.value = valor!;
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Sistema'),
                value: ThemeMode.system,
                groupValue: TemaApp.tema.value,
                onChanged: (valor) {
                  TemaApp.tema.value = valor!;
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Apariencia',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        ListTile(
          leading: const Icon(Icons.dark_mode_outlined),
          title: const Text('Modo de tema'),
          subtitle: Text(nombreTema(TemaApp.tema.value)),
          trailing: const Icon(Icons.chevron_right),
          onTap: seleccionarTema,
        ),

        const Divider(),

        const Text(
          'Notificaciones',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notificaciones'),
          trailing: Switch(
            value: notificaciones,
            onChanged: (valor) {
              setState(() {
                notificaciones = valor;
              });
            },
          ),
        ),

        const Divider(),

        const Text(
          'Preferencias',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        ListTile(
          leading: const Icon(Icons.language_outlined),
          title: const Text('Idioma'),
          subtitle: const Text('Español'),
          trailing: const Icon(Icons.chevron_right),
        ),

        const Divider(),

        const Text(
          'Información',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Acerca de la aplicación'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Acerca de la aplicación'),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Veterinaria M&L',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Versión 1.0.0'),
                      SizedBox(height: 10),
                      Text('Aplicación móvil administrativa'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LicensePage(
                              applicationName: 'Veterinaria M&L',
                            ),
                          ),
                        );
                      },
                      child: const Text('Ver licencias'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cerrar'),
                    ),
                  ],
                );
              },
            );
          },
        ),

        const ListTile(
          leading: Icon(Icons.phone_android_outlined),
          title: Text('Versión'),
          subtitle: Text('1.0.0'),
        ),
      ],
    );
  }
}
