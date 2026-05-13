#!/bin/bash

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE} Iniciando instalacion de Omarchy Terra Islands...${NC}"

# 1. Crear directorios si no existen
mkdir -p ~/.config/waybar

# 2. Backups automaticos
echo -e "${BLUE} Creando copias de seguridad...${NC}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
[ -f ~/.config/waybar/config.jsonc ] && cp ~/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc.bak_$TIMESTAMP
[ -f ~/.config/waybar/style.css ] && cp ~/.config/waybar/style.css ~/.config/waybar/style.css.bak_$TIMESTAMP
[ -f ~/.config/omarchy/current/theme/walker.css ] && cp ~/.config/omarchy/current/theme/walker.css ~/.config/omarchy/current/theme/walker.css.bak_$TIMESTAMP

# 3. Copiar archivos
echo -e "${BLUE} Aplicando nueva configuracion...${NC}"
cp waybar/config.jsonc ~/.config/waybar/
cp waybar/style.css ~/.config/waybar/
cp walker/walker.css ~/.config/omarchy/current/theme/

# 4. Reiniciar servicios
echo -e "${BLUE} Reiniciando Waybar...${NC}"
if command -v omarchy-restart-waybar &> /dev/null; then
    omarchy-restart-waybar
    else
        pkill waybar && waybar &
        fi

        echo -e "${GREEN} Instalacion completada con exito!${NC}"
        echo -e "Si algo no se ve bien, tus backups estan en ~/.config/waybar/ con el sufijo .bak_$TIMESTAMP"
        
