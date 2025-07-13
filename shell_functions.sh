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
    # Clears shell history / Limpia el historial de comandos
    # Usage: clean_logs / Uso: clean_logs
    history -c
    echo "" > ~/.bash_history
    echo "[*] History cleaned. / Historial limpiado."
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