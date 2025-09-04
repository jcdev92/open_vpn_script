# start_vpn.sh

Este script está diseñado para iniciar una conexión VPN basada en la entrada del usuario. Permite al usuario seleccionar un directorio principal que contiene subdirectorios con archivos `.ovpn`, y luego procesa cada subdirectorio para encontrar e iniciar una conexión VPN. El script utiliza el comando `openvpn` para iniciar la conexión VPN.

## Requisitos

- El comando `openvpn` debe estar disponible en el sistema.
- Debes crear un archivo llamado `pass.txt` en el mismo directorio que el script. Este archivo debe contener el usuario y la contraseña en dos líneas, por ejemplo:

	```
	usuarioVPN
	contrasenaVPN
	```

- Debes crear una carpeta llamada `keys` en el mismo directorio que el script. Dentro de la carpeta `keys`, guarda los archivos de configuración `.ovpn` en subcarpetas separadas según el servidor, por ejemplo:
	- `keys/us1-keys/` para las llaves del servidor US1
	- `keys/us2-keys/` para las llaves del servidor US2
	Puedes crear más carpetas siguiendo este formato.

## Uso

Simplemente ejecuta el script `start_vpn.sh`:

```bash
./start_vpn.sh
```

El script te guiará para seleccionar la carpeta de llaves y el archivo de configuración a utilizar.

## Contribuciones

Las contribuciones son bienvenidas. Si tienes alguna sugerencia o mejora, no dudes en abrir un issue o enviar un pull request.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.