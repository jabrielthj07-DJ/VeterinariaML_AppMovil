import 'package:flutter/material.dart';
import '../../../../Core/Routes/team_data.dart';

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

  // MODIFICADO: método único para cambiar el tema
  void seleccionarTema() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Modo de tema'),
          content: RadioGroup<ThemeMode>(
            groupValue: TemaApp.tema.value,
            onChanged: (valor) {
              if (valor == null) return;

              TemaApp.tema.value = valor;
              Navigator.pop(dialogContext);
              setState(() {});
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<ThemeMode>(
                  title: Text('Claro'),
                  value: ThemeMode.light,
                ),
                RadioListTile<ThemeMode>(
                  title: Text('Oscuro'),
                  value: ThemeMode.dark,
                ),
                RadioListTile<ThemeMode>(
                  title: Text('Sistema'),
                  value: ThemeMode.system,
                ),
              ],
            ),
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
        Text(
          'Apariencia',
          style: Theme.of(context).textTheme.titleMedium,
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

        Text(
          'Notificaciones',
          style: Theme.of(context).textTheme.titleMedium,
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

        Text(
          'Preferencias',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),

        const ListTile(
          leading: Icon(Icons.language_outlined),
          title: Text('Idioma'),
          subtitle: Text('Español'),
        ),

        const Divider(),

        Text(
          'Información',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),

        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Acerca de la aplicación'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
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
                        Navigator.pop(dialogContext);
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
                      onPressed: () => Navigator.pop(dialogContext),
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
