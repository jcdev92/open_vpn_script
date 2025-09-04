# start_vpn.sh

Este script está diseñado para iniciar una conexión VPN basada en la entrada del usuario. Permite al usuario seleccionar un directorio principal que contiene subdirectorios con archivos `.ovpn`, y luego procesa cada subdirectorio para encontrar e iniciar una conexión VPN. El script utiliza el comando `openvpn` para iniciar la conexión VPN.

## Requisitos

- El script debe encontrarse en el mismo directorio que las subcarpetas con las llaves "open vpn keys".
- Debes crear un archivo llamado `pass.txt` en el mismo directorio que el script. Este archivo debe contener el usuario y la contraseña en dos líneas, por ejemplo:

	```
	usuarioVPN
	contrasenaVPN
	```

- Guarda los archivos de configuración `.ovpn` en carpetas separadas según el servidor, por ejemplo:
	- `us1-keys/` para las llaves del servidor US1
	- `us2-keys/` para las llaves del servidor US2
	Puedes crear más carpetas siguiendo este formato.

- El comando `openvpn` debe estar disponible en el sistema.

## Uso

### Ejemplo de Uso

```bash
./start_vpn.sh /ruta/a/carpeta/principal
