#!/bin/bash
#
# Useful shell functions for developers / Funciones útiles para desarrolladores
# Repository: https://github.com/[tu-usuario]/shell-functions
#

# ------------------------------------------------------------------------------
# HTTP Server / Servidor HTTP
# ------------------------------------------------------------------------------
function serve_http() {
    # Starts a quick HTTP server (port 8080) / Inicia un servidor HTTP rápido (puerto 8080)
    # Usage: serve_http / Uso: serve_http
    python3 -m http.server 8080
}

# ------------------------------------------------------------------------------
# Clean Command History / Limpiar Historial
# ------------------------------------------------------------------------------
function clean_logs() {
    # Limpiar historial en memoria para todas las shells posibles
    history -c 2>/dev/null  # Bash
    [ -n "$ZSH_VERSION" ] && history -p 2>/dev/null  # Zsh

    # Limpiar todos los archivos de historial conocidos
    echo "" > ~/.bash_history 2>/dev/null
    echo "" > ~/.zsh_history 2>/dev/null
    echo "" > ~/.fish_history 2>/dev/null
    echo "" > ~/.local/share/fish/fish_history 2>/dev/null

    # Forzar escritura inmediata (Bash)
    [ -n "$BASH_VERSION" ] && history -w

    # Limpiar historial en sistemas con HISTFILE diferente
    local alt_hist=("${HISTFILE}" "${HISTFILE:-~/.bash_history}" \
                   ~/.history "/tmp/history_${USER}" \
                   ~/.local/share/bash/history/bash_history)
    for file in "${alt_hist[@]}"; do
        [ -f "$file" ] && echo "" > "$file"
    done

    # Mensaje con instrucciones claras
    echo "[+] Historial limpiado completamente."
    echo "[+] IMPORTANTE: Cierra TODAS tus terminales ahora mismo."
    echo "[+] Abre una nueva terminal y verás el historial limpio."

    # Opcional: Matar todas las terminales (cuidado, esto cerrará tus terminales)
    # pkill -9 -f "terminal" 2>/dev/null || true
}
# ------------------------------------------------------------------------------
# Fast Git Clone / Clonación Rápida de Git
# ------------------------------------------------------------------------------
function gitfast() {
    # Clones repo with depth=1 and enters directory / Clona repo con depth=1 y entra al directorio
    # Usage: gitfast <repo-url> / Uso: gitfast <url-repo>
    if [ -z "$1" ]; then
        echo "Usage: gitfast <repo-url> / Uso: gitfast <url-repo>"
        return 1
    fi
    
    repo=$(basename "$1" .git)
    echo "[*] Cloning $repo... / Clonando $repo..."
    git clone --depth 1 "$1" && cd "$repo" || return 1
}

# ------------------------------------------------------------------------------
# Clean File Metadata / Limpiar Metadatos
# ------------------------------------------------------------------------------
function metaclean() {
    # Remove metadata from files (requires exiftool) / Elimina metadatos de archivos (requiere exiftool)
    # Usage: metaclean <file> / Uso: metaclean <archivo>
    if [ -z "$1" ]; then
        echo "Usage: metaclean <file> / Uso: metaclean <archivo>"
        return 1
    fi
    
    if ! command -v exiftool &> /dev/null; then
        echo "[!] exiftool required. Install with: / Requiere exiftool. Instale con:"
        echo "    sudo apt install exiftool  # Debian/Ubuntu"
        echo "    brew install exiftool      # macOS"
        return 1
    fi
    
    echo "[*] Cleaning metadata from $1... / Eliminando metadatos de $1..."
    exiftool -all= "$1"
    echo "[+] Metadata removed. / Metadatos eliminados."
}

# ------------------------------------------------------------------------------
# Installation Instructions / Instrucciones de Instalación
# ------------------------------------------------------------------------------

# 1. Identify your shell / Identifique su shell:
#    echo $SHELL
#
# 2. Add to config file / Agregue al archivo de configuración:
#    - bash: ~/.bashrc
#    - zsh: ~/.zshrc
#
# 3. Reload configuration / Recargue configuración:
#    source ~/.bashrc  # or / o source ~/.zshrc
