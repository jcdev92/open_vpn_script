# start_vpn.sh

Este script está diseñado para iniciar una conexión VPN basada en la entrada del usuario. Permite al usuario seleccionar un directorio principal que contiene subdirectorios con archivos `.ovpn`, y luego procesa cada subdirectorio para encontrar e iniciar una conexión VPN. El script utiliza el comando `openvpn` para iniciar la conexión VPN.

## Requisitos

- El script debe encontrarse en el mismo directorio que las subcarpetas con las llaves "open vpn keys".
- El archivo `pass.txt` debe existir en el mismo directorio que el script y debe contener las credenciales de autenticación para la conexión VPN.
- El comando `openvpn` debe estar disponible en el sistema.

## Uso

### Ejemplo de Uso

```bash
./start_vpn.sh /ruta/a/carpeta/principal
